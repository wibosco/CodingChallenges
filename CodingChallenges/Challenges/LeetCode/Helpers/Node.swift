//
//  Node.swift
//  CodingChallenges
//
//  Created by William Boles on 15/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

class Node {
    var val: Int
    var next: Node?
    var random: Node?
    
    // MARK: - Init
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

extension Node {
    static func createList(fromArray array: [[Int?]]) -> Node? {
        var nodes = [Node]()
        for value in array {
            nodes.append(Node(value[0]!))
        }
        
        for (index, value) in array.enumerated() {
            if (index + 1) < array.count {
                nodes[index].next = nodes[(index + 1)]
            }
            
            if let randomIndex = value[1] {
                nodes[index].random = nodes[randomIndex]
            }
        }
        
        return nodes.first
    }
}

extension Node {
    static func extractValues(fromList head: Node?) -> [[Int?]] {
        var data = [[Int?]]()
        var mapping = [Node: Int]()
        
        var current = head
        var counter = 0
        while current != nil {
            mapping[current!] = counter
            current = current?.next
            counter += 1
        }
        
        var node = head
        while let n = node {
            var nodeData = [Int?]()
            nodeData.append(n.val)
            if let rn = n.random {
                nodeData.append(mapping[rn])
            } else {
                nodeData.append(nil)
            }
            
            data.append(nodeData)
            node = n.next
        }
        
        return data
    }
}

extension Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension Node: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
