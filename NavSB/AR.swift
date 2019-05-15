//
//  AR.swift
//  Volantes2
//
//  Created by Ben Ye on 4/24/19.
//  Copyright © 2019 Ben Ye. All rights reserved.
//

import UIKit
import SceneKit
import MapKit
import CoreLocation
import ARCL

class AR: UIViewController {
    
    var sceneLocationView = SceneLocationView()
    let manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneLocationView.run()
        view.addSubview(sceneLocationView)
        let lat:CLLocationDegrees = manager.location!.coordinate.latitude
        let long:CLLocationDegrees = manager.location!.coordinate.longitude
        //print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        //let coordinate = CLLocationCoordinate2D(latitude: 34.413482666015625, longitude: -119.84127325258571)
        //let location = CLLocation(coordinate: coordinate, altitude: 0)
        //let image = UIImage(named: "csil1")!
        
        let annotationNode = buildViewNode(latitude: lat, longitude: long, altitude: 0, text: "map logo")
        sceneLocationView.addLocationNodeWithConfirmedLocation(locationNode: annotationNode)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        sceneLocationView.frame = view.bounds
    }
    
    func buildViewNode(latitude: CLLocationDegrees, longitude: CLLocationDegrees,
                       altitude: CLLocationDistance, text: String) -> LocationAnnotationNode {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let location = CLLocation(coordinate: coordinate, altitude: altitude)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        label.text = text
        label.backgroundColor = .green
        label.textAlignment = .center
        return LocationAnnotationNode(location: location, view: label)
    }
    
    func buildNode(latitude: CLLocationDegrees, longitude: CLLocationDegrees,
                   altitude: CLLocationDistance, imageName: String) -> LocationAnnotationNode {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let location = CLLocation(coordinate: coordinate, altitude: altitude)
        let image = UIImage(named: imageName)!
        return LocationAnnotationNode(location: location, image: image)
    }
    
    @IBAction func GoBack(_ sender: UIButton) {
        performSegue(withIdentifier: "arback", sender: self)
    }
    

}
