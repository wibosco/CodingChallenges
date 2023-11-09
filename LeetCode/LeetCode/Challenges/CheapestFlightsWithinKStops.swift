//
//  CheapestFlightsWithinKStops.swift
//  LeetCode
//
//  Created by William Boles on 03/04/2022.
//

import Foundation

//https://leetcode.com/problems/cheapest-flights-within-k-stops/
struct CheapestFlightsWithinKStops {
    
    //Time: O(v * k) where v is the number of cities in `flights`
    //               where k is the number of possible steps
    //Space: O(v * min(v, k))
    //graph theory
    //adjacency list
    //memoization
    //dynamic programming
    //DFS
    //recursive
    //
    //Solution Description:
    //First we convert `flights` into an adjacency list containing as the index each city and as the value an array
    //containing the connected city and the flight cost. Using this adjacency list we preform a DFS of this graph attempting
    //to find the cheapest route from `src` to `dst` (NB. there may be many routes but we want the cheapest). We have two
    //bases for our DFS - finding `dst` and running out of stops - `k`. To avoid having to travel the same route multiple
    //times we can use memoization to store the cost (if possible) from any given city to `dst` - `memo`. It's important to
    //store the city and remaining `k` value as the key of `memo` as the `k` stops remaining may mean it's possible to go
    //from the current city to `dst` only some of the time i.e. sometimes `k` is too small as we arrived at the current city
    //from a more stop-expensive path. We use `Int.max` as our "no path possible" value - this also appears for easy
    //comparison when we find the first path from the current city to `dst`.
    //
    //N.B. Memoization is a term describing an optimization technique where you cache previously computed results, and return
    //the cached result when the same computation is needed again.
    //
    //N.B. Dynamic programming can be thought of as local brute force.
    static func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var cities = Array(repeating: [(Int, Double)](), count: n)
        
        for flight in flights {
            let src = flight[0]
            let dst = flight[1]
            let cost = Double(flight[2])
            
            cities[src].append((dst, cost))
        }
        
        var memo = [String: Double]() //"city-stops": cheapest cost
        
        //`k` refers to stopovers i.e. a city two nodes away has 1 stopover in between, it is easier to work with steps
        //than stopovers so we add 1 to `k`
        let cost = dfs(cities, src, dst, (k + 1), &memo)
        
        let cheapestCost: Int = cost >= Double(Int.max) ? -1 : Int(cost)
        
        return cheapestCost
    }
    
    private static func dfs(_ cities: [[(Int, Double)]], _ src: Int, _ dst: Int, _ k: Int, _ memo: inout [String: Double]) -> Double {
        if src == dst && k >= 0 { //first base case
            return 0
        }
        
        guard k > 0 else { //second base case
            return Double(Int.max)
        }
        
        let key = "\(src)-\(k)" //`k` is very important here
        
        //check if we have already went down the `key` branch and can just return the result of the previous effort
        guard memo[key] == nil else {
            return memo[key]!
        }
        
        var cheapestCost = Double(Int.max) //Int.max is being used here as a "no path possible" indicator
        for neighbor in cities[src] {
            let city = neighbor.0
            let cost = neighbor.1
            
            let remainingJourneyCost = dfs(cities, city, dst, (k - 1), &memo) + cost
            cheapestCost = min(cheapestCost, remainingJourneyCost)
        }
        
        memo[key] = cheapestCost
        
        return cheapestCost
    }
    
    //Time: O(v * e) where v is the number of cities in `flights`
    //               where e is the number of connections between cities
    //Space: O(v * min(v, k)) (technically 3v for `cities`, `visited` and the recursive stack)
    //graph theory
    //visited
    //adjacency list
    //backtracking
    //DFS
    //recursive
    //
    //Solution Description:
    //First we convert `flights` into an adjacency list containing as the index each city and as the value an array
    //containing the connected city and the flight cost. Using this adjacency list are able to traverse the graph using
    //backtracking to work our way through each possible path and determine if it not only gets us to `dst` but does so
    //in with `k` stopovers. To avoid getting caught in a cycle of cities we keep track of the cities we have traversed
    //in the `visited` set. As we backtrack we remove `cities` from `visited` so that they can reused in different
    //paths. If we manage to get to `dst` within in `k` stopovers we compare the cost of that path against the cheapest
    //cost that we have encountered so far. If the current price is cheaper then we override `cheapestPrice` with that
    //cheaper price.
    static func findCheapestPriceBacktracking(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var cities = Array(repeating: [(Int, Int)](), count: n)
        
        for flight in flights {
            let src = flight[0]
            let dst = flight[1]
            let cost = flight[2]
            
            cities[src].append((dst, cost))
        }
        
        var visited = Set<Int>()
        visited.insert(src)
        var minCost = Int.max
        
        //`k` refers to stopovers i.e. a city two nodes away has 1 stopover in between, it is easier to work with steps
        //than stopovers so we add 1 to `k`
        backtracking(cities, src, dst, (k + 1), &visited, 0, &minCost)
        
        return minCost == Int.max ? -1 : minCost
    }
    
    private static func backtracking(_ cities: [[(Int, Int)]], _ src: Int, _ dst: Int, _ k: Int, _ visited: inout Set<Int>, _ currentPrice: Int, _ cheapestPrice: inout Int) {
        if src == dst && k >= 0 {
            cheapestPrice = min(cheapestPrice, currentPrice)
            return
        }
        
        guard k > 0 else {
            return
        }
        
        for neighbor in cities[src] {
            let city = neighbor.0
            let flightCost = neighbor.1
            
            guard !visited.contains(city) else {
                continue
            }
            
            visited.insert(city)
            backtracking(cities, city, dst, (k - 1), &visited, (currentPrice + flightCost), &cheapestPrice)
            visited.remove(city)
        }
    }
}
