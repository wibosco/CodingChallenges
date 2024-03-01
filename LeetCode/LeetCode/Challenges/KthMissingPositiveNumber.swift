//
//  KthMissingPositiveNumber.swift
//  LeetCode
//
//  Created by William Boles on 01/03/2024.
//

import Foundation

//https://leetcode.com/problems/kth-missing-positive-number/
struct KthMissingPositiveNumber {
    
    //Time: O(log n) where n is the number of elements in `arr`
    //Space: O(1)
    //array
    //binary search
    //
    //Solution Description:
    //As we have a sorted array we can use binary search to determine where to the `kth` value should be. First we "fill in" any
    //gaps before searching by reducing `remaining` value to get us to the first element in `arr`. If that uses all of `k` then
    //we return `k` as the `kth` value. If not we perform a binary search. During the binary we attempt to "fill in" any gaps
    //up the index we are using as `mid`. We do this by keeping track of the most rightward already fully filled in indexes (to
    //start with this will be index 0). If we can get to that `mid` index fully filled in with `remaining` > 0 then we know that
    //the `kth` index is to the right, else if `remaining` < 0 then we know that the `kth` index is the left. As we move left
    //and right we gradually find the index to the left of the `kth` index and so add any remaining `remaining` value to that
    //indexes value.
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var remaining = k
        
        if arr[0] > 1 {
            remaining -= (arr[0] - 1)
        }
        
        guard remaining > 0 else {
            return k
        }
        
        let result = binarySearch(arr, k)
        
        return result
    }
    
    private func binarySearch(_ values: [Int], _ remaining: Int) -> Int {
        var remaining = remaining
        var gapsFilledUpToIndex = 0
        
        var left = 0
        var right = values.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            let deltaIndex = abs(gapsFilledUpToIndex - mid)
            let deltaValue = abs(values[gapsFilledUpToIndex] - values[mid])
            let gapsToBeFilled = abs(deltaIndex - deltaValue)
            
            if gapsToBeFilled == 0 {
                //no missing values in between, move rightwards
                left = mid + 1
                gapsFilledUpToIndex = mid
            } else {
                if gapsToBeFilled >= remaining {
                    //too many missing values to fill in, move leftwards
                    right = mid - 1
                } else if gapsToBeFilled < remaining {
                    //can fill in missing values, move rightwards
                    left = mid + 1
                    remaining -= gapsToBeFilled
                    gapsFilledUpToIndex = mid
                }
            }
        }
        
        return values[right] + remaining
    }
    
    //Time: O(n) where n is the number of elements in `arr`
    //Space: O(1)
    //array
    //
    //Solution Description:
    //Looping through `arr` we fill in the missing values by checking the value we should be at against the value we are at. If
    //`arr[value]` is greater than the value we should be at we `fill in` that missing value by decrementing `remaining` else
    //we move the array onto it's next value. If the `kth` value is at the start or in the middle of `arr` then `remaining` will
    //reach 0 and we can return the `value` we stopped on; if the `kth` value is after the end of `arr` then we add `remainng`
    //onto the final value in the array.
    func findKthPositiveLooping(_ arr: [Int], _ k: Int) -> Int {
        var remaining = k
        var value = 0
        var arrIndex = 0
        
        while remaining > 0 && arrIndex < arr.count {
            value += 1 //the values in `arr` start from 1
            
            if arr[arrIndex] > value {
                remaining -= 1
            } else {
                arrIndex += 1
            }
        }
        
        return value + remaining
    }
}
