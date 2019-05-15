//
//  InteractiveMap.swift
//  Volantes2
//
//  Created by Ben Ye on 4/24/19.
//  Copyright © 2019 Ben Ye. All rights reserved.
//

import UIKit
import Mapbox
import CoreLocation



class InteractiveMap: UIViewController, MGLMapViewDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MGLMapView!
    
    @IBOutlet weak var styleToggle: UISegmentedControl!
    
    @IBAction func changeStyle(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.styleURL = MGLStyle.satelliteStyleURL
        case 1:
            mapView.styleURL = MGLStyle.streetsStyleURL
        case 2:
            mapView.styleURL = MGLStyle.lightStyleURL
        default:
            mapView.styleURL = MGLStyle.streetsStyleURL
        }
    }
    
    @IBAction func GoBack(_ sender: UIButton) {
        tappedbutton = "goback"
        self.performSegue(withIdentifier: "mapback", sender: self)
    }
    
    func mapView(_ mapView: MGLMapView, rightCalloutAccessoryViewFor annotation: MGLAnnotation) -> UIView? {
        return UIButton(type: .detailDisclosure)
    }
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        // Always allow callouts to popup when annotations are tapped.
        return true
    }
    
    func mapView(_ mapView: MGLMapView, didSelect annotation: MGLAnnotation) {
        let camera = MGLMapCamera(lookingAtCenter: annotation.coordinate, acrossDistance: 4500, pitch: 15, heading: 0)
        mapView.fly(to: camera, withDuration: 4,
                    peakAltitude: 3000, completionHandler: nil)
    }
    

    var nameText = "This is library";
    var imageText = "ucsb";
    var tappedbutton = ""
    
    func mapView(_ mapView: MGLMapView, annotation: MGLAnnotation, calloutAccessoryControlTapped control: UIControl) {
        // Hide the callout view.
        mapView.deselectAnnotation(annotation, animated: false)
        tappedbutton = annotation.title as! String
        performSegue(withIdentifier: "picsegue", sender: self)
        //segue with a switch case
        //UCSB, Phelps Hall, Campbell Hall, UCSB Library, Student Resource Building
        //ucsb, phelps, campbell, library, srb
        //print(annotation.title!!)
        // Show an alert containing the annotation's details
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch tappedbutton {
        case "UCSB":
            print("UCSB")
            nameText = "This is UCSB"
            imageText = "ucsb"
            break;
        case "Phelps Hall":
            print("Phelps")
            nameText = "This is Phelps Hall"
            imageText = "phelps"
            break;
        case "Campbell Hall":
            print("Campbell")
            nameText = "This is Campbell"
            imageText = "campbell"
            break;
        case "UCSB Library":
            print("UCSB Library")
            nameText = "This is Library"
            imageText = "library"
        case "Student Resource Building":
            print("SRB")
            nameText = "This is SRB"
            imageText = "srb"
            break;
        default:
            print("default")
            nameText = "This is UCSB"
            imageText = "default"
            break;
        }
        if tappedbutton != "goback" {
        var vc = segue.destination as! Information
        vc.finalName = self.nameText
        vc.finalPicture = self.imageText
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        mapView.setCenter(CLLocationCoordinate2D(latitude: 34.4140, longitude: -119.8489), zoomLevel: 15, animated: false)
        view.addSubview(mapView)
        
        // Add a point annotation
        let annotation = MGLPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 34.4140, longitude: -119.8489)
        annotation.title = "UCSB"
        annotation.subtitle = "University of California, Santa Barbara"
        mapView.addAnnotation(annotation)
        
        // Add a pinpoint of buildings in campus
        let phelpsHall = MGLPointAnnotation()
        phelpsHall.coordinate = CLLocationCoordinate2D(latitude: 34.416133, longitude: -119.844661)
        phelpsHall.title = "Phelps Hall"
        mapView.addAnnotation(phelpsHall)
        
        let campbellHall = MGLPointAnnotation()
        campbellHall.coordinate = CLLocationCoordinate2D(latitude: 34.416274, longitude: -119.845304)
        campbellHall.title = "Campbell Hall"
        mapView.addAnnotation(campbellHall)
        
        let library = MGLPointAnnotation()
        library.coordinate = CLLocationCoordinate2D(latitude: 34.41369, longitude: -119.845562)
        library.title = "UCSB Library"
        mapView.addAnnotation(library)
        
        let srb = MGLPointAnnotation()
        srb.coordinate = CLLocationCoordinate2D(latitude: 34.412699, longitude: -119.852686)
        srb.title = "Student Resource Building"
        mapView.addAnnotation(srb)
        
        // Set the map view's delegate
        mapView.delegate = self
        
        // Allow the map view to display the user's location
        mapView.showsUserLocation = true
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            //set up location manager
            setupLocationManager()
            checkLocationAuthorization()
            print("locationServicesEnabled")
        }
        else {
            //send alert
            print("locationServicesDisabled")
            
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
            // Request when-in-use authorization initially
            
        case .authorizedWhenInUse:
            //Do Map Stuff
            print("AuthorizedWhenInUse");
            mapView.showsUserLocation = true
            break;
        case .denied:
            print("Denied");
            // Show Alert
            break
        case .notDetermined:
            print("notDetermined"); locationManager.requestWhenInUseAuthorization()
            break;
        case .restricted:
            print("restricted");
            //Show Alert
            break;
        case .authorizedAlways:
            print("AuthorizedAlways")
            //Not asking?
            break;
        }
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

}

extension InteractiveMap: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //checkLocationAuthorization()
    }
}

