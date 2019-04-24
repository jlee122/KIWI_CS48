//
//  AboutUs.swift
//  Volantes2
//
//  Created by Ben Ye on 4/24/19.
//  Copyright © 2019 Ben Ye. All rights reserved.
//

import UIKit

class AboutUs: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func GoBack(_ sender: UIButton) {
        performSegue(withIdentifier: "aboutback", sender: self)
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
