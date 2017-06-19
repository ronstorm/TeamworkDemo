//
//  ProjectCell.swift
//  TeamworkDemo
//
//  Created by Bluscheme on 6/17/17.
//  Copyright © 2017 RonStorm Inc. All rights reserved.
//

import UIKit

class ProjectCell: UITableViewCell {
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var projectDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
