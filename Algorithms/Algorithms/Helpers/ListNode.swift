//
//  ListNode.swift
//  Algorithms
//
//  Created by William Boles on 04/08/2023.
//

import Foundation

final class ListNode<Element: Comparable> {
    var val: Element
    var next: ListNode?
    
    // MARK: - Init
    
    init(_ val: Element) {
        self.val = val
    }
}

extension ListNode where Element == Int {
    static func deserializeCircularList(_ array: [Int]) -> ListNode? {
        var tail: ListNode?
        var prev: ListNode?
        for value in array.reversed() {
            let node = ListNode(value)
            node.next = prev
            prev = node
            
            if tail == nil {
                tail = prev
            }
        }
            
        tail?.next = prev
        
        return prev
    }
    
    static func deserialize(_ array: [Int], _ cycleIndex: Int) -> ListNode? {
        var prev: ListNode?
        var tail: ListNode?
        for (index, value) in array.enumerated().reversed() {
            let node = ListNode(value)
            node.next = prev
            prev = node
            
            if tail == nil {
                tail = node
            }
            
            if index == cycleIndex {
                tail?.next = node
            }
        }
        
        return prev
    }
    
    static func deserialize(_ array: [Int]) -> ListNode? {
        var prev: ListNode?
        for value in array.reversed() {
            let node = ListNode(value)
            node.next = prev
            prev = node
        }
        
        return prev
    }

    static func serialize(_ head: ListNode?) -> [Int] {
        var data = [Int]()
        var visited = Set<ListNode>()
        
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

extension ListNode: Equatable {
    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension ListNode: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
