//
//  CourseScheduleII.swift
//  LeetCode
//
//  Created by William Boles on 23/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/course-schedule-ii/
//graph theory
struct CourseScheduleII {
    
    //Time: O(n * m) `n` is number of courses and `m` is number of prerequisites
    //Space: O(n * m)
    //BFS
    //multi-source
    //indegree
    //outdegree
    //topological order
    //adjacency list
    //
    //Solution Description:
    //Using an adjacency list buld up the out going edges for each course to then use during BFS traversal. Also build up a count
    //of the in-degree for each course - in order for a course to be taken, all prerequisite course must have been taken first,
    //the `inDegrees` array will ensure this. As we can have multiple starting courses (courses with no prerequisities i.e
    //in-degree == 0) we add these first to the queue. Using BFS we then traverse the graph adding new courses to the queue when
    //they no longer have any outstanding prerequisities. Each course in the queue is added to the `order` array. Once the queue
    //is empty we check if the `order` arrays count is equal to `numCourses` and if so return that order and if not return any
    //empty array as some courses couldn't be taken - dependency cycle.
    //
    //In graph theory a `*degree` is either the number of incoming (`inDegree`) and outgoing (`outDegree`) edges.
    static func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        guard numCourses > 1 else {
            return [0]
        }
        
        var adjList = Array(repeating: [Int](), count: numCourses)
        var inDegrees = Array(repeating: 0, count: numCourses)//hold how many prerequisites a course has
        
        for p in prerequisites {
            adjList[p[1]].append(p[0])
            inDegrees[p[0]] += 1 //course at p[0] has one more prerequisites than it did before
        }
        
        var queue = [Int]()
        
        for (i, inDegree) in inDegrees.enumerated() {
            if inDegree == 0 { //courses that don't have prerequisites
                queue.append(i)
            }
        }
        
        var order = [Int]()
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            order.append(node)
            
            for n in adjList[node] {
                inDegrees[n] -= 1
                guard inDegrees[n] == 0 else { //use inDegrees as a kind-of visited set
                    continue
                }
                
                queue.append(n)
            }
        }
        
        if order.count == numCourses { //check if graph contains a dependency cycle between courses i.e. A -> B -> A
            return order
        } else {
            return [Int]()
        }
    }
}
