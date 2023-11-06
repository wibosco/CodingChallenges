//
//  DeleteNodeInABST.swift
//  LeetCode
//
//  Created by William Boles on 06/11/2023.
//

import Foundation

//https://leetcode.com/problems/delete-node-in-a-bst/
struct DeleteNodeInABST {
    
    //Time: O(h) where h is the height of the tree
    //Space: O(h)
    //BST
    //in-order
    //recursive
    //
    //Solution Description:
    //We recursively search the tree until we find the element we want to delete. Once the node to be deleted is found we need
    //to decide how to delete it:
    //
    //1. Leaf node - break the connection with it's parent node by returning nil
    //2. Node with only one child - return the other child subtree in it's place i.e. parent now points directly to the child
    //3. Node with two children - find the node-to-be-deleted successor (the next node in an in-order traversal - this will
    //                            always be in the node's right subtree) and replace the current node with it's successor. This
    //                            results in a duplicate node in the tree (the successor it's new position and original position).
    //                            We delete the original successor node by recursively calling delete with the successor as the
    //                            new search node. As the successor by definition is the left most node of the node-to-be-deleted
    //                            right subtree we know that this extra deletion won't result in any other recursive deletions as
    //                            once that node is found either deletion approach 1 or 2 will be triggered.
    //
    //Once the node-to-be-deleted and the duplicate successor (if present) is deleted the tree is "put back together" as the
    //recursive calls end, returning mostly the same node as was present before the deletion to be assigned to their parent's
    //left or right properties. This reassignment has the benefit of implicitly handling reassigning the tree's root node if
    //needed without needing to explicitly handle it.
    static func deleteNode(_ root: BinaryTreeNode?, _ key: Int) -> BinaryTreeNode? {
        guard let root = root else {
            return nil
        }
        
        if root.val > key {
            root.left = deleteNode(root.left, key)
        } else if root.val < key {
            root.right = deleteNode(root.right, key)
        } else {
            if root.left == nil && root.right == nil {
                return nil
            } else if root.left == nil {
                return root.right
            } else if root.right == nil {
                return root.left
            } else {
                //find smallest/minimum node to the right
                let successor = leftMost(root.right!)
                
                //don't attempt to delete the node just replace its value
                root.val = successor.val
                
                //now delete the duplicate node
                root.right = deleteNode(root.right, successor.val)
            }
        }
        
        return root
    }
    
    private static func leftMost(_ node: BinaryTreeNode) -> BinaryTreeNode {
        if let left = node.left {
            return leftMost(left)
        }
        
        return node
    }
}
