//
//  ValidateBST.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 02/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//CtCI 4.5
class ValidateBST: NSObject {
    
    // MARK: InOrder
    
    class func inOrderTraversalIsBST(root: ValidateBSTNode) -> Bool {
        var order = [ValidateBSTNode]()
        inOrderTraversal(root, order: &order)
        
        for i in 1..<order.count {
            if order[i-1].value > order[i].value {
                return false
            }
        }
        
        return true
    }
    
    class func inOrderTraversal(root: ValidateBSTNode?, inout order: [ValidateBSTNode]) {
        if let root = root {
            inOrderTraversal(root.left, order: &order)
            order.append(root)
            inOrderTraversal(root.right, order: &order)
        }
    }
    
    // MARK: MaxMin
    
    class func maxMinIsBST(root: ValidateBSTNode) -> Bool {
        
        return maxMinIsBST(root, min: nil, max: nil)
    }
    
    class func maxMinIsBST(root: ValidateBSTNode?, min: Int?, max: Int?) -> Bool {
        guard let root = root else {
            return true
        }
        
        if (min != nil && root.value <= min) || (max != nil && root.value > max) {
            return false
        }
        
        if !maxMinIsBST(root.left, min: min, max: root.value) || !maxMinIsBST(root.right, min: root.value, max: max) {
            return false
        }
        
        return true
    }
}
