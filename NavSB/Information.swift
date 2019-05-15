//
//  Information.swift
//  NavSBtemplate
//
//  Created by Ben Ye on 5/7/19.
//  Copyright © 2019 Ben Ye. All rights reserved.
//

import UIKit

class Information: UIViewController {

    var finalName = "Nice"
    var finalPicture = "about"
    
    @IBOutlet weak var Picture: UIImageView!
    
    @IBOutlet weak var Descrip: UILabel!
    
    @IBOutlet weak var GoBackFunction: UIButton!
    
    @IBAction func GoBack(_ sender: Any) {
        performSegue(withIdentifier: "pictureback", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Picture.image = UIImage(named: finalPicture)
        Descrip.text = finalName
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
