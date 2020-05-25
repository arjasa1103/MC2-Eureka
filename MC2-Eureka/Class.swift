//
//  Class.swift
//  MC2-Eureka
//
//  Created by Sherwin Yang on 20/05/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//

import Foundation
import UIKit

class Class {
    
    var class_code: String
    var subject_name: String
    var class_name: String
    var image: UIImage
    var completionStatus: Bool
    var lecturer_name: String
    var totalStudent: Int

    init(class_code: String, subject_name: String, class_name: String, image: UIImage, completionStatus: Bool, lecturer_name: String, totalStudent: Int) {
        self.class_code = class_code
        self.subject_name = subject_name
        self.class_name = class_name
        self.image = image
        self.completionStatus = completionStatus
        self.lecturer_name = lecturer_name
        self.totalStudent = totalStudent
    }
    
}
