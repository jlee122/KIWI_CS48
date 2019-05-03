//
//  AR.swift
//  Volantes2
//
//  Created by Ben Ye on 4/24/19.
//  Copyright © 2019 Ben Ye. All rights reserved.
//

import UIKit
import ARKit
import SceneKit
import SpriteKit
import CoreLocation
//import Mapbox
//import MapboxDirections
//import Turf

class AR: UIViewController {
    
    var automaticallyFindTrueNorth = true
    let configuration = ARWorldTrackingConfiguration()
    
    @IBOutlet weak var sceneView: ARSCNView!
  //  @IBOutlet weak var mapView: MGLMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        startSession()
    }
    
    private func startSession() {
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration) //runs AR
        self.sceneView.autoenablesDefaultLighting = true


        if automaticallyFindTrueNorth {
            configuration.worldAlignment = .gravityAndHeading
        } else {
            configuration.worldAlignment = .gravity
        }
        
    }
    
    @IBAction func GoBack(_ sender: UIButton) {
        performSegue(withIdentifier: "arback", sender: self)
    }
    
    
    @IBAction func addNode(_ sender: Any) {
        
//        let node =  createSphereNode(radius: 0.1, color: UIColor.red)
//        let anchor = ARAnchor(name: <#T##String#>, transform: <#T##simd_float4x4#>) //look at demo app
//        renderer(sceneView, didAdd: node, for: anchor)
        
    }
    
}

//Nodes Class

extension AR: ARSCNViewDelegate {
    
    //creates a sphere node
    func createSphereNode(radius: CGFloat, color: UIColor) -> SCNNode {
        let sphere = SCNSphere(radius: radius)
        sphere.firstMaterial?.diffuse.contents = color;
        
        let sphereNode = SCNNode(geometry: sphere)
        
        return sphereNode
    }
    
    func addSphereNode(to node: SCNNode, for anchor: ARAnchor) {
        let sphere = createSphereNode(radius: 0.2, color: UIColor.red)
        node.addChildNode(sphere)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        let MBAnchor = anchor
        addSphereNode(to: node, for: MBAnchor)
    }
    
}

