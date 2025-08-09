//
//  JumpGame.swift
//  LeetCode
//
//  Created by William Boles on 14/03/2022.
//

import Foundation

//https://leetcode.com/problems/jump-game/
struct JumpGame {
    
    //Time: O(n^2) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //n-ary tree
    //DFS
    //recursive
    //visited
    //top-down
    //memoization
    //
    //Solution Description:
    //Treating `nums` as an n-ary tree with the possible movements from each `nums` element as edges. We can traverse
    //the tree in a DFS manner searching for a path that leads us to index `nums.count - 1` end index. With each
    //recursive call we can determine if it is possible to jump directly to the target index from the current index.
    //If we can we return `true`; if not we make the possible other jumps from the current index. To avoid repeated
    //work, if we have already been to an index we add it to the `visited` set as we know that any previously visited
    //index does not lead as to `nums.count - 1` (otherwise we would already have returned `true`).
    func canJump(_ nums: [Int]) -> Bool {
        var visited = Set<Int>()

        return dfs(nums, 0, &visited)
    }

    private func dfs(_ nums: [Int], _ index: Int, _ visited: inout Set<Int>) -> Bool {
        guard index < nums.count else {
            return true //if you can go beyond the end of `nums`, you can reach  the final element
        }
        
        guard index != (nums.count - 1) else {
            return true
        }

        guard !visited.contains(index) else {
            return false
        }
        visited.insert(index)

        let jumps = nums[index]
        for jump in (0..<jumps).reversed() {
            if dfs(nums, (index + jump + 1), &visited) {
                return true
            }
        }

        return false
    }
    
    //Time: O(n^2) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //n-ary tree
    //DFS
    //recursive
    //inout
    //
    //Solution Description:
    //Treating `nums` as an n-ary tree with the possible movements from each `nums` element as edges. We can traverse
    //the tree in a DFS manner searching for `target` (`nums` end index). With each recursive call we can determine
    //if it is possible to jump directly to the target index from the current index (`root`). If we can we set `found`
    //to true and return; if not we build the possible neighbors, check that we have't already visited them, delve
    //deep on each unvisited neighbour and repeat the process.
    func canJump2(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else {
            return true
        }
        
        var found = false
        var visited = Set<Int>() //indexes
        visited.insert(0)
        
        dfs2(nums, 0, (nums.count - 1), &visited, &found)
        
        return found
    }
    
    private func dfs2(_ nums: [Int], _ root: Int, _ target: Int, _ visited: inout Set<Int>, _ found: inout Bool) {
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
            
            dfs2(nums, nextRoot, target, &visited, &found)
            
            guard !found else {
                return
            }
        }
    }
    
    //Time: O(n^2) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //n-ary tree
    //BFS
    //
    //Solution Description:
    //Treating `nums` as an n-ary tree with the possible movements from each `nums` element as edges. We can traverse
    //the tree in a BFS manner searching for `target` (`nums` end index). At level we can determine if it is possible
    //to jump directly to the target index. If we can we return true; if not we build the possible neighbors, check
    //that we have't already visited them, add each unvisited neighbour to `queue` and repeat the process.
    func canJump3(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else {
            return true
        }
        
        var visited = Set<Int>() //indexes
        let target = nums.count - 1
        
        var queue = [0]
        
        while !queue.isEmpty {
            var newQueueItems = [Int]()
            
            for index in queue {
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
                    newQueueItems.append(jumpIndex)
                }
            }
            
            queue = newQueueItems
        }
        
        return false
    }
}
