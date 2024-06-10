//
//  SortArrayByParityII.swift
//  LeetCode
//
//  Created by William Boles on 10/06/2024.
//

import Foundation

//https://leetcode.com/problems/sort-array-by-parity-ii/
struct SortArrayByParityII {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //two pointers
    //
    //Solution Description:
    //We set up two pointers: `evenPointer` and `oddPointer` to point to where their next element should be placed in
    //`sorted`. Next we iterate through `nums`, if the value is even we insert it into the first unsorted even index
    //and increment `evenPointer` by 2 (to the next even index); if the value is odd we insert it into the first odd
    //index and increment `oddPointer` by 2 (to the next odd index). Once all elements in `nums` have been sorted we
    //return `sorted`.
    func sortArrayByParityII(_ nums: [Int]) -> [Int] {
        var sorted = Array(repeating: -1, count: nums.count)
        
        var evenPointer = 0
        var oddPointer = 1
        
        for num in nums {
            if num.isMultiple(of: 2) {
                sorted[evenPointer] = num
                
                evenPointer += 2
            } else {
                sorted[oddPointer] = num
                
                oddPointer += 2
            }
        }
        
        return sorted
    }
}
