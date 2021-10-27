//
//  BalancedBST.swift
//  CodingChallenges
//
//  Created by William Boles on 05/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//CtCI 4.4
class BalancedBST {

    // MARK: Balanced
    
     static func isBalancedBST(root: BalancedBSTNode) -> Bool {
        calculateHeightOfNodes(root: root)
        
        var queue = [BalancedBSTNode]()
        queue.append(root)
        
        while queue.count > 0 {
            let node = queue.removeFirst()
            
            var heightOfLeft = -1
            var heightOfRight = -1
            
            if let left = node.left {
                queue.append(left)
                heightOfLeft = left.height
            }
            
            if let right = node.right {
                queue.append(right)
                heightOfRight = right.height
            }
            
            if abs(heightOfLeft-heightOfRight) > 1 {
                return false
            }
        }
        
        return true
    }
    
    // MARK: Heights
    
    @discardableResult
     static func calculateHeightOfNodes(root: BalancedBSTNode) -> Int {
        var leftHeight = 0
        if let left = root.left {
            leftHeight += 1
            leftHeight += calculateHeightOfNodes(root: left)
        }
        
        var rightHeight = 0
        if let right = root.right {
            rightHeight += 1
            rightHeight += calculateHeightOfNodes(root: right)
        }
        
        root.height = max(leftHeight, rightHeight)
        
        return root.height
    }
}
