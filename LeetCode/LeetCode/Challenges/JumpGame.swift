//
//  JumpGame.swift
//  LeetCode
//
//  Created by William Boles on 14/03/2022.
//

import Foundation

//https://leetcode.com/problems/jump-game/
//array
struct JumpGame {
    
    //Time: O(n) where `n` is the number of elements in `nums`
    //Space: O(n) where `n` is the number of elements in `nums`
    //n-ary tree
    //DFS
    //recursive
    //
    //Solution Description:
    //Treating `nums` as an n-ary tree with the possible movements from each `nums` element as edges. We can traverse
    //the tree in a DFS manner searchingg for `target` (`nums` end index). With each recursive call we can determine
    //if it is possible to jump directly to the target index from the current index (`root`). If we can we set `found`
    //to true and return; if not we build the possible neighbours, check that we have't already visited them, delve
    //deep on each unvisited neighbour and repeat the process.
    static func canJump(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else {
            return true
        }
        
        var found = false
        var visited = Set<Int>() //indexes
        visited.insert(0)
        
        dfs(nums, 0, (nums.count - 1), &visited, &found)
        
        return found
    }
    
    private static func dfs(_ nums: [Int], _ root: Int, _ target: Int, _ visited: inout Set<Int>, _ found: inout Bool) {
        guard !found else {
            return
        }
        
        let possibleJumps = nums[root]
        
        guard possibleJumps > 0 else {
            return
        }
        
        guard (root + possibleJumps) < target else {
            found = true
            return
        }
        
        for i in (1...possibleJumps).reversed() {
            let nextRoot = i + root
            guard !visited.contains(nextRoot) else {
                continue
            }
            visited.insert(root)
            
            dfs(nums, nextRoot, target, &visited, &found)
            
            guard !found else {
                return
            }
        }
    }
    
    //Time: O(n) where `n` is the number of elements in `nums`
    //Space: O(n) where `n` is the number of elements in `nums`
    //n-ary tree
    //BFS
    //
    //Solution Description:
    //Treating `nums` as an n-ary tree with the possible movements from each `nums` element as edges. We can traverse
    //the tree in a BFS manner searchingg for `target` (`nums` end index). At level we can determine if it is possible
    //to jump directly to the target index. If we can we return true; if not we build the possible neighbours, check
    //that we have't already visited them, add each unvisited neighbour to `queue` and repeat the process.
    static func canJumpBFS(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else {
            return true
        }
        
        var visited = Set<Int>() //indexes
        let target = nums.count - 1
        
        var queue = [0]
        
        while !queue.isEmpty {
            let count = queue.count
            
            for _ in 0..<count {
                let index = queue.removeFirst()
                
                let possibleJumps = nums[index]
                
                guard possibleJumps > 0 else {
                    continue
                }
                
                guard (index + possibleJumps) < target else {
                    return true
                }
                
                for i in (1...possibleJumps).reversed() {
                    let jumpIndex = (i + index)
                    guard !visited.contains(jumpIndex) else {
                        continue
                    }
                    
                    visited.insert(index)
                    queue.append(jumpIndex)
                }
            }
        }
        
        return false
    }
}
