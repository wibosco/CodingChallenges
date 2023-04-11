//
//  TopKFrequentElements.swift
//  LeetCode
//
//  Created by William Boles on 31/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/top-k-frequent-elements/
//array
struct TopKFrequentElements {
    
    //Time: O(n) `n` is the number of elements in `nums`
    //Space: O(n + log n) `n` is the number of elements in `nums` (log n for the recursive stack)
    //quickselect
    //in-line
    //quicksort
    //
    //Solution Description:
    //Using `quick select` we sort `nums` (using the frequency the `num` appears to determine if it's larger or smaller - this
    //is stored in `frequencies`) around a pivot by gradually partitioning `nums` into a smaller and smaller array. Also as we
    //only want to return the top `k` unique elements we remove the duplicates from our `nums` array by converting the
    //`frequencies` into an array of tuples - (key, frequency). As we are not aiming to fully sort `nums`, after each partiton
    //(if we haven't sorted `k` into its final position) we only need to further sort that partition that contains the `k`
    //index. As we want to find the most frequent elements when partitioning we sort in descending order. With the `kth`
    //element sorted we return an array containing only `k` elements.
    //
    //N.B. Here we are using Lomutos partitioning scheme, see:
    //https://github.com/raywenderlich/swift-algorithm-club/tree/master/Quicksort#lomutos-partitioning-scheme
    static func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var frequencies = [Int: Int]() //[num, frequency]
        
        for num in nums {
            frequencies[num, default: 0] += 1
        }
        
        var order = frequencies.compactMap { ($0.key, $0.value) }
        
        quickSelect(&order, 0, (order.count - 1), k) //note the "-1" for right
        
        return order[0..<k].compactMap { $0.0 }
    }
    
    private static func quickSelect(_ order: inout [(Int, Int)], _ left: Int, _ right: Int, _ k: Int) {
        guard left < right else {
            return
        }
        
        let partitionIndex = partition(&order, left, right)
        
        if partitionIndex == k {
            return
        } else if k < partitionIndex { //we only need to continue sorting one side of the partition
            quickSelect(&order, left, (partitionIndex - 1), k)
        } else {
            quickSelect(&order, (partitionIndex + 1), right, k)
        }
    }
    
    private static func partition(_ order: inout [(Int, Int)], _ left: Int, _ right: Int) -> Int {
        let pivot = order[right].1 //note that the pivot is set using the right pointer
        
        var i = left
        for j in left..<right { //note how this is left to (right - 1) as the pivot is right
            //moving the elements that are greater than the pivot to the left of where the pivot will eventually end up
            //descending ordering
            if order[j].1 > pivot {
                order.swapAt(i, j)
                i += 1 //incrementing the boundary for elements that are greater than the pivot
            }
        }
        
        //moving the pivot into its final location i.e. all elements to the left are greater, all element to the
        //right are less
        order.swapAt(i, right)
        
        return i
    }
    
    //Time: O(n) `n` is the number of elements in `nums`
    //Space: O(n) `n` is the number of elements in `nums`
    //bucket sort
    //
    //Solution Description:
    //We first group the elements in a `frequency` dictionary with the `num` as the key and the occurance of that `num` in
    //`nums` as the value. Next we transfer the `frequency` dictionary into buckets - we produce enough buckets so that there
    //is one for each possible frequency value (the upper bounds of this value being the count of `nums`), we more than one
    //`num` can occur the same amount of times in `nums` each bucket is an array. The outer array in `buckets` is the frequency
    //and the inner array is the `num` values. Next we iterate through the `buckets` array in reverse ordering and add the
    //contents of each bucket to our result array - `order`. As a bucket can contain no items we can't just take the top `k`
    //buckets. Once `order` contains `k` elements we can return it.
    static func topKFrequentBucketSort(_ nums: [Int], _ k: Int) -> [Int] {
        var frequencies = [Int: Int]() //[num, frequency]
        
        for num in nums {
            frequencies[num, default: 0] += 1
        }
        
        var buckets: [[Int]] = Array(repeating: [Int](), count: (nums.count + 1))
        
        for (num, frequency) in frequencies {
            buckets[frequency].append(num) //not that we use the `frequency` as the outer arrays index
        }
        
        var order = [Int]()
        
        for bucket in buckets.reversed() { //go in reverse to ensure that we add the more frequent elements to `order` first
            order += bucket //some `bucket` arrays will be empty as no element occured at that frequency
            
            if order.count == k {
                return order
            }
        }
        
        return order
    }
}
