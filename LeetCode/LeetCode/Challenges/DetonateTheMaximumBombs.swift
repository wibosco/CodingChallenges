// Created 03/11/2023.

import Foundation

//https://leetcode.com/problems/detonate-the-maximum-bombs/
struct DetonateTheMaximumBombs {
    
    //Time: O(n^2) where n is the number of elements in `bombs`
    //Space: O(n)
    //graph theory
    //DFS
    //recursive
    //visited
    //set
    //multi-source
    //directed graph
    //weighted graph
    //adjacency list
    //maths
    //
    //Solution Description:
    //If we treat the bombs as nodes on a graph, we can treat the blast radius of each bomb as a potential weight edge between
    //those nodes. Determining where the blast radius reaches isn't as simple as comparing `x` and `y` as the blast radius is a
    //circle instead we need to use `distance = √((x1 - x2)^2 + (y1 - y2)^2)` to determine how fall apart two bombs are. So
    //using that formula we can build an adjacency list of graph - if a bomb falls inside the blast radius of a another bomb
    //they are connected, this relationship needs to be check both ways as different bombs have different blast radius i.e. our
    //graph is a directed graph. While we can think of our graph as a weighted graph once we have our edges in place we don't
    //need to care about the weighting of the edge so can drop that detail. Once we have our adjacency list we perform a DFS
    //from each node and track the nodes visited during that search. We then compare the nodes visited from each node and keep
    //track of the largest which is returned once all DFSs are complete.
    func maximumDetonation(_ bombs: [[Int]]) -> Int {
        var adjList = Array(repeating: Set<Int>(), count: bombs.count)
        
        for i in 0..<bombs.count {
            let b1 = bombs[i]
            
            for j in i..<bombs.count {
                let b2 = bombs[j]
                
                //working out the distance between between the two bombs using `d = √((x1 - x2)^2 + (y1 - y2)^2)`
                let xSquared = ((Double(b1[0]) - Double(b2[0])) * (Double(b1[0]) - Double(b2[0])))
                let ySquared = ((Double(b1[1]) - Double(b2[1])) * (Double(b1[1]) - Double(b2[1])))
                
                let distance = sqrt((xSquared + ySquared))
                
                //does the other bomb fall inside the blast radius
                if distance <= Double(b1[2]) {
                    adjList[i].insert(j)
                }
                
                //does the other bomb fall inside the blast radius
                if distance <= Double(b2[2]) {
                    adjList[j].insert(i)
                }
            }
        }
        
        var maxBombs = 0
        for node in 0..<adjList.count {
            var visited = Set<Int>()
            dfs(adjList, node, &visited)
            
            maxBombs = max(maxBombs, visited.count)
        }
        
        return maxBombs
    }
    
    private func dfs(_ adjList: [Set<Int>], _ node: Int, _ visited: inout Set<Int>) {
        visited.insert(node)
        
        for neighbor in adjList[node] {
            guard !visited.contains(neighbor) else {
                continue
            }
            
            dfs(adjList, neighbor, &visited)
        }
    }
}
