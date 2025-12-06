// Created 03/04/2022.

import Foundation

//https://leetcode.com/problems/is-graph-bipartite/
//graph
struct IsGraphBipartite {
    
    //Time: O(v + e) where v is the vertices in the graph, e is the edges
    //Space: O(v)
    //BFS
    //multi-source
    //multi-graph
    //dictionary
    //adjacency list
    //coloring
    //
    //Solution Description:
    //A bipartite graph is a graph where the vertices/nodes can be split into sets where the nodes within each set don't
    //connect to each other but do connect to nodes in the other set (NB. not necessary for each node in set A to connect
    //to all nodes in set B but must connect to at least one node). Treating the index of the elements in `graph` as a node
    //we use BFS to traverse from that node to all other connected nodes, in order to split the nodes into different sets
    //we "color" each level of nodes by placing that node in a dictionary (`nodes`) with the node being the key and the
    //"color" being the value. As we iterate through each level of nodes we alternate the "color" for that level. If we
    //encounter a node that already exists in `nodes` and isn't that levels color i.e. matches the "parent" nodes color
    //then we know that this graph is bipartite and can return false. We repeat this process of "coloring" for each node as
    //it possible for that this graph contains unconnected nodes/subgraphs.
    func isBipartite(_ graph: [[Int]]) -> Bool {
        var nodes = [Int: Bool]() //true: red, false: green
        
        for i in 0..<graph.count { //may contain multiple graphs
            if nodes[i] == nil {
                var queue = [Int]()
                queue.append(i)
                nodes[i] = true
                
                while !queue.isEmpty { //BFS
                    var newQueueItems = [Int]()
                    
                    for node in queue {
                        let color = nodes[node]!
                        
                        for neighbor in graph[node] {
                            if nodes[neighbor] == nil {
                                newQueueItems.append(neighbor)
                                nodes[neighbor] = !color //each level alternates color
                            } else if nodes[neighbor] == color {
                                return false
                            }
                             
                        }
                    }
                    
                    queue = newQueueItems
                }
            }
        }
        
        return true
    }
    
    //Time: O(v + e) where v is the vertices in the graph, e is the edges
    //Space: O(v)
    //DFS
    //multi-source
    //multi-graph
    //dictionary
    //adjacency list
    //coloring
    //
    //Solution Description:
    //A bipartite graph is a graph where the vertices/nodes can be split into sets where the nodes within each set don't
    //connect to each other but do connect to nodes in the other set (NB. not necessary for each node in set A to connect
    //to all nodes in set B but must connect to at least one node). Treating the index of the elements in `graph` as a node
    //we use DFS to traverse from that node to all other connected nodes, in order to split the nodes into different sets
    //we "color" each level of nodes by placing that node in a dictionary (`nodes`) with the node being the key and the
    //"color" being the value. As we iterate through each level of nodes we alternate the "color" for that level. If we
    //encounter a node that already exists in `nodes` and isn't that levels color i.e. matches the "parent" nodes color
    //then we know that this graph is bipartite and can return false. We repeat this process of "coloring" for each node as
    //it possible for that this graph contains unconnected nodes/subgraphs.
    func isBipartiteDFS(_ graph: [[Int]]) -> Bool {
        var nodes = [Int: Bool]() //true: red, false: green
        
        for i in 0..<graph.count { //may contain multiple graphs
            if nodes[i] == nil {
                var stack = [Int]()
                stack.append(i)
                nodes[i] = true
                
                while !stack.isEmpty { //DFS
                    let node = stack.removeLast()
                    let color = nodes[node]!
                    
                    for neighbor in graph[node] {
                        if nodes[neighbor] == nil {
                            stack.append(neighbor)
                            nodes[neighbor] = !color //each level alternates color
                        } else if nodes[neighbor] == color {
                            return false
                        }
                         
                    }
                }
            }
        }
        
        return true
    }
}
