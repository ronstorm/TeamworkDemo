//
//  ProjectDetailViewController.swift
//  TeamworkDemo
//
//  Created by Bluscheme on 6/17/17.
//  Copyright © 2017 RonStorm Inc. All rights reserved.
//

import UIKit

class ProjectDetailViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var childView: UIView!
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionHeightLC: NSLayoutConstraint!
    @IBOutlet weak var childViewHeightLC: NSLayoutConstraint!
    
    var project: Project!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        childView.frame.size.width = view.frame.size.width
        scrollView.contentSize = childView.frame.size
        
        setupViewData()
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
    
    func setupViewData() {
        nameLabel.text = (project.name)!
        companyLabel.text = (project.company?.name)!
        categoryLabel.text = (project.category?.name)!
        descriptionLabel.text = (project.description)!
        
        TeamworkApp.sharedInstance.apiService.setImageFromURL(url: (project.logoUrl)!, imageView: logoView, isRoundedToCircle: true)
        
        let stringHeight = project.description?.height(withConstrainedWidth: descriptionLabel.frame.size.width, font: descriptionLabel.font)
        descriptionHeightLC.constant = stringHeight! + 5.0
        
        self.childViewHeightLC.constant = descriptionLabel.frame.origin.y + descriptionHeightLC.constant + 20.0
        self.scrollView.contentSize.height = self.childViewHeightLC.constant
    }
}
