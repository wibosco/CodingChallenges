// Created 10/05/2025.

import Foundation

final class ImmutableListNode {
    private let val: Int
    private let next: ImmutableListNode?
    
    // MARK: - Init
    
    init(_ val: Int,
         _ next: ImmutableListNode?) {
        self.val = val
        self.next = next
    }
    
    func printValue() {
        print("\(val)")
    }
    
    func getNext() -> ImmutableListNode? {
        return next
    }
}

extension ImmutableListNode {
    static func deserialize(_ array: [Int]) -> ImmutableListNode? {
        var prev: ImmutableListNode?
        for value in array.reversed() {
            let node = ImmutableListNode(value, prev)
            prev = node
        }
        
        return prev
    }

    static func serialize(_ head: ImmutableListNode?) -> [Int] {
        var data = [Int]()
        var visited = Set<ImmutableListNode>()
        
        var node = head
        while let n = node {
            guard !visited.contains(n) else {
                break
            }
            
            data.append(n.val)
            node = n.next
            
            visited.insert(n)
        }
        
        return data
    }
}

extension ImmutableListNode: Equatable {
    static func == (lhs: ImmutableListNode, rhs: ImmutableListNode) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension ImmutableListNode: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
