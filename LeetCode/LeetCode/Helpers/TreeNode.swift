//
//  TreeNode.swift
//  LeetCode
//
//  Created by William Boles on 19/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

final class TreeNode {
    var val: Int
    
    var left: TreeNode?
    var right: TreeNode?
    
    // MARK: - Init
    
    init(_ val: Int) {
        self.val = val
    }
}

extension TreeNode {
    //level order
    static func deserialize(_ array: [Int?]) -> TreeNode? {
        guard !array.isEmpty, array[0] != nil else {
            return nil
        }
        
        let root = TreeNode(array[0]!)
        var queue = [root]
        var i = 1
        
        while i < array.count {
            let node = queue.removeFirst()
            
            if let leftValue = array[i] {
                let left = TreeNode(leftValue)
                node.left = left
                
                queue.append(left)
            }
            
            i += 1
            
            guard i < array.count else {
                continue
            }
            
            if let rightValue = array[i] {
                let right = TreeNode(rightValue)
                node.right = right
                
                queue.append(right)
            }
            
            i += 1
        }
        
        return root
    }
    
    static func serialize(_ root: TreeNode?) -> [Int?] {
        guard let root = root else {
            return [Int?]()
        }
        
        var queue = [TreeNode?]()
        queue.append(root)
        var values = [Int?]()
        
        while !queue.isEmpty {
            let levelCount = queue.count
            
            for _ in 0..<levelCount {
                guard let node = queue.removeFirst() else {
                    values.append(nil)
                    continue
                }
                
                values.append(node.val)
                
                queue.append(node.left)
                queue.append(node.right)
            }
        }
        
        //trim `nil` from end
        var i = (values.count - 1)
        while i > 0 {
            if values[i] != nil {
                break
            }
            i -= 1
        }
        
        return Array(values[0...i])
    }
    
    static func serializeAsDoublyLinkedList(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return [Int]()
        }
        
        var values = [root.val]
        var node = root
        
        while node.right != nil {
            node = node.right!
            values.append(node.val)
        }
        
        return values
    }
}

extension TreeNode: Equatable {
    static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension TreeNode: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
