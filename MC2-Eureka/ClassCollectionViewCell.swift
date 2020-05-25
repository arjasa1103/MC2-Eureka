//
//  ClassCollectionViewCell.swift
//  MC2-Eureka
//
//  Created by Sherwin Yang on 17/05/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//

import UIKit

class ClassCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var classImage: UIImageView!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    
    override func layoutSubviews() {
        //set corner radius
        self.layer.cornerRadius = 15.0
       
        //add shadowy background
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.8
        self.layer.masksToBounds = false
        
        //set content corner radius so it follow it's parent cell corner radius
        self.contentView.layer.cornerRadius = 15.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
    }

}
