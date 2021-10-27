//
//  UtopianTree.swift
//  CodingChallenges
//
//  Created by Boles on 08/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/utopian-tree
class UtopianTree: NSObject {

    class func heightOfTree(cycles: Int) -> Int {
    
        var heightOfTree = 1
        
        for cycle in 0..<cycles {
            
            if cycle % 2 == 0 {
                
                heightOfTree *= 2
            }
            else {
                
                heightOfTree += 1
            }
        }
        
        return heightOfTree
    }
}
