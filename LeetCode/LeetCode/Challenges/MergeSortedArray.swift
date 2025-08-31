//
//  MergeSortedArray.swift
//  LeetCode
//
//  Created by William Boles on 22/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/merge-sorted-array/
struct MergeSortedArray {
    
    //Time: O(m + n) where m is the number of elements in `nums1`
    //               where n is the number of elements in `nums2`
    //Space: O(1)
    //three pointers
    //sorting
    //in-line
    //array
    //
    //Solution Description:
    //Using three pointers we iterate back through `nums1` and `nums2` in reverse. `p1` iterates backwards through the elements
    //in `nums1` that need to be sorted, `p2` iterates backwards through `nums2`, and `p3` iterates backwards through all
    //elements of `nums1`. By iterating backwards we can merge the arrays in non-ascending order which when iterated will be
    //non-descending. This allows the suffix `0` elements of `nums1` be overwritten with the correct element wihtout needing
    //extra storage. We check which element of `nums1` and `nums2` at their respective indexes is larger and use that larger
    //value to overwrite the `p3` element of `nums1`. Whichever element is choosen the respective pointer is decrement. `p3` is
    //decremented each iteration. We repeat this process of overwriting for all elements in `nums1`. Special care must be taken
    //when one array runs out of elements .
    //
    //This is  what the overwriting looks like for nums1: [1 3 4 0 0 0] and nums2: [2 5 6]:
    //
    // [1 3 4 0 0 6]
    // [1 3 4 0 5 6]
    // [1 3 4 4 5 6]
    // [1 3 3 4 5 6]
    // [1 2 3 4 5 6]
    //
    //Once `p3` reaches -1 we exit the loop.
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m - 1
        var p2 = n - 1
        var p3 = nums1.count - 1

        while p3 >= 0 {
            //by using `Int.min`, when one array runs out of element we ensure the other arrays elements are always choosen
            let n1 = p1 >= 0 ? nums1[p1] : Int.min
            let n2 = p2 >= 0 ? nums2[p2] : Int.min

            if n1 > n2 {
                nums1[p3] = n1

                p1 -= 1
            } else {
                nums1[p3] = n2

                p2 -= 1
            }

            p3 -= 1
        }
    }
    
    //Time: O(m + n) where m is the number of elements in `nums1`
    //               where n is the number of elements in `nums2`
    //Space: O(1)
    //three pointers
    //sorting
    //in-line
    //array
    //
    //Solution Description:
    //Using three pointers we iterate back through `nums1` and `nums2` in reverse. `p1` iterates backwards through the elements
    //in `nums1` that need to be sorted, `p2` iterates backwards through `nums2`, and `p3` iterates backwards through all
    //elements of `nums1`. By iterating backwards we can merge the arrays in non-ascending order which when iterated will be
    //non-descending. This allows the suffix `0` elements of `nums1` be overwritten with the correct element wihtout needing
    //extra storage. We check which element of `nums1` and `nums2` at their respective indexes is larger and use that larger
    //value to overwrite the `p3` element of `nums1`. Whichever element is choosen the respective pointer is decrement. `p3` is
    //decremented each iteration. We repeat this process of overwriting for all elements in `nums1`. Special care must be taken
    //when one array runs out of elements .
    //
    //This is  what the overwriting looks like for nums1: [1 3 4 0 0 0] and nums2: [2 5 6]:
    //
    // [1 3 4 0 0 6]
    // [1 3 4 0 5 6]
    // [1 3 4 4 5 6]
    // [1 3 3 4 5 6]
    // [1 2 3 4 5 6]
    //
    //Once `p3` reaches -1 we exit the loop.
    func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var p1 = m - 1
        var p2 = n - 1
        var p3 = n + m - 1
        
        while p3 >= 0 {
            if p1 >= 0, p2 >= 0 {
                if nums1[p1] > nums2[p2] {
                    nums1[p3] = nums1[p1]
                    
                    p1 -= 1
                } else {
                    nums1[p3] = nums2[p2]
                    
                    p2 -= 1
                }
            } else if p1 >= 0 {
                nums1[p3] = nums1[p1]
                
                p1 -= 1
            } else if p2 >= 0 {
                nums1[p3] = nums2[p2]
                
                p2 -= 1
            }
            
            p3 -= 1
        }
    }
    
    //Time: O(m + n) where m is the number of elements in `nums1`
    //               where n is the number of elements in `nums2`
    //Space: O(1)
    //array
    //sorted
    //three pointers
    //in-line
    //
    //Solution Description:
    //Using three pointers (`p1` at the end of valid items in nums1, `p2` at the end of nums2 and `p` at the end of nums1) we
    //traverse backwards through the arrays comparing the elements at `p1` and `p2`. Where `p1` is greater than `p2` we replace
    //the element at `p` with `p1` and where `p2` is the greater we replace the element at `p` with `p2` - decrementing either
    //`p1` or `p2` each time e.g.
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
    func merge3(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
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
    
    //Time: O(m + n) where m is the number of elements in `nums1`
    //               where n is the number of elements in `nums2`
    //Space: O(m + n)
    //array
    //sorted
    //extra storage
    //
    //Solution Description:
    //Iterate through `nums1` and `nums2` and gradually build a third array with the sorted, combined result of the merge.
    //Using `nums1` as the primary array, iterate it through, comparing the current element against the current element in
    //`nums2` - if we find that the current `nums2` element is smaller than the current `nums1` element we iterate through
    //`nums2` until we find a `nums2` element that is larger or we exhaust `nums2`. If comparing `nums1` against `nums2` we
    //still have values in `nums2` we add these as-is to the end of the `combined` array
    func merge4(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
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
        combined += nums2[p2...]
        
        nums1 = combined
    }
}
