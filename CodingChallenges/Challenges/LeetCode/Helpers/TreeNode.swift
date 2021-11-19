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
    static func createTree(fromBFSArray array: [Int?]) -> TreeNode? {
        let root = TreeNode(array[0]!)
        for index in 1..<array.count {
            guard let value = array[index] else {
                continue
            }
            
            let node = TreeNode(value)
            var current = root
            
            while true {
                if current.val >= node.val {
                    if current.left == nil {
                        current.left = node
                        break
                    } else {
                        current = current.left!
                    }
                } else if current.val < node.val {
                    if current.right == nil {
                        current.right = node
                        break
                    } else {
                        current = current.right!
                    }
                }
            }
        }
        
        return root
    }
}
