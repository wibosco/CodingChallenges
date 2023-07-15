//
//  FindTheDifferenceOfTwoArrays.swift
//  LeetCode
//
//  Created by William Boles on 15/07/2023.
//

import Foundation

//https://leetcode.com/problems/find-the-difference-of-two-arrays/
//array
struct FindTheDifferenceOfTwoArrays {
    
    //Time: O(n + m) where n is the number of elements in `nums1`, where m is the number of elements in `nums2`
    //Space: O(n + m)
    //set
    //
    //Solution Description:
    //First we convert the arrays into sets as this will allows for O(1) retrieval performance. Then we iterate through each
    //set and check if that current element is in the other set - if it isn't we add it to our distinct sets. Once both sets
    //have been processed we return the distinct arrays.
    static func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        let nums1Set = Set(nums1)
        let nums2Set = Set(nums2)
        
        var nums1Distinct = [Int]()
        var nums2Distinct = [Int]()
        
        for num in nums1Set { //iterate over set to filter out duplicates
            guard !nums2Set.contains(num) else {
                continue
            }
            
            nums1Distinct.append(num)
        }
        
        for num in nums2Set {
            guard !nums1Set.contains(num) else {
               continue
            }
            
            nums2Distinct.append(num)
        }
        
        return [nums1Distinct, nums2Distinct]
    }
}
