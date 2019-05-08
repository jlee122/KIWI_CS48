//
//  ViewController.swift
//  Volantes2
//
//  Created by Ben Ye on 4/24/19.
//  Copyright © 2019 Ben Ye. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var Map: UIButton!
    @IBOutlet weak var AR: UIButton!
    @IBOutlet weak var Help: UIButton!
    @IBOutlet weak var About: UIButton!
    @IBOutlet weak var NavSB: UILabel!
    
    //CHECK LOACTION SERVICES
    let locationManager = CLLocationManager()
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // Show alert letting the user know they have to turn this on.
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            //startTackingUserLocation()
            break
        case .denied:
            // Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        }
    }
    
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
        checkLocationServices()
    }
    
    @IBAction func MapSegue(_ sender: UIButton) {
        performSegue(withIdentifier: "mapsegue", sender: self)
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


extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

