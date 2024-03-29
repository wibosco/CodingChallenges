//
//  BinaryTreeNode.swift
//  Algorithms
//
//  Created by William Boles on 26/05/2022.
//

import Foundation

final class BinaryTreeNode<Element: Comparable> {
    var val: Element
    
    var parent: BinaryTreeNode?
    
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    // MARK: - Init
    
    init(_ val: Element) {
        self.val = val
    }
}

extension BinaryTreeNode where Element == Int {
    //level order
    static func deserialize(_ array: [Int?]) -> BinaryTreeNode? {
        guard !array.isEmpty, array[0] != nil else {
            return nil
        }
        
        let root = BinaryTreeNode(array[0]!)
        var queue = [root]
        var i = 1
        
        while i < array.count {
            let node = queue.removeFirst()
            
            if let leftValue = array[i] {
                let left = BinaryTreeNode(leftValue)
                node.left = left
                left.parent = node
                
                queue.append(left)
            }
            
            i += 1
            
            guard i < array.count else {
                continue
            }
            
            if let rightValue = array[i] {
                let right = BinaryTreeNode(rightValue)
                node.right = right
                right.parent = node
                
                queue.append(right)
            }
            
            i += 1
        }
        
        return root
    }
    
    static func serialize(_ root: BinaryTreeNode?) -> [Int?] {
        guard let root = root else {
            return [Int?]()
        }
        
        var queue = [BinaryTreeNode?]()
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
}

extension BinaryTreeNode: Equatable {
    static func == (lhs: BinaryTreeNode, rhs: BinaryTreeNode) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension BinaryTreeNode: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
