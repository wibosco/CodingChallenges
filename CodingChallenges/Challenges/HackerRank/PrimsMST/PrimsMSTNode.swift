//
//  PrimsMSTNode.swift
//  CodingChallenges
//
//  Created by William Boles on 28/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class PrimsMSTNode {
    var value: Int
    var connected = false
    var edges = [PrimsMSTNode: PrimsMSTEdge]()

    // MARK: Lifecycle
    
    init(value: Int) {
        self.value = value
    }
    
    // MARK: Edge
    
    func addEdge(destination: PrimsMSTNode, weight: Int) {
        let existingEdge = edges[destination]
        if let existingEdge = existingEdge {
            if existingEdge.weight > weight {
                edges[destination] = PrimsMSTEdge(source: self, destination: destination, weight: weight)
                destination.addEdge(destination: self, weight: weight)
            }
        } else {
            edges[destination] = PrimsMSTEdge(source: self, destination: destination, weight: weight)
            destination.addEdge(destination: self, weight: weight)
        }
    }
}

extension PrimsMSTNode: Equatable {
    static func == (lhs: PrimsMSTNode, rhs: PrimsMSTNode) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension PrimsMSTNode: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
