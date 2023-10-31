//
//  MinimumFuelCostToReportToTheCapital.swift
//  LeetCode
//
//  Created by William Boles on 31/10/2023.
//

import Foundation

//https://leetcode.com/problems/minimum-fuel-cost-to-report-to-the-capital/
struct MinimumFuelCostToReportToTheCapital {
    
    //Time: O(n) where n is the number of nodes in the graph/tree
    //Space: O(n)
    //graph theory
    //n-ary tree
    //adjacency list
    //DFS
    //recursive
    //
    //Solution Description:
    //First we convery our edges array `roads` into an adjacency list - as this graoh forms a tree we know that we know we
    //don't have any loops or isolated nodes however the `roads` elements are not in parent->child ordering so we need to
    //add two edges for each `roads` element. Next starting from the root node we perform a DFS traversal by recusively
    //iterating through the tree until we reach the leaf nodes and then returning the number of passengers that meet at
    //each parent node back up the tree. With each upward step we track the number of passengers arrivng at the current
    //node and calculate how many cars where involved in that final step (from neightbor/child-node to current-node). Note
    //that mismatch there between calculating how many passengers are here vs how many care it came to get here. Once we
    //have iterated through all neighbor (excluding the parent relationship) we return the total number of passengers at
    //this node so that it's parent node can calculate how many cars will be required.
    static func minimumFuelCost(_ roads: [[Int]], _ seats: Int) -> Int {
        let nodeCount = (roads.count + 1)
        var adjList = Array(repeating: [Int](), count: nodeCount)
        
        for road in roads {
            let src = road[0]
            let dst = road[1]
            
            //while we can treat this as an n-ary tree, `roads` does not always express
            //the relationship between nodes as parent->child so we need to add both
            //`src` and `dst` to both sides ensure that we capture that relationship
            adjList[src].append(dst)
            adjList[dst].append(src)
        }
        
        var totalCarsUsed = 0
        
        _ = dfs(adjList, 0, -1, seats, &totalCarsUsed)
        
        return totalCarsUsed //as cars and fuel are 1 to 1, we can use them interchangeably
    }
    
    private static func dfs(_ adjList: [[Int]], _ node: Int, _ parent: Int, _ seats: Int, _ totalCarsUsed: inout Int) -> Int {
        var totalPassengersMeetingAtCurrentNode = 0
        for neighbor in adjList[node] {
            guard neighbor != parent else {
                continue
            }
            
            let totalPassengersMeetingAtChildNode = dfs(adjList, neighbor, node, seats, &totalCarsUsed)
            totalPassengersMeetingAtCurrentNode += totalPassengersMeetingAtChildNode
            
            //regroup/reduce passengers into the fewest cars for next step
            let carsNeededToGetFromChildNodeToCurrentNode = Int((Double(totalPassengersMeetingAtChildNode)/Double(seats)).rounded(.up))
            totalCarsUsed += carsNeededToGetFromChildNodeToCurrentNode
        }
        
        return totalPassengersMeetingAtCurrentNode + 1 //+1 as we add the current node/passenger
    }
}
