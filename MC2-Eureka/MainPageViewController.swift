//
//  MainPageViewController.swift
//  MC2-Eureka
//
//  Created by Sherwin Yang on 15/05/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//

import UIKit
import CoreData

class MainPageViewController: UIViewController {
    
    @IBOutlet weak var classCodeTextField: UITextField!
    @IBOutlet weak var previousClassesTableView: UITableView!
    
    var subjects = "Sherwin"
    
    var userData = [Users]()
    var classData = [Classes]()
    var classDetailData = [ClassDetails]()
    var materialDetailData = [MaterialDetails]()
    
    var user: User? = nil
    var ongoingClasses = [Class]()
    var previousClasses = [Class]()
    
    var selectedItem: Int?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.changeClassCodeTextFieldProperties()
        self.load()
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func seeMoreButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "allPrevClasses", sender: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.classCodeTextField.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "allPrevClasses" {
                if let destination = segue.destination as? AllPreviousClassViewController {
                    destination.allPreviousClasses = previousClasses
                }
            }
//            // segue to class material
//            else if identifier == "intoClass" {
//                if let destination = segue.destination as? MaterialViewController {
//                    destination.detailClass = c[selectedItem]
//                }
//            }
        }
    }
    
    func changeClassCodeTextFieldProperties() {
        self.classCodeTextField.layer.borderColor = CGColor(srgbRed: 237/256, green: 237/256, blue: 237/256, alpha: 1.0)
        self.classCodeTextField.layer.cornerRadius = 18
        self.classCodeTextField.layer.borderWidth = 1
        self.classCodeTextField.layer.masksToBounds = true
        self.classCodeTextField.attributedPlaceholder = NSAttributedString(string: "Type your class code here..",
                                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 111/256, green: 136/256, blue: 198/256, alpha: 1.0), NSAttributedString.Key.font: UIFont.italicSystemFont(ofSize: 12.0)])
    }
    
    func isThereClass() -> Bool {
        for i in 0..<classData.count {
            if classData[i].class_code == classCodeTextField.text {
                return true
            }
        }
        return false
    }
    
    func registerToClass() {
        if !isThereClass() {
            
        }
        else {
            let newClassDetail = ClassDetails.init(context: self.context)
            
            newClassDetail.class_code = classCodeTextField.text
            
        }
    }
    
    func addNewClass() {
        let newClass = Classes.init(context: self.context)
        
        // convert image to binary data
        let image = UIImage(named: "mathematic.png")
        let imageData = image?.pngData()
        
        // add newClass properties
        newClass.class_code = "EAA111"
        newClass.class_name = "Calculus 2"
        newClass.subject_name = "Mathematic"
        newClass.image = imageData
        newClass.completionStatus = true
        newClass.lecturer_name = "Syahputra"
        newClass.total_student = 30
        
        classData.append(newClass)
        
        self.save()
    }
    
    // MARK: - Model Data Manipulation

    func load() {
        let requestUser: NSFetchRequest<Users> = Users.fetchRequest()
        let requestClass : NSFetchRequest<Classes> = Classes.fetchRequest()
        let requestClassDetail : NSFetchRequest<ClassDetails> = ClassDetails.fetchRequest()
        let requestMaterialDetail : NSFetchRequest<MaterialDetails> = MaterialDetails.fetchRequest()
        
        do {
            self.userData = try context.fetch(requestUser)
            self.classData = try context.fetch(requestClass)
            self.classDetailData = try context.fetch(requestClassDetail)
            self.materialDetailData = try context.fetch(requestMaterialDetail)
            self.setPreviousClasses()
            self.setOngoingClass()
        } catch {
            print("Error fetching data from context \(error)")
        }
    }

    func save() {
        do {
            try context.save()
        } catch {
            print("Error fetching data from context \(error)")
        }
    }
    
}

// MARK: - Collection View

extension MainPageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func setOngoingClass() {
        for i in 0..<classData.count {
            if classData[i].completionStatus == true {
                let theImage = UIImage(data: classData[i].image!)
                let theClass = Class(class_code: classData[i].class_code!, subject_name: classData[i].subject_name!, class_name: classData[i].class_name!, image: theImage!, completionStatus: classData[i].completionStatus, lecturer_name: classData[i].lecturer_name!, totalStudent: Int(classData[i].total_student))
                ongoingClasses.append(theClass)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ongoingClasses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "classCell", for: indexPath) as? ClassCollectionViewCell {
            cell.classImage.image = ongoingClasses[indexPath.row].image
            cell.subjectLabel.text = ongoingClasses[indexPath.row].subject_name
            cell.classLabel.text = ongoingClasses[indexPath.row].class_name
            return cell
        }
        return ClassCollectionViewCell()
    }
}

// MARK: - Table View

extension MainPageViewController: UITableViewDataSource, UITableViewDelegate {
    func setPreviousClasses() {
        for i in 0..<classData.count {
        if classData[i].completionStatus == false {
            let theImage = UIImage(data: classData[i].image!)
            let theClass = Class(class_code: classData[i].class_code!, subject_name: classData[i].subject_name!, class_name: classData[i].class_name!, image: theImage!, completionStatus: classData[i].completionStatus, lecturer_name: classData[i].lecturer_name!, totalStudent: Int(classData[i].total_student))
            previousClasses.append(theClass)
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return previousClasses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "prevClassCell", for: indexPath) as? PreviousClassTableViewCell {
            cell.classImage.image = previousClasses[indexPath.row].image
            cell.subjectLabel.text = previousClasses[indexPath.row].subject_name
            cell.classLabel.text = previousClasses[indexPath.row].class_name
            cell.classCodeLabel.text = previousClasses[indexPath.row].class_code
            return cell
        }
        return PreviousClassTableViewCell()
    }
    
}
