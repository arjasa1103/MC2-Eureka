//
//  PreviousClassTableViewCell.swift
//  MC2-Eureka
//
//  Created by Sherwin Yang on 20/05/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//

import UIKit

class PreviousClassTableViewCell: UITableViewCell {
    
    @IBOutlet weak var classImage: UIImageView!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var classCodeLabel: UILabel!
    
    @IBOutlet var prevClassImage: UIImageView!
    @IBOutlet var prevClassSubjectLabel: UILabel!
    @IBOutlet var prevClassNameLabel: UILabel!
    @IBOutlet var prevClassCodeLabel: UILabel!
    
    override func layoutSubviews() {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
