//
//  HeaderMenuCell.swift
//  E-Service
//
//  Created by Rumah Ulya on 04/09/18.
//  Copyright © 2018 Rumah Ulya. All rights reserved.
//

import UIKit

class HeaderMenuCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
