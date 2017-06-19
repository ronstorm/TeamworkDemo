//
//  ProjectListViewController.swift
//  TeamworkDemo
//
//  Created by Bluscheme on 6/17/17.
//  Copyright © 2017 RonStorm Inc. All rights reserved.
//

import UIKit
import EZAlertController

class ProjectListViewController: BaseViewController, UITableViewDelegate {
    
    @IBOutlet weak var projectTableView: UITableView!
    
    var catId: String = ""
    
    private var viewModel: ProjectViewModel?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if catId == "" {
            addSlideMenuButton()
        }
//        addSlideMenuButton()
        // Do any additional setup after loading the view.
//        addSlideMenuButton()
        
        viewModel = ProjectViewModel.init(catId: catId)
        projectTableView.delegate = self
        bindViewModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func bindViewModel() {
        viewModel?.fullProjectList.bind(to: projectTableView, animated: true) { (projects, indexPath, tableView) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath) as! ProjectCell
            
            let project = projects[indexPath.row]
            
            if (project.logoUrl != nil) {
                TeamworkApp.sharedInstance.apiService.setImageFromURL(url: (project.logoUrl)!, imageView: cell.logo, isRoundedToCircle: true)
            }
            cell.projectName.text = (project.name)!
            cell.projectDescription.text = (project.description)!
            
            return cell
        }
        
        _ = viewModel?.errorMessage.observeNext(with: { (title, msg) in
            EZAlertController.alert(title, message: msg)
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let project = viewModel?.fullProjectList[indexPath.row]
        
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "ProjectDetailViewController") as! ProjectDetailViewController
        detailVC.project = project
        detailVC.navigationItem.title = "\((project?.name)!)"
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
