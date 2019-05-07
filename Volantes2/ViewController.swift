//
//  ViewController.swift
//  Volantes2
//
//  Created by Ben Ye on 4/24/19.
//  Copyright © 2019 Ben Ye. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Map: UIButton!
    @IBOutlet weak var AR: UIButton!
    @IBOutlet weak var Help: UIButton!
    @IBOutlet weak var About: UIButton!
    @IBOutlet weak var NavSB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Map.layer.cornerRadius = 10
        Map.clipsToBounds = true
        AR.layer.cornerRadius = 10
        AR.clipsToBounds = true
        Help.layer.cornerRadius = 10
        Help.clipsToBounds = true
        About.layer.cornerRadius = 10
        About.clipsToBounds = true
        Map.layer.borderWidth = 2
        AR.layer.borderWidth = 2
        Help.layer.borderWidth = 2
        About.layer.borderWidth = 2
        NavSB.layer.cornerRadius = 15
        NavSB.clipsToBounds = true
        NavSB.layer.borderWidth = 2
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func MapSegue(_ sender: UIButton) {
        //performSegue(withIdentifier: "mapsegue", sender: self)
    }
    @IBAction func ARSegue(_ sender: UIButton) {
        performSegue(withIdentifier: "arsegue", sender: self)
    }
    @IBAction func HelpSegue(_ sender: UIButton) {
        performSegue(withIdentifier: "helpsegue", sender: self)
    }
    @IBAction func AboutSegue(_ sender: UIButton) {
        performSegue(withIdentifier: "aboutsegue", sender: self)
    }
    
}

