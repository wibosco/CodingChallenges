//
//  GraphNode.swift
//  CodingChallenges
//
//  Created by William Boles on 01/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

class GraphNode {
    let val: Int
    
    var connections = [GraphNode]()
    
    // MARK: - Init
    
    init(_ val: Int) {
        self.val = val
    }
}

extension GraphNode: Equatable {
    static func == (lhs: GraphNode, rhs: GraphNode) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension GraphNode: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
