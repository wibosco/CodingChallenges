//
//  JumpGameII.swift
//  LeetCode
//
//  Created by William Boles on 09/03/2022.
//

import Foundation

//https://leetcode.com/problems/jump-game-ii/
//array
struct JumpGameII {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(k) where `k` is the size of the largest level
    //n-ary tree
    //BFS
    //
    //Solution Description:
    //Treating `nums` as an n-ary tree with the possible movements from each `nums` element as edges. We can find the
    //shortest path by traversing the tree in a BFS manner with level being 1 jump. At level we can determine if it is
    //possible to jump directly to the `nums` end index i.e. `target`. If we can we return `jumps + 1` (as it is the
    //next jump where we would reach `target`); if not we build the possible neighbours, check that we have't already
    //visited them and add each unvisited neighbour to `queue`. At the end of each level we increment `jumps` and
    //repeat the process.
    static func jump(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        
        var queue = [0] //[index]
        var visited = Set<Int>()
        visited.insert(0)
        
        var jumps = 0
        let target = nums.count - 1
        
        while !queue.isEmpty {
            let count = queue.count
            
            for _ in 0..<count {
                let index = queue.removeFirst()
                
                let possibleJumps = nums[index]
                
                guard possibleJumps > 0 else {
                    continue
                }
                
                guard (index + possibleJumps) < target else {
                    return (jumps + 1)
                }
                
                for i in 1...possibleJumps { //at this stage we know that `possibleJumps` will not be out of `nums` range
                    let nextIndex = index + i
                    //checking visited here is signifcantly quicker that adding the index and checking on the next iteration
                    guard !visited.contains(nextIndex) else {
                        continue
                    }
                    visited.insert(nextIndex)
                    queue.append(nextIndex)
                }
            }
            
            jumps += 1
        }
        
        return -1
    }
}
