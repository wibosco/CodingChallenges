//
//  BinarySearchTree.swift
//  Algorithms
//
//  Created by William Boles on 16/04/2023.
//

import Foundation

//A binary search tree (BST) or Set Binary Tree is a type of binary tree where the left tree is less than the root and the
//right tree is greater than the root. Each node in the tree is the root of it's own subtree. As a BST has an ascending order,
//it allows us to use binary search when searching/inserting/deleting an element which can be completed in O(h) time (in an
//unbalanced tree this might be as much as O(n) and in a balance tree as little as O(log n).
//
//N.B. A BST also known as Set Binary Tree.
final class BinarySearchTree<Element: Comparable> {
    private(set) var root: BinaryTreeNode<Element>?
    
    // MARK: - Init
    
    init(root: BinaryTreeNode<Element>?) {
        self.root = root
    }
    
    // MARK: - Find
    
    func find(_ val: Element) -> BinaryTreeNode<Element>? {
        find(val, root)
    }
    
    private func find(_ val: Element, _ node: BinaryTreeNode<Element>?) -> BinaryTreeNode<Element>? {
        guard let node else {
            return nil
        }
        
        if node.val == val {
            return node
        } else if node.val > val {
            //val is less than current nodes val so search left subtree
            return find(val, node.left)
        } else {
            //val is greater than current nodes val so search right subtree
            return find(val, node.right)
        }
    }
    
    func findMin() -> BinaryTreeNode<Element>? {
        guard let root else {
            return nil
        }
        
        return findMin(root)
    }
    
    private func findMin(_ node: BinaryTreeNode<Element>) -> BinaryTreeNode<Element> {
        if let left = node.left {
            return findMin(left)
        }
        
        return node
    }
    
    func findMax() -> BinaryTreeNode<Element>? {
        guard let root else {
            return nil
        }
        
        return findMax(root)
    }
    
    private func findMax(_ node: BinaryTreeNode<Element>) -> BinaryTreeNode<Element>? {
        if let right = node.right {
            return findMax(right)
        }
        
        return node
    }
    
    // MARK: - Traversal
    
    func inorderTraversal() -> [BinaryTreeNode<Element>] {
        guard let root = root else {
            return []
        }
        
        var order = [BinaryTreeNode<Element>]()
        
        inorderTraversal(root, &order)
        
        return order
    }
    
    func inorderTraversal(_ node: BinaryTreeNode<Element>?, _ order: inout [BinaryTreeNode<Element>]) {
        guard let node = node else {
            return
        }
        
        inorderTraversal(node.left, &order)
        order.append(node)
        inorderTraversal(node.right, &order)
    }
    
    func preorderTraversal() -> [BinaryTreeNode<Element>] {
        guard let root = root else {
            return []
        }
        
        var order = [BinaryTreeNode<Element>]()
        
        preorderTraversal(root, &order)
        
        return order
    }
    
    func preorderTraversal(_ node: BinaryTreeNode<Element>?, _ order: inout [BinaryTreeNode<Element>]) {
        guard let node = node else {
            return
        }
        
        order.append(node)
        preorderTraversal(node.left, &order)
        preorderTraversal(node.right, &order)
    }
    
    func postorderTraversal() -> [BinaryTreeNode<Element>] {
        guard let root = root else {
            return []
        }
        
        var order = [BinaryTreeNode<Element>]()
        
        postorderTraversal(root, &order)
        
        return order
    }
    
    func postorderTraversal(_ node: BinaryTreeNode<Element>?, _ order: inout [BinaryTreeNode<Element>]) {
        guard let node = node else {
            return
        }
        
        postorderTraversal(node.left, &order)
        postorderTraversal(node.right, &order)
        order.append(node)
    }
    
    // MARK: - Height
    
    func height() -> Int {
        return height(root)
    }
    
    func height(_ root: BinaryTreeNode<Element>?) -> Int {
        guard let root = root else {
            return -1
        }
        
        let leftHeight = height(root.left)
        let rightHeight = height(root.right)
        
        return max(leftHeight, rightHeight) + 1
    }
    
    // MARK: - Depth
    
    func depth(_ node: BinaryTreeNode<Element>) -> Int {
        guard let root = root else {
            return -1
        }
        
        var queue = [root]
        var height = 0
        
        while !queue.isEmpty {
            var newQueueItems = [BinaryTreeNode<Element>]()
            
            for n in queue {
                if n == node {
                    return height
                }
                
                if let left = n.left {
                    newQueueItems.append(left)
                }
                
                if let right = n.right {
                    newQueueItems.append(right)
                }
            }
            
            queue = newQueueItems
            height += 1
        }
        
        return -1
    }
    
    // MARK: - Insert
    
    func insert(_ val: Element) {
        guard let root else {
            self.root = BinaryTreeNode(val)
            return
        }
        
        insert(val, root)
    }
    
    private func insert(_ val: Element, _ node: BinaryTreeNode<Element>) {
        if node.val > val {
            //val is less than current nodes val so insertion must go left
            if let left = node.left {
                return insert(val, left)
            } else {
                node.left = BinaryTreeNode(val)
            }
        } else if node.val < val {
            //val is greater than current nodes val so search right subtree
            if let right = node.right {
                return insert(val, right)
            } else {
                node.right = BinaryTreeNode(val)
            }
        }
        
        //ignore if val, already exists
    }
    
    // MARK: - Deletion
    
    func delete(_ val: Element) {
        root = delete(val, root)
    }
    
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
    //needed without needing to explicitly handle it (as can be seen in the iterative approach - `deleteIterative`) so
    //simplifying the implementation.
    private func delete(_ val: Element, _ node: BinaryTreeNode<Element>?) -> BinaryTreeNode<Element>? {
        guard let node = node else {
            return nil
        }
        
        if node.val > val {
            //keep searching
            node.left = delete(val, node.left) //N.B. update child with the result of deletion call
        } else if node.val < val {
            //keep searching
            node.right = delete(val, node.right) //N.B. update child with the result of deletion call
        } else {
            //found the element we want to delete
            if node.left == nil && node.right == nil {
                //strictly this branch is not needed as the `if node.left == nil` branch will handle returning nil if node.right
                //was also nil but added here to improve readability
                return nil
            } else if node.left == nil {
                return node.right //replace the found node with it's right child
            } else if node.right == nil {
                return node.left //replace the found node with it's left child
            } else {
                //node has both a left and right child so we need to find the in-order successor to this node to replace it with
                
                //we know that node.right exists and if it exists then their must be a successor so we can force unwrap here
                let successor = findMin(node.right!)
                
                //replace the value of the current node with the successor value - N.B. we don't replace the node itself just
                //the value
                node.val = successor.val
                
                //delete the duplicate node - we know the duplicate node will be a leaf node so won't need to perform further
                //work i.e. deleting another successor to our successor
                node.right = delete(successor.val, node.right)
            }
        }
        
        return node
    }
    
    func deleteIterative(_ val: Element) {
        let node = find(val, root)
        
        guard let node else {
            return
        }
        
        if node.left == nil {
            //this branch also handles when left and right are both nil as we will be replacing the `node` with a nil anyway
            //so not need to explicitly handle it
            if node == root {
                root = node.right
            } else if node.parent?.left == node {
                node.parent?.left = node.right
            } else {
                node.parent?.right = node.right
            }
        } else if node.right == nil {
            if node == root {
                root = node.left
            } else if node.parent?.left == node {
                node.parent?.left = node.left
            } else {
                node.parent?.right = node.left
            }
        } else {
            //successor is the smallest node that ia after node using in-order traversal
            let successor = findMin(node.right!)
            
            if successor == node.right {
                //successor is a direct child of node so just replace node with successor
                if node == root {
                    root = successor
                } else {
                    //node is not root
                    node.parent?.right = successor
                    successor.parent = node.parent
                }
                
                successor.left = node.left
            } else {
                node.val = successor.val
                //successor is always the left-most/min node in this subtree so we can move any right branch up to successor without
                //having to care about successor.left (as it's nil)
                successor.parent?.left = successor.right
                successor.right?.parent = successor.parent
            }
        }
    }
    
    // MARK: - Balance
    
    func balance() {
        let inorder = inorderTraversal()
        
        let root = balance(inorder, 0, (inorder.count - 1))
        
        self.root = root
    }
    
    private func balance(_ nodes: [BinaryTreeNode<Element>], _ start: Int, _ end: Int) -> BinaryTreeNode<Element>? {
        guard end >= start else { //>= important otherwise you will miss indexes
            return nil
        }
        
        let mid = (start + end) / 2
        
        let root = nodes[mid]
        
        root.left = balance(nodes, start, (mid - 1))
        root.right = balance(nodes, (mid + 1), end)
        
        return root
    }
    
    func isHeightBalance() -> Bool {
        let balanced = isHeightBalance(root)
        
        return balanced != -1
    }
    
    private func isHeightBalance(_ node: BinaryTreeNode<Element>?) -> Int {
        guard let node = node else {
            return 0 //leaf node
        }
        
        let leftHeight = isHeightBalance(node.left)
        let rightHeight = isHeightBalance(node.right)
        
        guard leftHeight != -1, rightHeight != -1 else {
            return -1
        }
        
        let heightDifference = abs((leftHeight - rightHeight))
        
        guard heightDifference < 2 else {
            return -1
        }
        
        let heightFromHere = max(leftHeight, rightHeight) + 1 //+1 for current node
        
        return heightFromHere
    }
}
