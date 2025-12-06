// Created 20/11/2023.

import Foundation

//https://leetcode.com/problems/boundary-of-binary-tree/
struct BoundaryOfBinaryTree {
    
    //Time: O(n) where n is the number of nodoes in the tree
    //Space: O(h) where h is the height of the tree
    //binary tree
    //DFS
    //recursive
    //top-down
    //bottom-up
    //inout
    //
    //Solution Description:
    //Using DFS we first build up the left boundary (and any leaf nodes that fall on that side) by searching the left subtree
    //of root. It important to note that while left child nodes are favoured when building the left boundary, right child
    //nodes can form part of it if there is no left child node so as we traverse we need to be checking for that scenario.
    //To get the ordering we want we add any boundary nodes we encounter to `boundary` before going deeper - top-down. Once
    //the left boundary has been built we switch over to building the right boundary - it's very similar to how we built the
    //left boundary but with `findRightBoundary` set to true this time. To get the ordering we want we add any bounday nodes
    //we encounter to `boundary` as the recursive calls unwind which will order that boundary bottom-up. With both
    //traversals if we encounter a leaf node we add it immediately to `boundary` without checking if it is part of the left
    //or right boundary. Once the left, right and leaf boundaries have been built we add in the root node and return the
    //combined array.
    func boundaryOfBinaryTree(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        
        var leftBoundary = [Int]()
        var rightBoundary = [Int]()
        
        dfs(root.left, true, false, &leftBoundary)
        dfs(root.right, false, true, &rightBoundary)
        
        return [root.val] + leftBoundary + rightBoundary
    }
    
    private func dfs(_ node: TreeNode?, _ findLeftBoundary: Bool, _ findRightBoundary: Bool, _ boundary: inout [Int]) {
        guard let node = node else {
            return
        }
        
        //leaf nodes are always treated as such even if they form part of the left or right boundary
        if node.left == nil && node.right == nil {
            boundary.append(node.val)
            return
        }
        
        if findLeftBoundary { //add left boundary in-order i.e. top-down
            boundary.append(node.val)
        }
        
        //when attempting to find the right boundary, if no right child exists treat the left child as the boundary
        dfs(node.left, findLeftBoundary, (findRightBoundary && node.right == nil), &boundary)
        //when attempting to find the left boundary, if no left child exists treat the right child as the boundary
        dfs(node.right, (findLeftBoundary && node.left == nil), findRightBoundary, &boundary)
        
        if findRightBoundary { //add right boundary nodes in reverse order i.e. bottom-up
            boundary.append(node.val)
        }
    }
    
    //Time: O(n) where n is the number of nodes in the tree
    //Space: O(h)
    //binary tree
    //DFS
    //recursive
    //top-down
    //bottom-up
    //inout
    //
    //Solution Description:
    //Performing mutliple DFS traversals we first find the left boundary, then the right boundary, then the bottom/leaf
    //boundary. Once those three boundaries we combine them in order with the root node to build the boundary of this
    //tree.
    func boundaryOfBinaryTree2(_ root: TreeNode?) -> [Int] {
        guard let root else {
            return []
        }
        
        var leftBoundary = [Int]()
        traverseLeftBoundary(root.left, &leftBoundary)
        
        var rightBoundary = [Int]()
        traverseRightBoundary(root.right, &rightBoundary)
        
        var leafBoundary = [Int]()
        //passing in `left` and `right` to avoid double counting the `root` in the boundary
        traverseLeafBoundary(root.left, &leafBoundary)
        traverseLeafBoundary(root.right, &leafBoundary)
        
        return [root.val] + leftBoundary + leafBoundary + rightBoundary
    }
    
    private func traverseLeftBoundary(_ node: TreeNode?, _ boundary: inout [Int]) {
        guard let node else {
            return
        }
        
        //don't include the leftmost node as this is part of the bottom boundary
        if node.left != nil || node.right != nil {
            boundary.append(node.val)
        }
        
        if let left = node.left {
            traverseLeftBoundary(left, &boundary)
        } else if let right = node.right { //only search rightwards if the left node is nil
            traverseLeftBoundary(right, &boundary)
        }
    }
    
    private func traverseRightBoundary(_ node: TreeNode?, _ boundary: inout [Int]) {
        guard let node else {
            return
        }
        
        if let right = node.right {
            traverseRightBoundary(right, &boundary)
        } else if let left = node.left { //only search leftwards if the right node is nil
            traverseRightBoundary(left, &boundary)
        }
        
        //don't include the rightmost node as this is part of the bottom boundary
        if node.left != nil || node.right != nil {
            boundary.append(node.val)
        }
    }
    
    private func traverseLeafBoundary(_ node: TreeNode?, _ boundary: inout [Int]) {
        guard let node else {
            return
        }
        
        if node.left == nil && node.right == nil {
            boundary.append(node.val)
        } else {
            traverseLeafBoundary(node.left, &boundary)
            traverseLeafBoundary(node.right, &boundary)
        }
    }
}
