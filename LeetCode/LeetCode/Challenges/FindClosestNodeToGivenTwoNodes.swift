//
//  FindClosestNodeToGivenTwoNodes.swift
//  LeetCode
//
//  Created by William Boles on 30/10/2023.
//

import Foundation

//https://leetcode.com/problems/find-closest-node-to-given-two-nodes/
struct FindClosestNodeToGivenTwoNodes {
    
    //Time: O(n) where n is number of nodes in `edges`
    //Space: O(n)
    //graph theory
    //DFS
    //dictionary
    //visited
    //
    //Solution Description:
    //Using DFS (could have also used BFS - no difference) we traverse all possible connected nodes from `node1` and `node2`
    //and store these in two dictionaries `pathFromNode1` and `pathFromNode2` with the distance from there respective source
    //node. We then iterate through `pathFromNode1` (could have been `pathFromNode2`) and attempt to find the same node in
    //the other dictionary. When we get a match we take the maximum value of those two paths and then compare it against the
    //current `closest` matching node value, taking the minimum value this time. If the two values `closest.1` and `cValue`
    //are the same we take the smaller node index value (`key`). After having iterated through all possible matching nodes
    //we either return the matching node or -1.
    func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {
        var pathFromNode1 = [Int: Int]()
        explore(edges, node1, 0, &pathFromNode1)
        
        var pathFromNode2 = [Int: Int]()
        explore(edges, node2, 0, &pathFromNode2)
        
        var closest = (Int.max, Int.max)
        for (key, value1) in pathFromNode1 {
            if let value2 = pathFromNode2[key] {
                let cValue = max(value1, value2)
                if cValue < closest.1 {
                    closest = (key, cValue)
                } else if cValue == closest.1 {
                    if key < closest.0 {
                        closest = (key, cValue)
                    }
                }
            }
        }
        
        return closest.1 == Int.max ? -1 : closest.0
    }
    
    private func explore(_ edges: [Int], _ node: Int, _ step: Int, _ visited: inout [Int: Int]) {
        guard visited[node] == nil else {
            return
        }
        
        visited[node] = step
        
        let nextNode = edges[node]
        
        guard nextNode != -1 else {
            return
        }
        
        explore(edges, nextNode, (step + 1), &visited)
    }
}
