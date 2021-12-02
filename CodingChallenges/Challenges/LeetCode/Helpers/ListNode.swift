//
//  ListNode.swift
//  CodingChallenges
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    
    // MARK: - Init
    
    init(_ val: Int) {
        self.val = val
    }
}

extension ListNode {
    static func createList(fromArray array: [Int]) -> ListNode? {
        var prev: ListNode?
        for value in array.reversed() {
            let node = ListNode(value)
            node.next = prev
            prev = node
        }
        
        return prev
    }

    static func extractValues(fromList head: ListNode?) -> [Int] {
        var data = [Int]()
        
        var node = head
        while let n = node {
            data.append(n.val)
            node = n.next
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
