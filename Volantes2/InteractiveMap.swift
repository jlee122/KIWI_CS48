//
//  InteractiveMap.swift
//  Volantes2
//
//  Created by Ben Ye on 4/24/19.
//  Copyright © 2019 Ben Ye. All rights reserved.
//

import UIKit
import Mapbox
import MapboxNavigation
import MapboxDirections
import MapboxCoreNavigation

class InteractiveMap: UIViewController, MGLMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapView = MGLMapView(frame: self.view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
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
        campbellHall.title = "Campbel Hall"
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
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        // Always allow callouts to popup when annotations are tapped.
        return true
    }
    
    func mapView(_ mapView: MGLMapView, didSelect annotation: MGLAnnotation) {
        let camera = MGLMapCamera(lookingAtCenter: annotation.coordinate, acrossDistance: 4500, pitch: 15, heading: 0)
        mapView.fly(to: camera, withDuration: 4,
                    peakAltitude: 3000, completionHandler: nil)
    }
    
//    @IBAction func GoBack(_ sender: UIButton) {
//        performSegue(withIdentifier: "mapback", sender: self)
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
