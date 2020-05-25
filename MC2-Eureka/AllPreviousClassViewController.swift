//
//  AllPreviousClassViewController.swift
//  MC2-Eureka
//
//  Created by Sherwin Yang on 23/05/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//

import UIKit

class AllPreviousClassViewController: UIViewController {
    
    var allPreviousClasses = [Class]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}

extension AllPreviousClassViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPreviousClasses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "prevClassCell", for: indexPath) as? PreviousClassTableViewCell {
            cell.prevClassImage.image = allPreviousClasses[indexPath.row].image
            cell.prevClassSubjectLabel.text = allPreviousClasses[indexPath.row].subject_name
            cell.prevClassNameLabel.text = allPreviousClasses[indexPath.row].class_name
            cell.prevClassCodeLabel.text = allPreviousClasses[indexPath.row].class_code
            return cell
        }
        return PreviousClassTableViewCell()
    }
}
