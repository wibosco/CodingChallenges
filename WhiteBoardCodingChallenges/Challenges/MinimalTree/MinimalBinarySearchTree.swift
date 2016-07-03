//
//  MinimalTree.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//CtCI 4.2
class MinimalBinarySearchTree: NSObject {
    
    // MARK: Properties
    
    var root: MinimalBinarySearchTreeNode?
    
    // MARK: Construct
    
    func constructBinarySearchTreeFromSortedArray(sortedArray: [Int]) {
        
        constructBinarySearchTreeFromSortedArray(sortedArray, root: nil)
    }
    
    private func constructBinarySearchTreeFromSortedArray(sortedArray: [Int], root: MinimalBinarySearchTreeNode?) {
    
        if sortedArray.count == 0 {
            
            return
        }
        
        let centralIndex = Int(sortedArray.count/2)
        let centralValue = sortedArray[centralIndex]
        
        let node = MinimalBinarySearchTreeNode.init(value: centralValue)
        
        if root == nil {
            
            self.root = node
        }
        else {
            
            root!.addChild(node)
        }
        
        let leftSortedArray = Array(sortedArray[0..<centralIndex])
        let rightSortedArray = Array(sortedArray[(centralIndex+1)..<sortedArray.count])
        
        constructBinarySearchTreeFromSortedArray(leftSortedArray, root: node)
        constructBinarySearchTreeFromSortedArray(rightSortedArray, root: node)
    }
    
    // MARK: Traversal
    
    func preOrderTraversal() {
        
        if root != nil {
            
            preOrderTraversal(root)
        }
    }
    
    private func preOrderTraversal(node: MinimalBinarySearchTreeNode?) {
        
        if node != nil {
            
            print(node!.value)
            
            preOrderTraversal(node?.left)
            preOrderTraversal(node?.right)
        }
    }
    
    func inOrderTraversal() {
        
        if root != nil {
            
            inOrderTraversal(root)
        }
    }
    
    private func inOrderTraversal(node: MinimalBinarySearchTreeNode?) {
        
        if node != nil {
            
            inOrderTraversal(node?.left)
            print(node!.value)
            inOrderTraversal(node?.right)
        }
    }
    
    func postOrderTraversal() {
        
        if root != nil {
            
            postOrderTraversal(root)
        }
    }
    
    private func postOrderTraversal(node: MinimalBinarySearchTreeNode?) {
        
        if node != nil {
            
            postOrderTraversal(node?.left)
            postOrderTraversal(node?.right)
            print(node!.value)
        }
    }
}
