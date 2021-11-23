//
//  TreeNode.swift
//  CodingChallenges
//
//  Created by William Boles on 19/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

class TreeNode {
    let val: Int
    
    var left: TreeNode?
    var right: TreeNode?
    
    // MARK: - Init
    
    init(_ val: Int) {
        self.val = val
    }
}

extension TreeNode {
    static func createBinaryTree(fromBFSArray array: [Int?]) -> TreeNode? {
        guard !array.isEmpty else {
            return nil
        }
        
        var mArray = array
        let root = TreeNode(mArray.removeFirst()!)
        var queue = [root]
        
        while !mArray.isEmpty {
            let levelCount = queue.count

            for _ in 0..<levelCount {
                let root = queue.removeFirst()
                
                //left
                if let val = mArray.removeFirst() {
                    let node = TreeNode(val)
                    root.left = node

                    queue.append(node)
                }
                
                //right
                if !mArray.isEmpty {
                    if let val = mArray.removeFirst() {
                        let node = TreeNode(val)
                        root.right = node
                        
                        queue.append(node)
                    }
                }
            }
        }

        return root
    }
}
