//
//  Materials.swift
//  MC2-Eureka
//
//  Created by Jenifer Yolanda on 20/05/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//

import UIKit

class Materials: UIViewController {

    @IBOutlet weak var classImg: UIImageView!
    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var classCode: UILabel!
    @IBOutlet weak var classLecturer: UILabel!
    @IBOutlet weak var classStudents: UILabel!
    @IBOutlet weak var completionRate: UILabel!
    @IBOutlet weak var materialListTable: UITableView!
    
    struct Material: Decodable  {
        var materialName: String
        var materialDescription : String
        var materialDeadline : String
    }
       
    var materials = [Material]()
       
    func loadMaterials() {
        let path = Bundle.main.path(forResource: "mathematics", ofType: "json")
        let contents = try! String(contentsOfFile: path!)
        let jsonData = contents.data(using: .utf8)!
           
        materials = try! JSONDecoder().decode([Material].self, from: jsonData)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //circular image
        classImg.layer.borderWidth = 1
        classImg.layer.masksToBounds = false
        classImg.layer.borderColor = UIColor.black.cgColor
        classImg.layer.cornerRadius = classImg.frame.width/2
        classImg.clipsToBounds = true
        
        loadMaterials()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return materials.count
    }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDetail", for: indexPath) as! MaterialTableViewCell
             
        let material = materials[indexPath.row]
        cell.materialName.text = material.materialName
        cell.materialDesc.text = material.materialDescription
        cell.materialDeadline.text = material.materialDeadline
         
        return cell
    }
     
}
