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

        createBinaryTree(fromRoot: root, array: &mArray)
        
        return root
    }
    
    private static func createBinaryTree(fromRoot root: TreeNode?, array: inout [Int?]) {
        guard let root = root, !array.isEmpty else {
            return
        }
        
        var left: TreeNode?
        if let leftVal = array.removeFirst() {
            left = TreeNode(leftVal)
            root.left = left
        }
        
        var right: TreeNode?
        if !array.isEmpty {
            if let rightVal = array.removeFirst() {
                right = TreeNode(rightVal)
                root.right = right
            }
        }
        
        createBinaryTree(fromRoot: left, array: &array)
        createBinaryTree(fromRoot: right, array: &array)
    }
}
