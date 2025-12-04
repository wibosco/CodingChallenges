// Created 04/12/2025.

import Foundation

//https://leetcode.com/problems/possible-bipartition/
struct PossibleBipartition {
    
    //Time: O(n + e) where n is the number of nodes in the graph
    //               where n is the number of edges in the graph
    //Space: O(n + e)
    //grpah theory
    //DFS
    //recursive
    //adjacency list
    //visited
    //inout
    //undirected graph
    //multi-source
    //disconnected
    //bipartition
    //
    //Solution Description:
    //Treating `dislikes` as a grpah, we convert `dislikes` into an adjacency list where each neighbor disliked. As each dislike
    //goes both ways we createan undirected graph. The adjacency list produced can contain multiple graph. We then iterate over
    //each graph in `adjList` and perform a DFS on each unvisited graph. To know if the `dislikes` are valid we "mark" each node
    //visited in `colored` - the color of two neighbors should be opposite. If we end up in a situation where a cycle has
    //resulted in two neighbors ending up with the same color then we know that this graph isn't bipartition. If we detect two
    //neighbors we return `false` immediately and exit our searc. If after search a subgraph with each neighbor having a
    //different color we return `true`. If all all subgraphs return `true` we know `dislikes` is bipartition and can return
    //`true`.
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        var adjList = Array(repeating: [Int](), count: n)

        for d in dislikes {
            let d1 = d[0] - 1 //adjusted to use zero indexing
            let d2 = d[1] - 1 //adjusted to use zero indexing
            
            //undirected graph so need to add both paths
            adjList[d1].append(d2)
            adjList[d2].append(d1)
        }

        var colored = Array(repeating: 0, count: n)

        for node in 0..<n {
            guard colored[node] == 0 else {
                continue
            }
            colored[node] = 1

            //search each subgraph
            guard dfs(adjList, node, &colored) else {
                return false
            }
        }

        return true
    }

    private func dfs(_ adjList: [[Int]], _ node: Int, _ colored: inout [Int]) -> Bool {
        for neighbor in adjList[node] {
            guard colored[neighbor] != colored[node] else {
                return false
            }
            
            //use -1 or 1 as indications that `neighbor` has been visted
            guard colored[neighbor] == 0 else {
                continue
            }
            
            colored[neighbor] = (colored[node] * -1)

            guard dfs(adjList, neighbor, &colored) else {
                return false
            }
        }

        return true
    }
}
