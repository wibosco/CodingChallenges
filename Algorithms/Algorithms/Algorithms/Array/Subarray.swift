//
//  Subarray.swift
//  Algorithms
//
//  Created by William Boles on 27/02/2024.
//

import Foundation

struct Subarray {
    
    //Time: O(n^3) where n is the number of elements in `arr`
    //Space: O(n)
    //array
    //subarray
    //nested loops
    //
    //Solution Description:
    //A subarray is contiguous slice of `arr`. While order must be preserved (no elements skipped over), elements can be
    //dropped at either end of the array. Therefore to generate all subarrays we need to iterate through all possible
    //starting indexes of `arr` and take each starting position to the end of `arr` - it's important to note that we only
    //ever move forwards, never backwards. Each new element we encounter we add to our subarray and store that addition in
    //`subarrays` as it own unique array - a subarray doesn't need to use all elements in `arr`.
    //
    //Subarrays of `1549`
    //
    //    1
    //    5
    //    4
    //    9
    //    15
    //    54
    //    49
    //    154
    //    549
    //    1549
    static func generateSubarrays(_ arr: [Int]) -> [[Int]] {
        var subarrays = [[Int]]()
        
        for i in 0..<arr.count {
            for j in i..<arr.count {
                let subarray = Array(arr[i...j])
                subarrays.append(subarray)
            }
        }
        
        return subarrays
    }
    
    //Time: O(n^2) where n is the number of elements in `arr`
    //Space: O(n)
    //DFS
    //recursive
    //array
    //subarray
    //set
    //multi-source
    //n-ary tree
    //
    //Solution Description:
    //A subarray is contiguous slice of `arr`. While order must be preserved (no elements skipped over), elements can be
    //dropped at either end of the array. Therefore to generate all subarrays we need to iterate through all possible
    //starting indexes of `arr` and take each starting position to the end of `arr` - it's important to note that we only
    //ever move forwards, never backwards. Each new element we encounter we add to our subarray and store that addition in
    //`subarrays` as it own unique array - a subarray doesn't need to use all elements in `arr`.
    //
    //Subarrays of `1549`
    //
    //    1
    //    5
    //    4
    //    9
    //    15
    //    54
    //    49
    //    154
    //    549
    //    1549
    static func generateSubarraysUsingDFS(_ arr: [Int]) -> [[Int]] {
        var subarrays = [[Int]]()
        
        for i in 0..<arr.count {
            dfs(arr, i, [], &subarrays)
        }
        
        return subarrays
    }
        
    private static func dfs(_ arr: [Int], _ index: Int, _ subarray: [Int], _ subarrays: inout [[Int]]) {
        guard index < arr.count else {
            return
        }
    
        let nextSubarray = subarray + [arr[index]]
        subarrays.append(nextSubarray)
        dfs(arr, (index + 1), nextSubarray, &subarrays)
    }
    
    // MARK: - Count
    
    //Time: O(1)
    //Space: O(1)
    //math
    //
    //Solution Description:
    //Use a formula to work out the count.
    static func countSubarrays(_ arr: [Int]) -> Int {
        let count = arr.count
        
        return count * (count + 1) / 2
    }
}
