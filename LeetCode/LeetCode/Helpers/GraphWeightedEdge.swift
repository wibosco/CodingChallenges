// Created 07/12/2021.

import Foundation

final class GraphWeightedEdge {
    let source: Int
    let destination: Int
    let weight: Int
    
    // MARK: - Init
    
    init(source: Int, destination: Int, weight: Int) {
        self.source = source
        self.destination = destination
        self.weight = weight
    }
}

extension GraphWeightedEdge: Equatable {
    static func == (lhs: GraphWeightedEdge, rhs: GraphWeightedEdge) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension GraphWeightedEdge: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
