//
//  CloneBinaryTreeWithRandomPointer.swift
//  LeetCode
//
//  Created by William Boles on 10/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/clone-binary-tree-with-random-pointer/
//binary tree
struct CloneBinaryTreeWithRandomPointer {
    
    //Time: O(n) where `n` is the number of nodes
    //Space: O(n) where `n` is the number of copied nodes
    //DFS
    //dictionary
    //
    //Solution Description:
    //Using DFS, traverse the tree making copies of the nodes that we encouter when a copy does not already exist and
    //associating the copies together.
    static func copyRandomBinaryTree(_ root: BinaryTreeNodeRandom?) -> BinaryTreeNodeRandom? {
        var copies = [BinaryTreeNodeRandom: BinaryTreeNodeRandom]()
        return copyRandomBinaryTree(root, &copies)
    }
    
    private static func copyRandomBinaryTree(_ root: BinaryTreeNodeRandom?, _ copies: inout [BinaryTreeNodeRandom: BinaryTreeNodeRandom]) -> BinaryTreeNodeRandom? {
        guard let root = root else {
            return nil
        }
        
        if let copiedNode = copies[root] {
            return copiedNode
        }
        
        let copiedNode = BinaryTreeNodeRandom(root.val)
        copies[root] = copiedNode
        
        copiedNode.left = copyRandomBinaryTree(root.left, &copies)
        copiedNode.right = copyRandomBinaryTree(root.right, &copies)
        copiedNode.random = copyRandomBinaryTree(root.random, &copies)
        
        return copiedNode
    }
    
    //Time: O(n) where `n` is the number of nodes
    //Space: O(n) where `n` is the number of copied nodes
    //BFS
    //dictionary
    //
    //Solution Description:
    //Using BFS, traverse the tree copying nodes into a dictionary with the original node being the key and the copy the value
    //(ignoring random, left and right values from this pass through). Then perform a second BFS traversal on the original tree,
    //this time connecting up the `random`, `left` and `right` properties for each node in the tree by accessing the copied
    //nodes from the dictionary.
    static func copyRandomBinaryTreeTwoPass(_ root: BinaryTreeNodeRandom?) -> BinaryTreeNodeRandom? {
        guard let root = root else {
            return nil
        }
        
        let copiedNodes = copyNodes(root)
        var queue = [root]
        
        while !queue.isEmpty {
            let levelCount = queue.count
            
            for _ in 0..<levelCount {
                let node = queue.removeFirst()
                let copiedNode = copiedNodes[node]!
                
                if let left = node.left {
                    copiedNode.left = copiedNodes[left]
                    queue.append(left)
                }
                
                if let right = node.right {
                    copiedNode.right = copiedNodes[right]
                    queue.append(right)
                }
                
                if let random = node.random {
                    copiedNode.random = copiedNodes[random]
                }
            }
        }
        
        return copiedNodes[root]
    }
    
    private static func copyNodes(_ root: BinaryTreeNodeRandom) -> [BinaryTreeNodeRandom: BinaryTreeNodeRandom] {
        var nodes = [BinaryTreeNodeRandom: BinaryTreeNodeRandom]()
        var queue: [BinaryTreeNodeRandom?] = [root]
        
        while !queue.isEmpty {
            let levelCount = queue.count
            
            for _ in 0..<levelCount {
                guard let node = queue.removeFirst() else {
                    continue
                }
                
                let copiedNode = BinaryTreeNodeRandom(node.val)
                nodes[node] = copiedNode
                
                queue.append(node.left)
                queue.append(node.right)
            }
        }
        
        return nodes
    }
}
