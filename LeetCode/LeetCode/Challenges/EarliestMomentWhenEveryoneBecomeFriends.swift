//
//  EarliestMomentWhenEveryoneBecomeFriends.swift
//  LeetCode
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

//Union-by-rank/disjoint set
//See: https://www.youtube.com/watch?v=wU6udHRIkcc
//
//Can only be applied on undirected graphs
//
//Solution Description:
//1. Each vertice is given an initial value of -1 to indicate
//   that they are their own root
//2. Perform a union between two vertices by finding the root
//   of each vertice (this will be a negative number). This root
//   may not be directly associated with the vertice but instead
//   require multiple steps hence the while loop in `find`
//3. Compare the size of the nodes assoicated with each vertices
//   root and select the root with the most nodes i.e. lowest
//   negative value. Update the smaller root to point at the other
//   root and update the other roots count to include the count that
//   the former root had
private final class UnionFindCounting {
    var ranks: [Int]
    var distinctSetsCount: Int
    
    // MARK: - Init
    
    init(count: Int) {
        self.distinctSetsCount = count
        ranks = Array(repeating: -1, count: count)
    }
    
    // MARK: - Operations
    
    func find(_ x: Int) -> Int { //O(1)
        guard ranks[x] >= 0 else { // 0 is valid as an array index
            return x
        }
        ranks[x] = find(ranks[x]) //update ranks[x] to point nearer to the root of this set so speeding up finding
        return ranks[x]
    }
    
    func union(_ x: Int, _ y: Int) { //O(1)
        let xRoot = find(x)
        let yRoot = find(y)
        
        guard xRoot != yRoot else {
            //x and y are already in the same set
            return
        }
        
        distinctSetsCount -= 1 //merging two sets so reduce overall sets count by 1
        
        //join the smaller graph with larger. If both are the same
        //size then favour `x`
        if ranks[xRoot] <= ranks[yRoot] {
            let tmp = ranks[yRoot]
            ranks[yRoot] = xRoot
            ranks[xRoot] += tmp //increasing the value as this index, increases the rank of that root
        } else {
            let tmp = ranks[xRoot]
            ranks[xRoot] = yRoot
            ranks[yRoot] += tmp
        }
    }
}
