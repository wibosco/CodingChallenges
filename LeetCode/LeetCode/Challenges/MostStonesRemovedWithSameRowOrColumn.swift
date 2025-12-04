// Created 04/12/2025.

import Foundation

//https://leetcode.com/problems/most-stones-removed-with-same-row-or-column/
struct MostStonesRemovedWithSameRowOrColumn {
    
    //Time: O((n ^ 2) + (n + e)) where n is the number of elements in `stones`
    //                           where e is the number of edges
    //Space: O(n + e)
    //graph theory
    //adjacency list
    //nested loops
    //DFS
    //recursive
    //visited
    //inout
    //multi-source
    //subgraphs
    //directed graph
    //set
    //
    //Solution Description:
    //Treating `stones` as a graph, we convert it into an adjacency list using nested loops to find the elements that share a
    //row or column. We then perform a DFS on each node in the graph - `adjList` can contain multiple subgraphs. Every node
    //in the each subgraph can be removed apart from one. As the graphs in `adjList` are directed graphs to avoid re-visiting
    //an already visited node we track we each visited by adding it to the `visited` set. We know that the number of
    //subgraphs is equal to the number of nodes/stones left on the board after all removals happen. So we can take the count
    //of subgraphs and subtate that from the `stone` count to get the number of removed nodes/stones.
    func removeStones(_ stones: [[Int]]) -> Int {
        var adjList = Array(repeating: [Int](), count: stones.count)

        for i in 0..<stones.count {
            for j in (i + 1)..<stones.count {
                let coord1 = stones[i]
                let coord2 = stones[j]

                //if they share a row or column they are connected
                if coord1[0] == coord2[0] || coord1[1] == coord2[1] {
                    adjList[i].append(j)
                    adjList[j].append(i)
                }
            }
        }

        var visited = Set<Int>()
        var subgraphsCount = 0

        for node in 0..<adjList.count {
            guard !visited.contains(node) else {
                continue
            }
            visited.insert(node)

            //search each subgraph
            dfs(adjList, node, &visited)

            subgraphsCount += 1
        }

        //as each subgraph will have one stone that survives we can use as to get the stones removed
        return stones.count - subgraphsCount
    }

    private func dfs(_ adjList: [[Int]], _ node: Int, _ visited: inout Set<Int>) {
        for neighbor in adjList[node] {
            guard !visited.contains(neighbor) else {
                continue
            }
            visited.insert(neighbor)

            dfs(adjList, neighbor, &visited)
        }
    }
}
