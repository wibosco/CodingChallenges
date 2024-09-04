//
//  CircularArrayLoop.swift
//  LeetCode
//
//  Created by William Boles on 04/09/2024.
//

import Foundation

//https://leetcode.com/problems/circular-array-loop/
struct CircularArrayLoop {
    
    //Time: O(n ^ 2) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //linked list
    //iterative
    //multi-source
    //slow and fast pointer
    //two pointers
    //modulo
    //cycle detection
    //
    //Solution Description:
    //Treating `nums` as a linked list(s) as each index/node goes to only one other node, we can use slow and fast pointers to
    //traverse the linked list and determine if there is a cycle. An array is only considered circular if the loop is greater
    //than one node and all movements in that path are in the same direction i.e. all positive or all negative jumps.
    //Calculating the destination of any given node involves wrapping that jump by using an modulo operation. Once we have our
    //destination we check that it is not a single node loop and that the new jump is in the same direction. If both conditions
    //are true we return it; if either condition is false we return nil, causing the while loop to fail and a new source node to
    //selected (`nums` can contained multiple unconnected linked list). If a cycle exists in the linked list, the `fast` pointer
    //will eventually catch the `slow` pointer resulting in the while loop failing and true being returned. If after iterating
    //through all posible source nodes we haven't found a cycle we return false.
    func circularArrayLoop(_ nums: [Int]) -> Bool {
        for i in 0..<nums.count {
            var slow: Int? = i
            var fast: Int? = i
            
            repeat {
                slow = calculateDestination(slow, nums)
                fast = calculateDestination(calculateDestination(fast, nums), nums)
            } while slow != fast && slow != nil && fast != nil
            
            //for there to be a loop fast and slow should never be nil
            if slow != nil && slow == fast {
                return true
            }
        }
        
        return false
    }
    
    private func calculateDestination(_ src: Int?, _ nums: [Int]) -> Int? {
        guard let src else {
            return nil
        }
        
        let dest = mod((src + nums[src]), nums.count)
        
        //not a single node loop
        guard src != dest else {
            return nil
        }
        
        //same direct?
        guard (nums[src] > 0) == (nums[dest] > 0) else {
            return nil
        }
        
        return dest
    }
        
    //% in Swift is a remainder operator not a modulo operator so doesn't handle negatives as
    //a modulo operator would, the below method corrects that
    private func mod(_ a: Int, _ n: Int) -> Int {
        let r = a % n
        return r >= 0 ? r : r + n
    }
    
    //Time: O(n ^ 2) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //graph theory
    //DFS
    //recusive
    //multi-source
    //visited
    //modulo
    //cycle detection
    //
    //Solution Description:
    //Treating `nums` as a graph(s) we can traverse the possible paths in a DFS manner. This is a simple DFS traversal as we 
    //know that each node has only one neighbor. An array is only considered circular if the loop is greater than one node and
    //all movements in that path are in the same direction i.e. all positive or all negative jumps. Calculating the destination
    //of any given node involves wrapping that jump by using an modulo operation. Once we have our destination we check that it
    //is not a single node loop and that the new jump is in the same direction. If both conditions are true we return it; if
    //either condition is false we return nil and begin a new DFS traversal from a different source node. Next we checked if the
    //new destination node has already been visited, if it has been visited then we have a valid loop and can return true; if it
    //hasn't been visited we add it to `visited` and repeat the process with the `dest` as the new `src` node. If we iterate
    //through all possible starting nodes and haven't found a loop we return false.
    func circularArrayLoopDFS(_ nums: [Int]) -> Bool {
        for i in 0..<nums.count {
            var visited = Set<Int>()
            
            if dfs(i, nums, &visited) {
                return true
            }
        }
        
        return false
    }
    
    private func dfs(_ src: Int, _ nums: [Int], _ visited: inout Set<Int>) -> Bool {
        guard let dest = calculateDestination(src, nums) else {
            return false
        }
        
        guard !visited.contains(dest) else {
            return true
        }
        
        visited.insert(dest)
        
        return dfs(dest, nums, &visited)
    }
}
