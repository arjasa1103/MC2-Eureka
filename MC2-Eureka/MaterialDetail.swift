//
//  MaterialDetail.swift
//  MC2-Eureka
//
//  Created by Jenifer Yolanda on 20/05/20.
//  Copyright © 2020 Arjasa Virya Aryanera. All rights reserved.
//

import UIKit
import AVKit

class MaterialDetail: UIViewController {

    @IBOutlet weak var materialName: UILabel!
    @IBOutlet weak var materialDesc: UILabel!
    
    struct Material: Decodable  {
        var materialName: String
        var materialDetails: String
    }
    
    var materialds = [Material]()
    
    func loadMaterialds() {
        let path = Bundle.main.path(forResource: "mathematics", ofType: "json")
        let contents = try! String(contentsOfFile: path!)
        let jsonData = contents.data(using: .utf8)!
        
        materialds = try! JSONDecoder().decode([Material].self, from: jsonData)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadMaterialds()
         
        materialName.text = materialds[0].materialName
        materialDesc.text = materialds[0].materialDetails
    }

    @IBAction func playVid(_ sender: Any) {
        guard let videoURL = URL(string: "https://www.youtube.com/watch?v=JiU1Iv7jM-c&t=3s")else{
            return
        }
        
        let player = AVPlayer(url: videoURL)
        let playerController = AVPlayerViewController()
        playerController.player = player
        
        present(playerController, animated: true){
            player.play()
        }
    }
    
    @IBAction func externalLinkClicked(_ sender: Any) {
        if let url = URL(string: "http://www.google.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBAction func downloadableLinkClicked(_ sender: Any) {
        if let url = URL(string: "http://www.google.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    @IBAction func testClicked(_ sender: Any) {
        //self.performSegue(withIdentifier: "testpage", sender: self)
    }
    
}
