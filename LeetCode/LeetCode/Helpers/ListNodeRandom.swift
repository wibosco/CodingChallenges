// Created 15/11/2021.

import Foundation

final class ListNodeRandom {
    var val: Int
    var next: ListNodeRandom?
    var random: ListNodeRandom?
    
    // MARK: - Init
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

extension ListNodeRandom {
    static func deserialize(_ array: [[Int?]]) -> ListNodeRandom? {
        var nodes = [ListNodeRandom]()
        for value in array {
            nodes.append(ListNodeRandom(value[0]!))
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

    static func extractValues(fromList head: ListNodeRandom?) -> [[Int?]] {
        var data = [[Int?]]()
        var mapping = [ListNodeRandom: Int]()
        
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

extension ListNodeRandom: Equatable {
    static func == (lhs: ListNodeRandom, rhs: ListNodeRandom) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension ListNodeRandom: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
