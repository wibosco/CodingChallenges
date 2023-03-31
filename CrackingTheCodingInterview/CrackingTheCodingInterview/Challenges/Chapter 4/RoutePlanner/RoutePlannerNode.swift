//
//  RoutePlannerNode.swift
//  CodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

final class RoutePlannerNode {
    var connectedNodes = [RoutePlannerNode]()
    var visited = false
    var previousVisitedNode: RoutePlannerNode?
    
    // MARK: - Connections
    
    func addConnection(node: RoutePlannerNode) {
        connectedNodes.append(node)
    }
}

extension RoutePlannerNode: Equatable {
    static func == (lhs: RoutePlannerNode, rhs: RoutePlannerNode) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}
