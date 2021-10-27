//
//  PrimsMSTEdge.swift
//  CodingChallenges
//
//  Created by William Boles on 28/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class PrimsMSTEdge {

    // MARK: Properties
    
    var source: PrimsMSTNode
    var destination: PrimsMSTNode
    var weight: Int
    
    // MARK: Lifecycle
    
    init(source: PrimsMSTNode, destination: PrimsMSTNode, weight: Int) {
        self.source = source
        self.destination = destination
        self.weight = weight
    }
}

extension PrimsMSTEdge: Equatable {
    static func == (lhs: PrimsMSTEdge, rhs: PrimsMSTEdge) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension PrimsMSTEdge: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
