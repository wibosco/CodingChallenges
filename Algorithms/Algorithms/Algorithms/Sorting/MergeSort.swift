// Created 22/05/2022.

import Foundation

struct MergeSort {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n) merged array
    //sorting
    //merge sort
    //divide and conquer
    //recursive
    //
    //Solution Description:
    //Using merge sort we split sorting into two stages - we recursively break `nums` down into single element arrays then we
    //merge the two single element arrays together so that we have one non-descending array. As we are merging two sorted
    //arrays (a array of size 1 is sorted) we iterate through both arrays and take the smallest of the two elements to add next
    //to our merged array. We repeat this merging process as we return through the recursive call stack so that we end up with:
    //
    //                [4, 7, 2, 6, 1, 2]
    //
    //            [4, 7, 2]        [6, 1, 2]
    //
    //         [4] [7, 2]            [6] [1, 2]
    //
    //       [7] [2]                      [1] [2] <---- no `4` or `6` as they can't be split into smaller arrays
    //
    // ----------------- Merging begins -------------------
    //
    //         [4] [2, 7]            [6] [1, 2]  <---- `1` and `2` are merged first because their branch was one deeper than `6`
    //
    //            [2, 4, 7]        [1, 2, 6]
    //
    //                [1, 2, 2, 4, 6, 7]
    //
    static func sort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        return mergeSort(nums, 0, nums.count) //note that we the count without - 1
    }
    
    private static func mergeSort(_ nums: [Int], _ left: Int, _ right: Int) -> [Int] {
        guard right - left > 1 else { //single element
            return [nums[left]]
        }
        
        let mid = left + (right - left) / 2
        
        let left = mergeSort(nums, left, mid)
        let right = mergeSort(nums, mid, right)
        
        return merge(left, right)
    }
    
    private static func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var merged = [Int]()
        
        var p1 = 0
        var p2 = 0
        
        //merge left and right together in non-descending order
        while p1 < left.count && p2 < right.count {
            if left[p1] < right[p2] {
                //left[p1] is smaller
                merged.append(left[p1])
                p1 += 1
            } else if left[p1] > right[p2] {
                //right[p2] is smaller
                merged.append(right[p2])
                p2 += 1
            } else {
                //equal so add both
                merged.append(left[p1])
                p1 += 1
                merged.append(right[p2])
                p2 += 1
            }
        }
        
        //merge the remainder of either array into `merged`
        if p1 < left.count {
            merged.append(contentsOf: left[p1...])
        } else if p2 < right.count {
            merged.append(contentsOf: right[p2...])
        }
        
        return merged
    }
}
