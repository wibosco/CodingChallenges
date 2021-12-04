//
//  ReconstructItinerary.swift
//  CodingChallenges
//
//  Created by William Boles on 03/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/reconstruct-itinerary/
//graph theory
struct ReconstructItinerary {

    //Time: O(d^e) where `d` is the maximum number of flights from an airport and `e` is the number of total flights
    //Space: O(n + e) where `n` is the number of airports and e` is the number of total flights
    //backtracking
    //dfs
    //greedy
    //
    //Solution Description:
    //Convert the tickets in an adjacency list which we then sort. Sorting the list
    //allows us to choose the "smallest" route (greedy) between airports at all times so
    //ensuring that the first route is the expected route. We use backtracking to
    //explore possible routes until we find one that has a count of `tickets.count + 1`
    static func findItinerary(_ tickets: [[String]]) -> [String] {
        var adjList = [String: [String]]()
        
        for ticket in tickets {
            if adjList[ticket[0]] == nil {
                adjList[ticket[0]] = [String]()
            }
            
            if adjList[ticket[1]] == nil {
                adjList[ticket[1]] = [String]()
            }
            
            adjList[ticket[0], default: [String]()].append(ticket[1])
        }
        
        for key in adjList.keys {
            adjList[key] = adjList[key]?.sorted() //sort to improve efficency by bringing greedy
        }
        
        var route = [String]()
        
        dfs(adjList, tickets.count + 1, "JFK", &route) //JFK is always the starting aiport, route is always 1 greater than number of tickets
        
        return route
    }
    
    @discardableResult
    private static func dfs(_ adjList: [String: [String]], _ count: Int, _ curr: String, _ route: inout [String]) -> Bool {
        route.append(curr)
        
        //Goal
        guard route.count != count else {
            return true
        }
        
        let neighbors = adjList[curr] ?? []
        
        //Choice
        for (i, neighbor) in neighbors.enumerated() {
            var mAdjList = adjList
            mAdjList[curr]?.remove(at: i) //ensure that we can't revisit this to-from combination (in this cycle)
            if dfs(mAdjList, count, neighbor, &route) {
                return true
            }
            _ = route.popLast() //backtrack
        }
        
        return false
    }
}
