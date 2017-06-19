//
//  CategoryListViewController.swift
//  TeamworkDemo
//
//  Created by Bluscheme on 6/17/17.
//  Copyright © 2017 RonStorm Inc. All rights reserved.
//

import UIKit
import EZAlertController
import ReactiveKit

class CategoryListViewController: BaseViewController, UITableViewDelegate {

    @IBOutlet weak var categoryTableView: UITableView!
    
    private let viewModel = CategoryViewModel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addSlideMenuButton()
        
        categoryTableView.delegate = self
        
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
        viewModel.fullCategoryList.bind(to: categoryTableView, animated: true) { (categories, indexPath, tableView) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
            
            let category = categories[indexPath.row]
            
            cell.textLabel?.text = (category.name)!
            cell.detailTextLabel?.text = "Project Count: \((category.elementsCount)!)"
            
            return cell
        }
        
        _ = viewModel.errorMessage.observeNext(with: { (title, msg) in
            EZAlertController.alert(title, message: msg)
        })
    }
    
    // UITableview delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let catId = (viewModel.fullCategoryList[indexPath.row].id)!
        let catName = (viewModel.fullCategoryList[indexPath.row].name)!
        
        let projectVC = self.storyboard?.instantiateViewController(withIdentifier: "ProjectListViewController") as! ProjectListViewController
        projectVC.catId = catId
        projectVC.navigationItem.title = "\(catName)"
        self.navigationController?.pushViewController(projectVC, animated: true)
    }
}
