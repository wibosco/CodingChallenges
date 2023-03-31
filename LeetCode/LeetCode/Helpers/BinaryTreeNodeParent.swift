//
//  BinaryTreeNodeParent.swift
//  CodingChallenges
//
//  Created by William Boles on 16/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

final class BinaryTreeNodeParent {
    let val: Int
    
    var left: BinaryTreeNodeParent?
    var right: BinaryTreeNodeParent?
    var parent: BinaryTreeNodeParent?
    
    // MARK: - Init
    
    init(_ val: Int) {
        self.val = val
    }
}

extension BinaryTreeNodeParent {
    //level order
    static func deserialize(_ array: [Int?], _ pVal: Int, _ qVal: Int) -> (BinaryTreeNodeParent?, BinaryTreeNodeParent?) {
        guard !array.isEmpty, array[0] != nil else {
            return (nil, nil)
        }
        
        var queue = [BinaryTreeNodeParent(array[0]!)]
        var i = 1
        var nodes = queue
        
        while i < array.count {
            let node = queue.removeFirst()
            
            if let leftValue = array[i] {
                let left = BinaryTreeNodeParent(leftValue)
                node.left = left
                left.parent = node
                
                queue.append(left)
                nodes.append(left)
            }
            
            i += 1
            
            guard i < array.count else {
                continue
            }
            
            if let rightValue = array[i] {
                let right = BinaryTreeNodeParent(rightValue)
                node.right = right
                right.parent = node
                
                queue.append(right)
                nodes.append(right)
            }
            
            i += 1
        }
        
        var p: BinaryTreeNodeParent?
        var q: BinaryTreeNodeParent?
        
        for node in nodes {
            if node.val == pVal {
                p = node
            } else if node.val == qVal {
                q = node
            }
        }
        
        return (p, q)
    }
}

extension BinaryTreeNodeParent: Equatable {
    static func == (lhs: BinaryTreeNodeParent, rhs: BinaryTreeNodeParent) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension BinaryTreeNodeParent: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
