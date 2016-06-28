//
//  PrimsMSTNode.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 28/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class PrimsMSTNode: NSObject {
    
    // MARK: Properties
    
    var value: Int
    
    var connected = false
    
    var edges: Dictionary = {
       
        return [PrimsMSTNode: PrimsMSTEdge]()
    }()
    
    // MARK: Lifecycle
    
    init(value: Int) {
        
        self.value = value
        
        super.init()
    }
    
    // MARK: Edge
    
    func addEdge(destination: PrimsMSTNode, weight: Int) {
        
        let existingEdge = edges[destination]
        
        if let existingEdge = existingEdge {
            
            if existingEdge.weight > weight {
                
                edges[destination] = PrimsMSTEdge(source: self, destination: destination, weight: weight)
                destination.addEdge(self, weight: weight)
            }
        }
        else {
            
            edges[destination] = PrimsMSTEdge(source: self, destination: destination, weight: weight)
            destination.addEdge(self, weight: weight)
        }
    }
}
