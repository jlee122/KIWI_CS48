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
import Mapbox
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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        sceneView.addGestureRecognizer(tap)
    
    }

    
    @objc func handleTap(_ gesture: UITapGestureRecognizer){
        
        //1. Get The Current Touch Location
        let currentTouchLocation = gesture.location(in: self.sceneView)
        
        //2. If We Have Hit A Feature Point Get The Result
        if let hitTest = sceneView.hitTest(currentTouchLocation, types: [.featurePoint]).last { // hit test against the real world
            
            //2. Create An Anchore At The World Transform
            let anchor = ARAnchor(transform: hitTest.worldTransform)
            
            //3. Add It To The Scene
            sceneView.session.add(anchor: anchor)
            
            let node = createSphereNode(radius: 0.02, color: UIColor.red)
            renderer(sceneView, didAdd: node, for: anchor)

        }
        
     
       
        if let anchorHitTest = sceneView.hitTest(currentTouchLocation, options: nil).first {
            print(sceneView.anchor(for: anchorHitTest.node)) //should print details if virtual object in the scene
        }
        
    }
    
}

//Nodes Class

extension AR: ARSCNViewDelegate {
    
    //creates a sphere node
    func createSphereNode(radius: CGFloat, color: UIColor) -> SCNNode {
        let sphere = SCNSphere(radius: radius)
        sphere.firstMaterial?.diffuse.contents = color;
        sphere.firstMaterial?.specular.contents = UIColor.white
       
        let sphereNode = SCNNode(geometry: sphere)
        
        return sphereNode
    }
    
    
    @objc func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        node.position = SCNVector3(anchor.transform.columns.3.x, anchor.transform.columns.3.y, anchor.transform.columns.3.z)
        //node position is where the anchor is, which is where tapped on the screen.
        //next step should be to place anchor certain distance from WO and then get nodes leading to anchor?
        
        //node.addChildNode(currentNode!)
        
        self.sceneView.scene.rootNode.addChildNode(node)
            
        
    }
    
}

