//
//  FindtheTownJudge.swift
//  LeetCode
//
//  Created by William Boles on 03/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/find-the-town-judge/
//graph theory
struct FindTheTownJudge {
    
    //Time: O(n) where n is the number of elements in `trust`
    //Space: O(m) where m is the number of townfolk (n)
    //array
    //indegree
    //outdegree
    //
    //Solution Description:
    //Treat this as a graph problem with the `trust` array representing the edges between two vertices. A judge is someone who has
    //`n - 1` indegree connections and 0 outdegree conections. We first create in intial array to represent all the townfolk, with
    //the index being the identifier of that person and the value being difference between indegree and outdegree conections i.e.
    //add 1 for each indegree connection and remove 1 for each outdegree connection. Once all edges have been processed we then
    //iterate through the `townFolk` and check if an element has a value of `n - 1` i.e. trust by all but trusting no one. If there
    //is such an element we have our judge; if not the town doesn't have a judge.
    //
    //In graph theory a `*degree` is either the number of incoming (`inDegree`) and outgoing (`outDegree`) edges
    static func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var townFolk = Array(repeating: 0, count: n)
        
        for relationship in trust {
            let truster = (relationship[0] - 1) //off by 1 offset
            let trustee = (relationship[1] - 1)
            
            townFolk[truster] -= 1
            townFolk[trustee] += 1
        }
        
        for i in 0..<townFolk.count {
            if townFolk[i] == (n - 1) {
                return (i + 1) //off by 1 offset
            }
        }
        
        return -1
    }
}
