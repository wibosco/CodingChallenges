//
//  QuickSort.swift
//  Algorithms
//
//  Created by William Boles on 22/05/2022.
//

import Foundation

struct QuickSort {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(log n) recursive stack
    //sorting
    //quicksort
    //divide and conquer
    //recursive
    //
    //Solution Description:
    //Using quicksort we recursively sort `nums` around a "pivot". The pivot is an element of `nums` that we move into its
    //sorted index by ensuring that all elements before the pivot index are less than or equal to (in value) the pivot and all
    //elements after the pivot index are greater than the pivot. We recursively sort those two subarrays
    //(`left..<(pivotIndex - 1)` and `(pivotIndex + 1)..right` - ensuring to exclude the pivot index as it is already sorted.
    //We repeat this process until the left edge to be sorted is greater than or equal the right edge, at which point the array
    //should be sorted.
    //
    //N.B. if `nums` was sorted, time drops to O(n^2), space drops to O(n)
    //
    //N.B. Here we are using Lomutos partitioning scheme, see:
    //https://github.com/raywenderlich/swift-algorithm-club/tree/master/Quicksort#lomutos-partitioning-scheme
    static func sort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        var nums = nums
        
        quickSort(&nums, 0, (nums.count - 1)) //note the "-1" for right
        
        return nums
    }
    
    private static func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int) {
        guard left < right else {
            return
        }
        
        let sortedIndex = partition(&nums, left, right)
        
        //as the `sortedIndex` is now in its final location we need to sort the reminder of `nums`
        quickSort(&nums, left, (sortedIndex - 1)) //partiton/sort those elements to the left of the pivot
        quickSort(&nums, (sortedIndex + 1), right) //partiton/sort those elements to the right of the pivot
    }
    
    private static func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        let pivot = nums[right] //note this is the value not the index
        
        var i = left //i becomes the edge of the values less than the pivot and those greater than the pivot
        
        for j in left..<right { //note how this is left to (right - 1) as the pivot is right
            
            //moving the elements that are less than the pivot to the left of where the pivot will eventually end up
            if nums[j] <= pivot { //non-descending order
                nums.swapAt(i, j)
                i += 1
            }
        }
        
        //moving the pivot into its final location with all elements less than or equal to it to the left and all elements
        //greater than it to the right
        nums.swapAt(i, right) //note make sure to use the index of the pivot here and not the pivot itself
        
        return i
    }
}
