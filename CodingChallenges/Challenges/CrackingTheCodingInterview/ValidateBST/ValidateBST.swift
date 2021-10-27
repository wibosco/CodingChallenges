//
//  ValidateBST.swift
//  CodingChallenges
//
//  Created by William Boles on 02/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//CtCI 4.5
class ValidateBST {
    
    // MARK: InOrder
    
     static func inOrderTraversalIsBST(root: ValidateBSTNode) -> Bool {
        var order = [ValidateBSTNode]()
        inOrderTraversal(root: root, order: &order)
        
        for i in 1..<order.count {
            if order[i-1].value > order[i].value {
                return false
            }
        }
        
        return true
    }
    
     static func inOrderTraversal(root: ValidateBSTNode?, order: inout [ValidateBSTNode]) {
        if let root = root {
            inOrderTraversal(root: root.left, order: &order)
            order.append(root)
            inOrderTraversal(root: root.right, order: &order)
        }
    }
    
    // MARK: MaxMin
    
     static func maxMinIsBST(root: ValidateBSTNode) -> Bool {
        
        return maxMinIsBST(root: root, min: nil, max: nil)
    }
    
     static func maxMinIsBST(root: ValidateBSTNode?, min: Int?, max: Int?) -> Bool {
        guard let root = root else {
            return true
        }
        
        if (min != nil && root.value <= min!) || (max != nil && root.value > max!) {
            return false
        }
        
        if !maxMinIsBST(root: root.left, min: min, max: root.value) || !maxMinIsBST(root: root.right, min: root.value, max: max) {
            return false
        }
        
        return true
    }
}
