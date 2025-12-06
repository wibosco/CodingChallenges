// Created 10/11/2023.

import Foundation

//https://leetcode.com/problems/restore-the-array-from-adjacent-pairs/
struct RestoreTheArrayFromAdjacentPairs {
    
    //Time: O(n) where n is the number of elements in `adjacentPairs`
    //Space: O(n)
    //graph theory
    //DFS
    //unweighted graph
    //adjacency list
    //array
    //dictionary
    //outdegree
    //
    //Solution Description:
    //We can treat the `adjacentPairs` as an edge list and so treat this problem as a graph. First we convert `adjacentPairs`
    //into an adjacency list (`adjList`) to allow for quicker search of neighbors. As we don't know the direction of the pair
    //we need to add both elements in the pair as source and destination of each other. Then we find a root/entry node of the
    //graph which is a node that has an outdegree of 1 - there will be two nodes that satisfy this requirement, we take the
    //first one which means that the second will node will be our end node. Once we find our root node we add it to `array`,
    //we then iterate through the our elements in `adjList` and build up `array` using the previously added elements of
    //`array `as either the key or constraint to finding the next element. Once we've iterated through all elements we can
    //return `array`
    func restoreArray(_ adjacentPairs: [[Int]]) -> [Int] {
        var adjList = [Int: [Int]]()
        
        for adjacentPair in adjacentPairs {
            let a = adjacentPair[0]
            let b = adjacentPair[1]
                
            adjList[a, default: [Int]()].append(b)
            adjList[b, default: [Int]()].append(a)
        }
        
        var array = [Int]()
        
        //the root only has an outdegree of 1
        for (key, neighbors) in adjList {
            if neighbors.count == 1 {
                array.append(key)
                array.append(neighbors[0]) //only has one neighbor
                break
            }
        }
        
        for i in 2..<(adjacentPairs.count + 1) {
            let partner = array[(i - 1)]
            let constraint = array[(i - 2)]
            
            for neighbor in adjList[partner]! {
                if neighbor != constraint {
                    array.append(neighbor)
                }
            }
        }
        
        return array
    }
}
