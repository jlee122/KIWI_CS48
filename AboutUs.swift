//
//  AboutUs.swift
//  Volantes2
//
//  Created by Ben Ye on 4/24/19.
//  Copyright © 2019 Ben Ye. All rights reserved.
//

import UIKit

class AboutUs: UIViewController {
    
    @IBAction func GoBack(_ sender: UIButton) {
        performSegue(withIdentifier: "aboutback", sender: self)
    }
    
    @IBOutlet weak var kiwi: UILabel!
    @IBOutlet weak var kalyn_pic: UIImageView!
    @IBOutlet weak var alex_pic: UIImageView!
    @IBOutlet weak var ben_pic: UIImageView!
    @IBOutlet weak var dawit_pic: UIImageView!
    @IBOutlet weak var joon_pic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //make image borders round
        kalyn_pic.layer.cornerRadius = kalyn_pic.frame.size.width / 2;
        kalyn_pic.clipsToBounds = true;
        alex_pic.layer.cornerRadius = alex_pic.frame.size.width / 2;
        alex_pic.clipsToBounds = true;
        ben_pic.layer.cornerRadius = ben_pic.frame.size.width / 2;
        ben_pic.clipsToBounds = true;
        dawit_pic.layer.cornerRadius = dawit_pic.frame.size.width / 2;
        dawit_pic.clipsToBounds = true;
        joon_pic.layer.cornerRadius = joon_pic.frame.size.width / 2;
        joon_pic.clipsToBounds = true;
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
