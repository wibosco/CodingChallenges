//
//  MaximumSwap.swift
//  CodingChallenges
//
//  Created by William Boles on 03/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/maximum-swap/
//array
struct MaximumSwap {
    
    //Time: O(n^3)
    //Space: O(1)
    //
    //Solution Description:
    //Loop through all possible swaps and store the maximum value found.
    static func maximumSwap(_ num: Int) -> Int {
        var maxNum = num
        
        let digits = String(num).compactMap { Int(String($0)) }
        
        for i in 0..<digits.count {
            for j in (i + 1)..<digits.count {
                var copy = digits
                copy.swapAt(i, j)
                
                var combined = 0
                for val in copy {
                    combined *= 10
                    combined += val
                }
                    
                maxNum = max(maxNum, combined)
            }
        }
        
        return maxNum
    }
}
