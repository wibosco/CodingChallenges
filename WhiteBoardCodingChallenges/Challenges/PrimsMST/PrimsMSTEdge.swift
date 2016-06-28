//
//  PrimsMSTEdge.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 28/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class PrimsMSTEdge: NSObject {

    // MARK: Properties
    
    var source: PrimsMSTNode
    var destination: PrimsMSTNode
    var weight: Int
    
    // MARK: Lifecycle
    
    init(source: PrimsMSTNode, destination: PrimsMSTNode, weight: Int) {
        
        self.source = source
        self.destination = destination
        self.weight = weight
        
        super.init()
    }
}
