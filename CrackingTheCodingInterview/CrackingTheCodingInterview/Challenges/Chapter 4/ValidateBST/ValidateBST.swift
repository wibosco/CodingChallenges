// Created 02/07/2016.

import Foundation

//CtCI 4.5
struct ValidateBST {
    
    //Time: O(n)
    static func isValidBST(root: TreeNodeCtCI) -> Bool {
        return preOrderTraversalValidation(root: root, min: nil, max: nil)
    }
    
    static func preOrderTraversalValidation(root: TreeNodeCtCI?, min: Int?, max: Int?) -> Bool {
        guard let root = root else {
            return true
        }
        
        if (min != nil && root.value <= min!) || (max != nil && root.value > max!) {
            return false
        }
        
        return preOrderTraversalValidation(root: root.left, min: min, max: root.value) &&
            preOrderTraversalValidation(root: root.right, min: root.value, max: max)
    }
    
    //Time: O(n)
    static func isValidBST_InOrderTraversal(root: TreeNodeCtCI) -> Bool {
        var order = [TreeNodeCtCI]()
        inOrderTraversal(root: root, order: &order)
        
        for i in 1..<order.count {
            if order[(i - 1)].value > order[i].value {
                return false
            }
        }
        
        return true
    }
    
    static func inOrderTraversal(root: TreeNodeCtCI?, order: inout [TreeNodeCtCI]) {
        guard let root = root else {
            return
        }
        
        inOrderTraversal(root: root.left, order: &order)
        order.append(root)
        inOrderTraversal(root: root.right, order: &order)
    }
}
