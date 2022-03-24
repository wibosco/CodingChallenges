//
//  UniqueBinarySearchTrees.swift
//  CodingChallenges
//
//  Created by William Boles on 22/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/unique-binary-search-trees/
//binary search tree
struct UniqueBinarySearchTrees {
    
    //Time: O(n^2) where `n` is the number of nodes in the tree
    //Space: O(n)
    //sorted
    //
    //Solution Description:
    //Iterating through all possible roots (0..n) we split the tree around each root with everything left of the root being
    //the left branch and everything right of the root being the right branch. We then combine all those possible left and
    //right branches to form one whole tree with the root being `i` in `count`.
    //
    //N.B. https://www.youtube.com/watch?v=GgP75HAvrlY
    //N.B. https://leetcode.com/problems/unique-binary-search-trees/discuss/1425684/For-those-who-don't-understand-why-Cartesian-product-(Visualization)
    static func numTrees(_ n: Int) -> Int {
        guard n > 1 else {
            return 1
        }
        
        var count = Array(repeating: 0, count: (n + 1))
        
        count[0] = 1
        count[1] = 1
        
        for i in 2...n {
            for j in 1...i {
                count[i] += count[(j - 1)] * count[(i - j)]
            }
        }
        
        return count[n]
    } 
}
