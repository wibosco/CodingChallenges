//
//  CloneBinaryTreeWithRandomPointer.swift
//  LeetCode
//
//  Created by William Boles on 10/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/clone-binary-tree-with-random-pointer/
struct CloneBinaryTreeWithRandomPointer {
    
    //Time: O(n) where n is the number of nodes
    //Space: O(n) where n is the number of copied nodes
    //binary tree
    //DFS
    //dictionary
    //
    //Solution Description:
    //Using DFS, traverse the tree making copies of the nodes that we encounter when a copy does not already exist and associating the
    //copies together.
    func copyRandomBinaryTree(_ root: TreeNodeRandom?) -> TreeNodeRandom? {
        var copies = [TreeNodeRandom: TreeNodeRandom]()
        return copyRandomBinaryTree(root, &copies)
    }
    
    private func copyRandomBinaryTree(_ root: TreeNodeRandom?, _ copies: inout [TreeNodeRandom: TreeNodeRandom]) -> TreeNodeRandom? {
        guard let root = root else {
            return nil
        }
        
        if let copiedNode = copies[root] {
            return copiedNode
        }
        
        let copiedNode = TreeNodeRandom(root.val)
        copies[root] = copiedNode
        
        copiedNode.left = copyRandomBinaryTree(root.left, &copies)
        copiedNode.right = copyRandomBinaryTree(root.right, &copies)
        copiedNode.random = copyRandomBinaryTree(root.random, &copies)
        
        return copiedNode
    }
    
    //Time: O(n) where n is the number of nodes
    //Space: O(n) where n is the number of copied nodes
    //binary tree
    //BFS
    //dictionary
    //
    //Solution Description:
    //Using BFS, traverse the tree copying nodes into a dictionary with the original node being the key and the copy the value (ignoring
    //random, left and right values from this pass through). Then perform a second BFS traversal on the original tree, this time connecting
    //up the `random`, `left` and `right` properties for each node in the tree by accessing the copied nodes from the dictionary.
    func copyRandomBinaryTreeTwoPass(_ root: TreeNodeRandom?) -> TreeNodeRandom? {
        guard let root = root else {
            return nil
        }
        
        let copiedNodes = copyNodes(root)
        var queue = [root]
        
        while !queue.isEmpty {
            var newQueueItems = [TreeNodeRandom]()
            
            for node in queue {
                let copiedNode = copiedNodes[node]!
                
                if let left = node.left {
                    copiedNode.left = copiedNodes[left]
                    newQueueItems.append(left)
                }
                
                if let right = node.right {
                    copiedNode.right = copiedNodes[right]
                    newQueueItems.append(right)
                }
                
                if let random = node.random {
                    copiedNode.random = copiedNodes[random]
                }
            }
            
            queue = newQueueItems
        }
        
        return copiedNodes[root]
    }
    
    private func copyNodes(_ root: TreeNodeRandom) -> [TreeNodeRandom: TreeNodeRandom] {
        var nodes = [TreeNodeRandom: TreeNodeRandom]()
        var queue: [TreeNodeRandom?] = [root]
        
        while !queue.isEmpty {
            let levelCount = queue.count
            
            for _ in 0..<levelCount {
                guard let node = queue.removeFirst() else {
                    continue
                }
                
                let copiedNode = TreeNodeRandom(node.val)
                nodes[node] = copiedNode
                
                queue.append(node.left)
                queue.append(node.right)
            }
        }
        
        return nodes
    }
}
