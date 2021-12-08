//
//  EarliestMomentWhenEveryoneBecomeFriends.swift
//  CodingChallenges
//
//  Created by William Boles on 30/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/the-earliest-moment-when-everyone-become-friends/
//graph theory
struct EarliestMomentWhenEveryoneBecomeFriends {
    
    //Time: O(n log n) where n is the number of logs
    //Space: O(n + l) where n is the number of nodes/vertices and l is the number of logs
    //disjoint set
    //
    //Solution Description
    //Using disjoint sets combine the logs together. Sort the logs so that as we merge
    //each log into sets when we get to one set we know that we have the earliest time
    //and can return. If we get to the end with getting to one set we know not everyone
    //are friends and so can return -1
    static func earliestAcq(_ logs: [[Int]], _ n: Int) -> Int {
        let sortedLogs = logs.sorted { $0[0] < $1[0] }
        let unionFind = UnionFindCounting(count: n)
        
        for log in sortedLogs {
            unionFind.union(log[1], log[2])
            
            if unionFind.distinctSetsCount == 1 {
                return log[0]
            }
        }
    
        return -1
    }
}
