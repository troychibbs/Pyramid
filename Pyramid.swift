//
//  File.swift
//  SC Ship Viewer
//
//  Created by Troy Chibbaro on 5/7/20.
//  Copyright © 2020 Troy Chibbaro. All rights reserved.
//
//  Description: This Pyramid class places a SCNPyramid that scales to the ARPlaneAnchor that is passed.
//  When creating this pyramid in the func renderer method in the ViewController, be sure to cast the
//  placed anchor to a ARPlaneAnchor using:
//                                             guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
//  The instantiation of the this pyramid in the func renderder will look like this:

//                            guard let planeAnchor = anchor as? ARPlaneAnchor else { return }
//                            let pyramid = Pyramid(planeAnchor: planeAnchor, in: sceneView)

import Foundation
import ARKit


//MARK: Extensions
extension UIColor
{
    static let pyramidColor = UIColor.init(named: "pyramidColor")
}



//MARK: Pyramid
class Pyramid: SCNNode
{
    let meshNode: SCNNode
    
    
    init(planeAnchor: ARPlaneAnchor, in scieneView: SCNView)
    {
        //Create pyramid geomtry
        let meshGeometry = SCNPyramid(width: CGFloat(planeAnchor.extent.x / 2), height: CGFloat(planeAnchor.extent.x), length: CGFloat(planeAnchor.extent.x / 2))
        //Add geometry to class variable
        meshNode = SCNNode(geometry: meshGeometry)

        
        //Store pointer to meshGeometry's material
        //and alter the diffuse
        guard let material = meshNode.geometry?.firstMaterial
            else { fatalError("SCNPlane always has one material") }
        material.diffuse.contents = UIColor.pyramidColor
        
        meshNode.opacity = 0.7
        
        //Initialize
        super.init()
        
        
        //Add pyramid to parsed node
        addChildNode(meshNode)
        
        print("Pyramid added")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    //MARK: Methods
    
    
    

}
