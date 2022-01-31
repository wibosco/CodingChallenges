//
//  BalancedBST.swift
//  CodingChallenges
//
//  Created by William Boles on 05/07/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//CtCI 4.4
struct BalancedBST {

    // MARK: Balanced
    
     static func isBalancedBST(root: TreeNodeCtCI) -> Bool {
        calculateHeightOfNodes(root: root)
        
        var queue = [TreeNodeCtCI]()
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
     static func calculateHeightOfNodes(root: TreeNodeCtCI) -> Int {
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
