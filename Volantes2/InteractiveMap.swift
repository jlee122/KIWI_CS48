//
//  InteractiveMap.swift
//  Volantes2
//
//  Created by Ben Ye on 4/24/19.
//  Copyright © 2019 Ben Ye. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class InteractiveMap: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func goBack(_ sender: UIButton) {
        performSegue(withIdentifier: "mapback", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
    


