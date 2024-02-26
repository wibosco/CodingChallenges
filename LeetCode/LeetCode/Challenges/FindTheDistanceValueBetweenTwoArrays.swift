//
//  FindTheDistanceValueBetweenTwoArrays.swift
//  LeetCode
//
//  Created by William Boles on 26/02/2024.
//

import Foundation

//https://leetcode.com/problems/find-the-distance-value-between-two-arrays/
struct FindTheDistanceValueBetweenTwoArrays {
    
    //Time: O(n log n + m log n) where n is the number of elements in `arr1`
    //                           where m is the number of elements in `arr2`
    //Space: O(n)
    //array
    //binary search
    //
    //Solution Description:
    //In order for calculate the distance between two arrays we take each element from first array and compare it against every
    //element in the second array - if they are within `d` of each other we discount that element from the first array and move
    //on; if they are not within `d` we increment `result`. If we sort one of the array we can use binary search to determine
    //if we should count that value or not. There is a slight twist in that as `arr1` and/or `arr2` can have both positive and
    //negative numbers, and distance is measured in absolute terms we need to careful with how we calculate distance so rather
    //than comparing mid element of our search against `d` we instead calculate the range a value would need to fall into to be
    //"invalid" and comapre the mid element against that range. We repeat this process for all elements in `arr1`.
    func findTheDistanceValue(_ arr1: [Int], _ arr2: [Int], _ d: Int) -> Int {
        let sortedArr2 = arr2.sorted(by: <)
        
        var result = 0
        
        for value in arr1 {
            guard binarySearch(sortedArr2, (value - d), (value + d)) else {
                continue
            }
            
            result += 1
        }
        
        return result
    }
    
    func binarySearch(_ values: [Int], _ from: Int, _ to: Int) -> Bool {
        var left = 0
        var right = values.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] >= from && values[mid] <= to {
                return false
            } else if values[mid] >= from {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return true
    }
}
