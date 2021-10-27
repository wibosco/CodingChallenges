//
//  RoutePlannerNode.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class RoutePlannerNode: NSObject {

    // MARK: Properties
    
    lazy var connectedNodes: [RoutePlannerNode] = {
        
        return [RoutePlannerNode]()
    }()
    
    var visited = false
    
    var previousVisitedNode: RoutePlannerNode?
    
    // MARK: Connections
    
    func addConnection(node: RoutePlannerNode) {
     
        connectedNodes.append(node)
    }
}
