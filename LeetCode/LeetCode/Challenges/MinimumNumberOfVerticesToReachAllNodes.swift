// Created 03/11/2023.

import Foundation

//https://leetcode.com/problems/minimum-number-of-vertices-to-reach-all-nodes/
struct MinimumNumberOfVerticesToReachAllNodes {
    
    //Time: O(n + m) where n is the number of nodes
    //               where m is the number of edges
    //Space: O(n)
    //graph theory
    //indegree
    //DAG
    //
    //Solution Description:
    //As this is a DAG we know that the graph will not contain cycles, all nodes will be connected and that edges are one way.
    //In order to find the minimum nodes required to full traversal this graph we need to think not about searching algorithms
    //but rather about how travel between nodes works. In order for a node to be reachable from another node it needs to have
    //an in-degree value that is greater than 0 which means that that node can not be part of other minimum node set. Only
    //nodes with an in-degree of 0 can be part of our minimum node set as otherwise they would be unreachable. So first we
    //iterate through `edges` and store the in-degree value for each destination node that we encounter in `inDegreeCount`. We
    //then iterate through `inDegreeCount` and add any nodes with a count of 0 to `result`.
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var inDegreeCount = Array(repeating: 0, count: n)
        
        for edge in edges {
            let dst = edge[1]
            
            inDegreeCount[dst] += 1
        }
        
        var result = [Int]()
        
        for (vertice, count) in inDegreeCount.enumerated() {
            if count == 0 {
                result.append(vertice)
            }
        }
        
        return result
    }
}
