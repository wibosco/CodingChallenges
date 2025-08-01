//
//  KthMissingPositiveNumber.swift
//  LeetCode
//
//  Created by William Boles on 01/03/2024.
//

import Foundation

//https://leetcode.com/problems/kth-missing-positive-number/
struct KthMissingPositiveNumber {
    
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
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
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
    
    //Time: O(n) where n is the number of elements in `arr`
    //Space: O(1)
    //array
    //
    //Solution Description:
    //Rather than fill in the gaps we use the value that are there to increase `k` to what it should be in `arr`. As we loop
    //through 'arr', we check if the current value `num` is less than or equal to `k` if it then we increase `k` as this value
    //doesn't need to be filled in; if it is not then we can't fill in to this value and the current value of `k` is that
    //missing value and can be returned.
    func findKthPositive2(_ arr: [Int], _ k: Int) -> Int {
        var k = k
        
        for num in arr {
            guard num <= k else {
                break
            }

            k += 1
        }

        return k
    }
    
    //Time: O(log n) where n is the number of elements in `arr`
    //Space: O(1)
    //array
    //binary search
    //
    //Solution Description:
    //As we have a sorted array we can use binary search to determine where to the `kth` value should be. If an index had no
    //missing values the value of that index would be the index itself - we can use the calculated missing value count to
    //determine which way to move the `left` or `right`. Once `left` crosses `right`, `left` will be the index that kth
    //element should be but isn't so we add `k` to that index to the missing kth value.
    //
    //Similar to: https://leetcode.com/problems/missing-element-in-sorted-array/
    func findKthPositive3(_ arr: [Int], _ k: Int) -> Int {
        var left = 0
        var right = arr.count - 1

        while left <= right {
            let mid = left + (right - left) / 2
            let missingCount = arr[mid] - (mid + 1)

            if missingCount >= k {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        //the left index is what the value would be for that index if nothing was missing
        //so adding k to it gives the kth missing value as that would the same as filling
        //in those missing values
        return left + k
    }
}
