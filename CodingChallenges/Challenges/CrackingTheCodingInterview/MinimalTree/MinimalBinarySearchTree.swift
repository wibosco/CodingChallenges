//
//  MinimalTree.swift
//  CodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//CtCI 4.2
class MinimalBinarySearchTree {
    
    // MARK: Properties
    
    var root: MinimalBinarySearchTreeNode?
    
    // MARK: Construct
    
    func constructBinarySearchTreeFromSortedArray(sortedArray: [Int]) {
        
        constructBinarySearchTreeFromSortedArray(sortedArray: sortedArray, root: nil)
    }
    
    private func constructBinarySearchTreeFromSortedArray(sortedArray: [Int], root: MinimalBinarySearchTreeNode?) {
    
        if sortedArray.count == 0 {
            
            return
        }
        
        let centralIndex = Int(sortedArray.count/2)
        let centralValue = sortedArray[centralIndex]
        
        let node = MinimalBinarySearchTreeNode(value: centralValue)
        
        if root == nil {
            
            self.root = node
        }
        else {
            
            root!.addChild(node: node)
        }
        
        let leftSortedArray = Array(sortedArray[0..<centralIndex])
        let rightSortedArray = Array(sortedArray[(centralIndex+1)..<sortedArray.count])
        
        constructBinarySearchTreeFromSortedArray(sortedArray: leftSortedArray, root: node)
        constructBinarySearchTreeFromSortedArray(sortedArray: rightSortedArray, root: node)
    }
    
    // MARK: Traversal
    
    func preOrderTraversal() {
        
        if root != nil {
            
            preOrderTraversal(node: root)
        }
    }
    
    private func preOrderTraversal(node: MinimalBinarySearchTreeNode?) {
        
        if node != nil {
            
            print(node!.value)
            
            preOrderTraversal(node: node?.left)
            preOrderTraversal(node: node?.right)
        }
    }
    
    func inOrderTraversal() {
        
        if root != nil {
            
            inOrderTraversal(node: root)
        }
    }
    
    private func inOrderTraversal(node: MinimalBinarySearchTreeNode?) {
        
        if node != nil {
            
            inOrderTraversal(node: node?.left)
            print(node!.value)
            inOrderTraversal(node: node?.right)
        }
    }
    
    func postOrderTraversal() {
        
        if root != nil {
            
            postOrderTraversal(node: root)
        }
    }
    
    private func postOrderTraversal(node: MinimalBinarySearchTreeNode?) {
        
        if node != nil {
            
            postOrderTraversal(node: node?.left)
            postOrderTraversal(node: node?.right)
            print(node!.value)
        }
    }
}
