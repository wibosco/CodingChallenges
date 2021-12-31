//
//  TopKFrequentElements.swift
//  CodingChallenges
//
//  Created by William Boles on 31/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/top-k-frequent-elements/
//array
struct TopKFrequentElements {
    
    //Time: O(n) where `n` is the number of elements in `nums`
    //Space: O(n)
    //quickselect
    //inline
    //quicksort
    //
    //Solution Description:
    //Using a twist on`quick select` we sort `nums` (using the frequency the `num` appears to determine if it's larger or
    //smaller - this is stored in `frequencies`) around a pivot by gradually partitioning `nums` into a smaller and smaller
    //array. Also as we only want to return the top `k` unique elements we remove the duplicates from our `nums` array by
    //converting the unique keys of `frequencies` into our working int array. As we are not aiming to fully sort `nums`,
    //after each partiton (if we haven't sorted `k` into its final position) we only need to further sort that partition
    //that contains the `k` index. As quick sort will sort in ascending order to find the largest Kth element we need to
    //invert `k` by counting `k` elements from the end to return the correct value. With the `kth` element sorted we return
    //an array containing only `k` to `n - 1` elements.
    //
    //N.B. Here we are using Hoare's partitioning scheme, see https://github.com/raywenderlich/swift-algorithm-club/tree/master/Quicksort#hoares-partitioning-scheme
    static func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var frequencies = [Int: Int]()
        
        for num in nums {
            frequencies[num, default: 0] += 1
        }
        
        var uniqueNums = Array(frequencies.keys.map { $0 }) 
        
        let invertedK = uniqueNums.count - k
        
        quickSelect(&uniqueNums, frequencies, 0, (uniqueNums.count - 1), invertedK)
        
        return Array(uniqueNums[invertedK..<uniqueNums.count])
    }
    
    private static func quickSelect(_ nums: inout [Int], _ frequencies: [Int: Int], _ left: Int, _ right: Int, _ k: Int) {
        guard left < right else {
            return
        }
        
        let partitionIndex = partition(&nums, frequencies, left, right)
        
        if partitionIndex == k {
            return //everything after k is sorted
        } else if k < partitionIndex { //we only need to continue sorting one side of the partition
            quickSelect(&nums, frequencies, left, (partitionIndex - 1), k)
        } else {
            quickSelect(&nums, frequencies, (partitionIndex + 1), right, k)
        }
    }
    
    private static func partition(_ nums: inout [Int], _ frequencies: [Int: Int], _ left: Int, _ right: Int) -> Int {
        let pivotIndex = left // with Hoare's partitioning scheme the pivot index must be the left index
        let pivot = frequencies[nums[pivotIndex]]!
        
        var i = left
        var j = right
        
        while i < j {
            while i < nums.count && frequencies[nums[i]]! <= pivot {
                i += 1
            }
            
            while j >= 0 && frequencies[nums[j]]! > pivot {
                j -= 1
            }
            
            if i < j {
                //everything left of `pivotIndex` should be less than `pivot`
                //and everything right should be greater
                nums.swapAt(i, j)
            }
        }
        
        nums.swapAt(pivotIndex, j)
        
        return j
    }
}
