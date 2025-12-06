// Created 03/12/2021.

import Foundation

//https://leetcode.com/problems/reconstruct-itinerary/
struct ReconstructItinerary {

    //Time: O(d^e) where d is the maximum number of flights from an airport
    //             where e is the number of total flights
    //Space: O(n + e) where n is the number of airports
    //                where e is the number of total flights
    //graph theory
    //backtracking
    //DFS
    //greedy
    //
    //Solution Description:
    //Convert the tickets in an adjacency list which we then sort. Sorting the list allows us to choose the "smallest"
    //route (greedy) between airports at all times so ensuring that the first route is the expected route. We use
    //backtracking to explore possible routes until we find one that has a count of `tickets.count + 1`
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var adjList = [String: [String]]()
        
        for ticket in tickets {
            adjList[ticket[0], default: [String]()].append(ticket[1])
        }
        
        for key in adjList.keys {
            adjList[key] = adjList[key]?.sorted() //sort to improve efficiency by bringing greedy
        }
        
        var route = [String]()
        
        //JFK is always the starting airport, route is always 1 greater than number of tickets
        dfs(adjList, tickets.count + 1, "JFK", &route)
        
        return route
    }
    
    @discardableResult
    private func dfs(_ adjList: [String: [String]], _ count: Int, _ curr: String, _ route: inout [String]) -> Bool {
        route.append(curr)
        
        //Goal
        guard route.count != count else {
            return true
        }
        
        let neighbors = adjList[curr, default: [String]()]
        
        //Choice
        for (i, neighbor) in neighbors.enumerated() {
            var mAdjList = adjList
            //ensure that we can't revisit this to-from combination (in this cycle)
            //When an edge is travelled, think of it as being used and no longer
            //being available
            mAdjList[curr]?.remove(at: i) //constraint
            if dfs(mAdjList, count, neighbor, &route) {
                return true
            }
            _ = route.popLast() //backtrack
        }
        
        return false
    }
}
