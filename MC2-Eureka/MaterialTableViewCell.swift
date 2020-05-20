//
//  MaterialTableViewCell.swift
//  MC2-Eureka
//
//  Created by Jenifer Yolanda on 20/05/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//

import UIKit

class MaterialTableViewCell: UITableViewCell {

    @IBOutlet weak var materialName: UILabel!
    @IBOutlet weak var materialDesc: UILabel!
    @IBOutlet weak var materialDeadline: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
