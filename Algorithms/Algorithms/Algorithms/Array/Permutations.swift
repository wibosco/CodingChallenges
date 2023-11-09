//
//  Permutations.swift
//  Algorithms
//
//  Created by William Boles on 11/07/2023.
//

import Foundation

struct Permutations {
    
    //Time: O(n*n!) where n is the number of elements in `nums`
    //Space: O(n!) stack frames
    //backtracking
    //DFS
    //n-ary tree
    //recursive
    //set
    //array
    //inout
    //
    //Solution Description:
    //With permutations order is important so [1, 2, 3] is not the same as [3, 2, 1]. With this in mind we can use backtracking
    //to iterate through `nums` and produce every possible permutation of `nums`. Care has to be given so as not to reuse an
    //already used element so whenever we use an element we add it to the `usedIndexes` set so that it can be skipped over on
    //any deeper recursive calls. We then back it and the permutation change when that recursive call returns.
    //
    //Permutations of 123:
    //
    //     123
    //     132
    //     213
    //     132
    //     321
    //     312
    //
    static func generatePermutations(_ nums: [Int]) -> Set<[Int]> {
        var permutations = Set<[Int]>()
        var usedIndexes = Set<Int>()
        var permutation = [Int]()
        
        dfs(nums, &usedIndexes, &permutation, &permutations)
        
        return permutations
    }
    
    private static func dfs(_ nums: [Int], _ usedIndexes: inout Set<Int>, _ permutation: inout [Int], _ permutations: inout Set<[Int]>) {
        guard nums.count != usedIndexes.count else {
            permutations.insert(permutation)
            return
        }
        
        for (i, num) in nums.enumerated() {
            guard !usedIndexes.contains(i) else {
                continue
            }
            
            permutation.append(num)
            usedIndexes.insert(i)
            dfs(nums, &usedIndexes, &permutation, &permutations)
            permutation.removeLast() //backtrack
            usedIndexes.remove(i) //backtrack
        }
    }
}
