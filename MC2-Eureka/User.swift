//
//  User.swift
//  MC2-Eureka
//
//  Created by Sherwin Yang on 20/05/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//

import Foundation

class User {
    
    var id: String
    var name: String
    var email: String
    var gender: String
    var role: String
    
    init(id: String, name: String, email: String, gender: String, role: String) {
        self.id = id
        self.name = name
        self.email = email
        self.gender = gender
        self.role = role
    }
    
}
