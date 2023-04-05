//
//  KDiffPairsInAnArray.swift
//  LeetCode
//
//  Created by William Boles on 10/02/2022.
//

import Foundation

//https://leetcode.com/problems/k-diff-pairs-in-an-array/
//array
struct KDiffPairsInAnArray {
    
    //Time: O(n) where n is the numeber of elements in `nums`
    //Space: O(n) as we use a set we could store n/2 elements which will be n as we drop the constant
    //dictionary
    //frequency
    //
    //Solution Description:
    //Using a frequency dictionary we count the number of times a value appears in `nums` this will allow us constant
    //access time we attempt to find the complement of each number and ensure that we don't re-use a number in multiple
    //pairings. Looping through `nums` again we determine what the complement for the current `num` must be by adding
    //`k` to `num` this is because a pair is `num` - `complement`. Once we have that complement we check that it exists
    //in `frequencies`, is at least 1 and isn't itself `num` (we can't reuse the same instance of `num` for both values
    //in the pair). If the above conditions are true then we insert that pair in `pairs` and reduce the count of
    //`complement` in the `frequencies` dictionary to show that it has alreadyd be used in a pair. As we are only
    //interested in unique pairs, we use a set to store them (`pairs`) as any duplicates will be omitted. Finally we
    //return count of `pairs`.
    static func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var frequencies = [Int: Int]() //[diff: count]
        
        for num in nums { //O(n)
            frequencies[num, default: 0] += 1
        }
        
        var pairs = Set<[Int]>() //need to be unique pairs
        for num in nums { //O(n)
            let complement = k + num //remember we find the two nums that equal k by subtracting them
            
            if let frequency = frequencies[complement], frequency > 0 {
                if complement == num && frequency == 1 {
                    continue
                }
                frequencies[complement] = frequency - 1
                
                pairs.insert([num, complement])
            }
        }
        
        return pairs.count
    }
}
