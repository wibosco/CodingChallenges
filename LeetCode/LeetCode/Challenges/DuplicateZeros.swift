//
//  DuplicateZeros.swift
//  LeetCode
//
//  Created by William Boles on 02/09/2024.
//

import Foundation

//https://leetcode.com/problems/duplicate-zeros/
struct DuplicateZeros {
    
    //Time: O(n) where n is the number of elements in `arr`
    //Space: O(1)
    //array
    //two pointers
    //
    //Solution Description:
    //Using two pointers whenever we encounter a `0`, we "caterpillar walk" elements to the right of `0` one position rightwards
    //which results in the last element dropping off. In order to "caterpillar walk" elements we need to keep track of the
    //element that will be moved - `valueToBeShiftedRight` and the element being overwritten in that move - `tmp`. After each
    //move we increment `p2` and assign `tmp` to `valueToBeShiftedRight` to be used in the next iteration. Note that we are not
    //checking if those elements are `0` - we just shift them right. Once all elements have been moved from shifted rightwards
    //we double increment `p1` and repeat this process for any other `0` elements.
    func duplicateZeros(_ arr: inout [Int]) {
        var p1 = 0
        
        while p1 < (arr.count - 1) { //the final element can't be shifted
            if arr[p1] == 0 {
                var p2 = p1 + 1
                
                var valueToBeShiftedRight = arr[p1]
                while p2 < arr.count {
                    let tmp = arr[p2]
                    arr[p2] = valueToBeShiftedRight
                    
                    valueToBeShiftedRight = tmp
                        
                    p2 += 1
                }
                
                p1 += 1 //we double move p1 so as to the count the newly added `0` in the duplicate check
            }
                
            p1 += 1
        }
    }
}
