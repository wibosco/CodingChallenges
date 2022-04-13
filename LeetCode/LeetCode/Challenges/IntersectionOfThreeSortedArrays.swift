//
//  IntersectionOfThreeSortedArrays.swift
//  LeetCode
//
//  Created by William Boles on 13/04/2022.
//

import Foundation

//https://leetcode.com/problems/intersection-of-three-sorted-arrays/
//array
struct IntersectionOfThreeSortedArrays {
    
    //Time: O(n) where `n` is the smallest of `arr1`, `arr2`, `arr3`
    //Space: O(n) (`intersection` array)
    //three pointers
    //
    //Solution Description:
    //Using three pointers we iterate through all three arrays. Where the three pointers values match we add that value to
    //`insection` and increment all three pointers, if they don't match we increment one of pointers:
    //
    //1. p2 if it is less than p1
    //2. p3 if it is less than p1
    //3. p1 if it is less than both p2 && p3
    //
    //When any of the pointers reaches the end of its respective array there can be no more matches and we exit
    static func arraysIntersection(_ arr1: [Int], _ arr2: [Int], _ arr3: [Int]) -> [Int] {
        var p1 = 0
        var p2 = 0
        var p3 = 0
        
        var intersection = [Int]()
        
        while p1 < arr1.count && p2 < arr2.count && p3 < arr3.count {
            if arr1[p1] == arr2[p2] && arr1[p1] == arr3[p3] {
                intersection.append(arr1[p1])
                
                p1 += 1
                p2 += 1
                p3 += 1
            } else if arr1[p1] > arr2[p2] {
                p2 += 1
            } else if arr1[p1] > arr3[p3]  {
                p3 += 1
            } else {
                p1 += 1
            }
        }
        
        return intersection
    }
}
