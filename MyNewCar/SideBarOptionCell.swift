//
//  SideBarOptionCell.swift
//  MyNewCar
//
//  Created by ProjectHeena on 4/4/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class SideBarOptionCell: UITableViewCell
{

    @IBOutlet weak var sideBarIcon: UIImageView!
    
    @IBOutlet weak var sideBarOption: UILabel!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
