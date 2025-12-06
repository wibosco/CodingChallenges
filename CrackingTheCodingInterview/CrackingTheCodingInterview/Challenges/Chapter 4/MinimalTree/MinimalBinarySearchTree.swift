// Created 01/06/2016.

import Foundation

//CtCI 4.2
final class MinimalBinarySearchTree {
    var root: MinimalBinarySearchTreeNode?
    
    // MARK: Construct
    
    func constructBinarySearchTreeFromSortedArray(sortedArray: [Int]) {
        constructBinarySearchTreeFromSortedArray(sortedArray: sortedArray, root: nil)
    }
    
    private func constructBinarySearchTreeFromSortedArray(sortedArray: [Int], root: MinimalBinarySearchTreeNode?) {
        guard !sortedArray.isEmpty else {
            return
        }
        
        let centralIndex = Int(sortedArray.count/2)
        let centralValue = sortedArray[centralIndex]
        
        let node = MinimalBinarySearchTreeNode(value: centralValue)
        
        if root == nil {
            self.root = node
        } else {
            root!.addChild(node: node)
        }
        
        let leftSortedArray = Array(sortedArray[0..<centralIndex])
        let rightSortedArray = Array(sortedArray[(centralIndex+1)..<sortedArray.count])
        
        constructBinarySearchTreeFromSortedArray(sortedArray: leftSortedArray, root: node)
        constructBinarySearchTreeFromSortedArray(sortedArray: rightSortedArray, root: node)
    }
    
    // MARK: - Traversal
    
    func preOrderTraversal() {
        preOrderTraversal(node: root)
    }
    
    private func preOrderTraversal(node: MinimalBinarySearchTreeNode?) {
        guard let node = node else {
            return
        }
        
        print(node.value)
        
        preOrderTraversal(node: node.left)
        preOrderTraversal(node: node.right)
    }
    
    func inOrderTraversal() {
        inOrderTraversal(node: root)
    }
    
    private func inOrderTraversal(node: MinimalBinarySearchTreeNode?) {
        guard let node = node else {
            return
        }
        
        inOrderTraversal(node: node.left)
        print(node.value)
        inOrderTraversal(node: node.right)
    }
    
    func postOrderTraversal() {
        postOrderTraversal(node: root)
    }
    
    private func postOrderTraversal(node: MinimalBinarySearchTreeNode?) {
        guard let node = node else {
            return
        }
        
        postOrderTraversal(node: node.left)
        postOrderTraversal(node: node.right)
        print(node.value)
    }
}
