//
//  MaximumSwap.swift
//  LeetCode
//
//  Created by William Boles on 03/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/maximum-swap/
struct MaximumSwap {
    
    //Time: O(n) where n is the number of digits in `nums` (inner for is constant size 9 so we drop it)
    //Space: O(n) where n is the number of digits in `nums` (digits)
    //array
    //dictionary
    //greedy
    //
    //Solution Description:
    //In order to get the maximum `num` value we want to the swap the left element with a higher value right i.e swap low value
    //more-significant element with high value less-significant value. To enable to efficiently search the digits in `num` for
    //that higher value element we first convert `num` into an array of individual digits and then store those individual digits
    //in a dictionary. As we want to swap a higher value element that is as right as possible, if an element is repeated we only
    //store it's last index (right most). Next we iterate through the digits of `num` and attempt to find that replacement. We
    //have to be careful that any replacement we find is larger than the current element and from later in the digits array. If
    //we find that element we swap the current element with it and return as that is guaranteed to be the largest configuration
    //of `num`. If we can't find a replacement for any of the digits in `num` i.e. `num` is in descending or equal order then we
    //simply return `num`
    func maximumSwap(_ num: Int) -> Int {
        var digits = String(num).compactMap { $0.wholeNumberValue }
        
        var map = [Int: Int]() // [val: index]
        for (i, val) in digits.enumerated() {
            map[val] = i //if `val` is repeated we only interested in the final/last index
        }
        
        for (orgIndex, orgVal) in digits.enumerated() {
            guard orgVal < 9 else { //9 is the largest so skip
                continue
            }
            
            for subVal in ((orgVal + 1)...9).reversed() where subVal != orgVal { //try and find the largest value possible
                if let subIndex = map[subVal], subIndex > orgIndex { //only swap if it appears later in `num`
                    digits.swapAt(orgIndex, subIndex)
                    
                    let newNum = digits.reduce(0) { ($0 * 10) + $1 } //convert back into a single int
                    
                    return newNum
                }
            }
        }
            
        return num
    }
    
    //Time: O(n^2) where n is the number of digits in `nums`
    //Space: O(n) where n is the number of digits in `nums` (digits)
    //
    //Solution Description:
    //Loop through all possible swaps and store the maximum value found.
    func maximumSwapBruteForce(_ num: Int) -> Int {
        var maxNum = num
        
        let digits = String(num).compactMap { Int(String($0)) }
        
        for i in 0..<digits.count {
            for j in (i + 1)..<digits.count {
                var copy = digits
                copy.swapAt(i, j)
                
                let combined = copy.reduce(0) { ($0 * 10) + $1 }
                
                maxNum = max(maxNum, combined)
            }
        }
        
        return maxNum
    }
}
