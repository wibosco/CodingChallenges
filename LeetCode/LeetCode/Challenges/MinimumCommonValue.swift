// Created 01/03/2024.

import Foundation

//https://leetcode.com/problems/minimum-common-value/
struct MinimumCommonValue {
    
    //Time: O(n) where n is the smaller of `nums1` or `nums2`
    //Space: O(1)
    //array
    //two pointers
    //
    //Solution Description:
    //As both `nums1` and `nums2` are sorted we can use two pointers we iterate through `nums1` and `nums2`, if we find a
    //common value we return that value, if we don't we move the smaller of the two values pointer forward as we know that
    //value doesn't exist in the other array. If after iterating fully through one of the arrays we haven't found a match
    //we return -1.
    func getCommon(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var p1 = 0
        var p2 = 0
        
        while p1 < nums1.count && p2 < nums2.count {
            let v1 = nums1[p1]
            let v2 = nums2[p2]
            
            if v1 == v2 {
                return v1 //could have been v2
            } else if v1 > v2 {
                p2 += 1
            } else {
                p1 += 1
            }
        }
        
        return -1
    }
    
    //Time: O(n log m) where n is the number of elements in `nums1`
    //                 where m is the number of elements in `nums2`
    //Space: O(1)
    //array
    //binary search
    //
    //Solution Description:
    //As both `nums1` and `nums2` are sorted we can iterate through `nums1` and use binary search to attempt to find that 
    //iterations element in `nums2`.
    func getCommonBinarySearch(_ nums1: [Int], _ nums2: [Int]) -> Int {
        for num in nums1 {
            if binarySearch(nums2, target: num) {
                return num
            }
        }
        
        return -1
    }
    
    private func binarySearch(_ values: [Int], target: Int) -> Bool {
        var left = 0
        var right = values.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] == target {
                return true
            } else if values[mid] < target {
                left = mid + 1 //move rightwards
            } else {
                right = mid - 1 //move leftwards
            }
        }
        
        return false
    }
}
