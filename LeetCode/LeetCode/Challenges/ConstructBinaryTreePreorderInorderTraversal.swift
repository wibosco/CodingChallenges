// Created 24/11/2021.

import Foundation

//https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/
struct ConstructBinaryTreePreorderInorderTraversal {
    //pre-order = root, left, right
    //in-order = left, root, right
    
    //Time: O(n)
    //Space: O(n)
    //pointers
    //binary tree
    //divide and conquer
    //DFS
    //array
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var preorderIndex = 0 //preorder so we go from start to end
        
        var inorderMapping = [Int: Int]() //to speed up retrieve of root from inorder array
        for (index, val) in inorder.enumerated() {
            inorderMapping[val] = index
        }
        
        return buildTree(preorder, &preorderIndex, inorderMapping, 0, (inorder.count - 1))
    }
    
    private func buildTree(_ preorder: [Int], _ preorderIndex: inout Int, _ inorderMapping: [Int: Int], _ inorderStart: Int, _ inorderEnd: Int) -> TreeNode? {
        guard inorderEnd >= inorderStart else { //are we working inside the range of inorder elements
            return nil
        }
        
        let rootVal = preorder[preorderIndex]
        let root = TreeNode(rootVal)
        preorderIndex += 1 //preorder so we go from start to end
        
        if inorderEnd == inorderStart { //there are no left or right subtrees
            return root
        }
        
        //this index will be used to split the inorder array into left and right subtrees
        let inorderRootIndex = inorderMapping[rootVal]!
        
        // as preorder is being used as a guide, we must build the left branch first
        root.left = buildTree(preorder, &preorderIndex, inorderMapping, inorderStart, (inorderRootIndex - 1))
        root.right = buildTree(preorder, &preorderIndex, inorderMapping, (inorderRootIndex + 1), inorderEnd)
        
        return root
    }
    
    // MARK: -
    
    //Time: O(n)
    //Space: O(n)
    //removal
    //binary tree
    //divide and conquer
    //DFS
    //array
    func buildTreeRemoval(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var preorder = preorder
        return buildTreeRemoval(&preorder, inorder)
    }

    private func buildTreeRemoval(_ preorder: inout [Int], _ inorder: [Int]) -> TreeNode? {
        guard !preorder.isEmpty, !inorder.isEmpty else {
            return nil
        }

        let rootVal = preorder.removeFirst() //O(n)
        let root = TreeNode(rootVal)

        var inorderIndex = 0
        for (index, val) in inorder.enumerated() where val == rootVal {
            inorderIndex = index
            break
        }

        if inorderIndex > 0 {
            let inorder = Array(inorder[0..<inorderIndex])
            root.left = buildTreeRemoval(&preorder, inorder)
        }

        if (inorderIndex + 1) < inorder.count {
            let inorder = Array(inorder[(inorderIndex + 1)...])
            root.right = buildTreeRemoval(&preorder, inorder)
        }

        return root
    }
}
