//
//  KthLargestElementInArray.swift
//  CodingChallenges
//
//  Created by William Boles on 28/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/kth-largest-element-in-an-array/
//array
struct KthLargestElementInArray {
    
    //Time: O(n) where `n` is the number of elements in `nums`
    //Space: O(1)
    //quickselect
    //quicksort
    //inplace
    //
    //Solution Description:
    //Using `quick select` we sort `nums` around a pivot by gradually partitioning `nums` into a smaller and smaller array.
    //As we are not aiming to fully sort `nums`, after each partiton (if we haven't sorted `k` into its final position) we
    //only need to further sort that partition that contains the `k` index. As quick sort will sort in ascending order to
    //find the largest Kth element we need to invert `k` by counting `k` elements from the end to return the correct value.
    //
    //N.B. Here we are using Lomutos partitioning scheme, see https://github.com/raywenderlich/swift-algorithm-club/tree/master/Quicksort#lomutos-partitioning-scheme
    static func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        
        let invertedK = nums.count - k
        
        return quickSelect(&nums, 0, (nums.count - 1), invertedK) //note the "-1" for right as we index from 0
    }
    
    private static func quickSelect(_ nums: inout [Int], _ left: Int, _ right: Int, _ k: Int) -> Int {
        let partitionIndex = partition(&nums, left, right)
        
        if partitionIndex == k {
            return nums[k]
        } else if k < partitionIndex { //we only need to continue sorting one side of the partition
            return quickSelect(&nums, left, (partitionIndex - 1), k)
        } else {
            return quickSelect(&nums, (partitionIndex + 1), right, k)
        }
    }
    
    private static func partition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
        let pivot = nums[right] //note that the pivot is set using the right pointer
        
        var i = left
        for j in left..<right {
            if nums[j] <= pivot {
                nums.swapAt(i, j)
                i += 1
            }
        }
        
        nums.swapAt(i, right)
        
        return i
    }
    
    //Time: O(n log n) where `n` is number of elements in `nums`
    //Space: O(n)
    //max heap
    //
    //Solution Description:
    //Using a max heap we sort the nums and then extract the `k` element from that heap
    static func findKthLargestHeap(_ nums: [Int], _ k: Int) -> Int {
        var heap = Heap(elements: nums) {
            $0 > $1
        }
        
        var element = 0
        for _ in 0..<k {
            element = heap.dequeue()!
        }
        
        return element
    }
}
