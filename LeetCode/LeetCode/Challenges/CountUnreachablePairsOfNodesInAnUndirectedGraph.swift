// Created 06/05/2025.

import Foundation

//https://leetcode.com/problems/count-unreachable-pairs-of-nodes-in-an-undirected-graph/
struct CountUnreachablePairsOfNodesInAnUndirectedGraph {
    
    //Time: O(e + v) where e is the number of elements in `edges`
    //               where v is the number of vertices in the graph
    //Space: O(e + v)
    //graph theory
    //undirected graph
    //matrix
    //adjacency list
    //visited
    //set
    //DFS
    //recursive
    //inout
    //
    //Solution Description:
    //First we convert `edges` into an adjacency list to allow for easier traversal. As this is an undirected graph, we add
    //two entries into `adjList`. Next we iterate through all the vertices in `adjList` and using DFS traverse all connected
    //vertices in it's subgraph. To avoid revisting vertices we store each visted vertice in the `visited` set. What we are
    //really interested in the subgraph is the size of it which we store in `count`. Once all connected verticies for a
    //subgraph have been encountered we determine the number of pairs that subgraph will need to be paired with by taking
    //the univisited vertices count and multipling it with the subgraph verticies count as we know that all subgraph
    //vertices will need to paired up with the unvisited vertices regardless of how those visited vertices are divided into
    //subgraphs. To ensure we don't overcount we remove the current subgraphs vertices first. We repeat this process for all
    //other subgraphs in the graph until all vertices have been visited. We can then return `pairsCount`.
    //
    //Similar to: https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/
    func countPairs(_ n: Int, _ edges: [[Int]]) -> Int {
        var adjList = Array(repeating: [Int](), count: n)
        
        for edge in edges {
            adjList[edge[0]].append(edge[1])
            adjList[edge[1]].append(edge[0])
        }
        
        var pairsCount = 0
        var unvisitedCount = n
        
        var visited = Set<Int>()
        for i in 0..<n {
            var subgraphCount = 0
            dfs(adjList, i, &subgraphCount, &visited)
            
            //the vertices in each subgraph we find will need to be paired with all remaining
            //unreached/unvisited vertices in the graph regardless of which subgraph those
            //vertices find themselves in. No need to calculate subgraphs past as these pairs
            //have already been counted.
            unvisitedCount -= subgraphCount
            pairsCount += subgraphCount * unvisitedCount
        }
        
        return pairsCount
    }
    
    private func dfs(_ adjList: [[Int]], _ vertice: Int, _ count: inout Int, _ visited: inout Set<Int>) {
        guard !visited.contains(vertice) else {
            return
        }
        visited.insert(vertice)
        count += 1
        
        for neighbor in adjList[vertice] {
            dfs(adjList, neighbor, &count, &visited)
        }
    }
}
