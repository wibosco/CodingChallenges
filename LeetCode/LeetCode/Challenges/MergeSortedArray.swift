//
//  MergeSortedArray.swift
//  CodingChallenges
//
//  Created by William Boles on 22/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/merge-sorted-array/
//array
struct MergeSortedArray {
    
    //Time: O(m + n)
    //Space: O(1)
    //sorted
    //two pointers (actually three)
    //inplace
    //
    //Solution Description:
    //Using three pointers (`p1` at the end of valid items in nums1, `p2` at the end of nums2 and `p` at the end of
    //nums1) we traverse backward through the arrays comparing the elements at `p1` and `p2`. Where `p1` is greater
    //than `p2` we replace the element at `p` with `p1` and where `p2` is the greater we replace the element at `p`
    //with `p2` - decrementing either `p1` or `p2` each time e.g.
    //
    // for nums1: [1 3 4 0 0 0] and nums2: [2 5 6]
    //
    // [1 3 4 0 0 6]
    // [1 3 4 0 5 6]
    // [1 3 4 4 5 6]
    // [1 3 3 4 5 6]
    // [1 2 3 4 5 6]
    //
    //We treat everything after `p` as final and anything before as open to change
    static func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m - 1
        var p2 = n - 1
        
        for p in (0..<nums1.count).reversed() {
            guard p2 >= 0 else {
                break
            }
            
            if p1 >= 0 && nums1[p1] > nums2[p2] {
                nums1[p] = nums1[p1]
                p1 -= 1
            } else {
                nums1[p] = nums2[p2]
                p2 -= 1
            }
        }
    }
    
    //Time: O(m + n)
    //Space: O(m + n)
    //sorted
    //extra storage
    //
    //Solution Description:
    //Iterate through `nums1` and `nums2` and gradually build a third array with the sorted, combined result of the
    //merge. Usin `nums1` as the primary array, iterate it through, comparing the current element against the current
    //element in `nums2` - if we find that the current `nums2` element is smaller than the current `nums1` element we
    //iterate through `nums2` until we find a `nums2` element that is larger or we exhaust `nums2`. If comparing `nums1`
    //against `nums2` we still have values in `nums2` we add these as-is to the end of the `combined` array
    static func mergeExtraStorage(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var combined = [Int]()
        
        var p1 = 0
        var p2 = 0
        
        while p1 < m {
            while p2 < n && nums1[p1] > nums2[p2] {
                combined.append(nums2[p2])
                p2 += 1
            }
            
            combined.append(nums1[p1])
            p1 += 1
        }
        
        //add any unadded `nums2` elements
        combined.append(contentsOf: nums2[p2..<n])
        
        nums1 = combined
    }
}
