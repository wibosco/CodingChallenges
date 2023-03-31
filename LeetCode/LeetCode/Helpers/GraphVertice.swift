//
//  GraphNode.swift
//  LeetCode
//
//  Created by William Boles on 01/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

final class GraphVertice {
    let val: Int
    
    var neighbors = [GraphVertice]()
    
    // MARK: - Init
    
    init(_ val: Int) {
        self.val = val
    }
}

extension GraphVertice {
    //undirected graphs
    static func deserialize(_ edges: [[Int]]) -> GraphVertice? {
        guard !edges.isEmpty else {
            return nil
        }
        
        var nodes = [GraphVertice]()
        for i in 1...edges.count { //1-indexed
            let node = GraphVertice(i)
            nodes.append(node)
        }
        
        for i in 0..<edges.count {
            let fromNode = nodes[i]
            for edge in edges[i] {
                let toNode = nodes[(edge - 1)]
                fromNode.neighbors.append(toNode)
            }
        }
        
        return nodes[0]
    }
    
    static func extractValuesIntoAdjList(fromGraph node: GraphVertice?) -> [[Int]] {
        guard let node = node else {
            return []
        }
        
        var queue = [node]
        var visited = [GraphVertice]()
        
        while !queue.isEmpty {
            let n = queue.removeFirst()
            
            guard !visited.contains(n) else {
                continue
            }
            
            visited.append(n)
            
            for neighbour in n.neighbors {
                queue.append(neighbour)
            }
        }
        
        let orderedNodes = visited.sorted { $0.val < $1.val }
        
        var adjList = [[Int]]()
        for n in orderedNodes {
            adjList.append(n.neighbors.map { $0.val }.sorted { $0 < $1 } )
        }
        
        return adjList
    }
}

extension GraphVertice: Equatable {
    static func == (lhs: GraphVertice, rhs: GraphVertice) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension GraphVertice: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
