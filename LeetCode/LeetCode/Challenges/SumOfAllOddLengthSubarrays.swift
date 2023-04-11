//
//  SumOfAllOddLengthSubarrays.swift
//  LeetCode
//
//  Created by William Boles on 04/02/2022.
//

import Foundation

//https://leetcode.com/problems/sum-of-all-odd-length-subarrays/
//array
struct SumOfAllOddLengthSubarrays {
    
    //Time: O(n^3) `n` is the number of elements in `arr`
    //Space: O(1)
    //
    //Solution Description:
    //By performing two inner loops we all possible subarrays in `arr` from each possible starting position. If that subarray will
    //result in an odd count then we sum the elements in that subarray and add it to our running total
    static func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
        var sum = 0
        for i in 0..<arr.count {
            for j in i..<arr.count {
                if (j - i).isMultiple(of: 2) {
                    sum += arr[i...j].reduce(0, +)
                }
            }
        }
        
        return sum
    }
}
