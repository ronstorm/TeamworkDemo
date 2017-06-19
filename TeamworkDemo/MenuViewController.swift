//
//  MenuViewController.swift
//  TeamworkDemo
//
//  Created by Bluscheme on 6/17/17.
//  Copyright © 2017 RonStorm Inc. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var closeMemnuBtn: UIButton!
    @IBOutlet weak var menuTableView: UITableView!

    var arrayMenuOptions = [Dictionary<String,String>]()
    
    var menuBtn : UIButton!
    var delegate: SlideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        menuTableView.dataSource = self
        menuTableView.delegate = self
        
        updateArrayMenuOptions()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func closeMenuBtnPressed(_ sender: UIButton) {
        menuBtn.tag = 0
        
        if (self.delegate != nil) {
            var index = Int(sender.tag)
            if(sender == self.closeMemnuBtn){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParentViewController()
        })
    }

    func updateArrayMenuOptions(){
        
        arrayMenuOptions.append(["title":"Projects", "icon":"project"])
        arrayMenuOptions.append(["title":"Categories", "icon":"category"])
        
        menuTableView.reloadData()
    }
    
    
    // Tableview Datasource and delegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        cell.selectionStyle = UITableViewCellSelectionStyle.gray
//        cell.layoutMargins = UIEdgeInsets.zero
//        cell.preservesSuperviewLayoutMargins = false
//        cell.backgroundColor = UIColor.clear
        
        cell.menuImageView.image = UIImage(named: arrayMenuOptions[indexPath.row]["icon"]!)
        cell.menuTitle.text = arrayMenuOptions[indexPath.row]["title"]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButtonType.custom)
        btn.tag = indexPath.row
        self.closeMenuBtnPressed(btn)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenuOptions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
