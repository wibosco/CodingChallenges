//
//  KeysAndRooms.swift
//  LeetCode
//
//  Created by William Boles on 15/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/keys-and-rooms/
struct KeysAndRooms {
    
    //Time: O(n + e) where n is the number of rooms
    //               where e the number of keys
    //Space: O(n) where n is the number of rooms
    //graph theory
    //BFS
    //adjacency list
    //
    //Solution Description:
    //Treat the rooms and keys as an adjacency list, we can traverse the rooms using BFS. Starting at room 0
    //we add the room to both `queue` and `visited`. We then get the keys for room 0, we check that they don't
    //open a room we have already visited and we add them to the queue. When the queue is empty we compare the
    //rooms visited with the total rooms.
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var queue = [0]
        var visited = Set<Int>(arrayLiteral: 0)
        
        while !queue.isEmpty {
            var newQueueItems = [Int]()
            
            for index in queue {
                let neighbors = rooms[index]
                for neighbor in neighbors {
                    guard !visited.contains(neighbor) else {
                        continue
                    }
                    
                    visited.insert(neighbor)
                    newQueueItems.append(neighbor)
                }
            }
            
            queue = newQueueItems
        }
        
        return visited.count == rooms.count
    }
    
    //Time: O(n + e) where n is the number of rooms
    //               where e the number of keys
    //Space: O(n) where n is the number of rooms
    //graph theory
    //DFS
    //adjacency list
    //recursive
    //
    //Solution Description:
    //Treat the rooms and keys as an adjacency list, we can traverse the rooms using DFS. Starting at room 0
    //we add the room to `visited`. We then get the keys for room 0, we check that they don't open a room we
    //have already visited and we perform a recursive key with the new keys. When the recursive DFS call finishes
    //we compare the rooms visited with the total rooms.
    func canVisitAllRoomsDFSRecursive(_ rooms: [[Int]]) -> Bool {
        var visited = Set<Int>(arrayLiteral: 0)
        dfs(rooms, 0, &visited)
        
        return visited.count == rooms.count
    }
    
    private func dfs(_ rooms: [[Int]], _ root: Int, _ visited: inout Set<Int>) {
        let neighbors = rooms[root]
        for neighbor in neighbors {
            guard !visited.contains(neighbor) else {
                continue
            }
            
            visited.insert(neighbor)
            dfs(rooms, neighbor, &visited)
        }
    }
    
    //Time: O(n + e) where n is the number of rooms
    //               where e the number of keys
    //Space: O(n) where n is the number of rooms
    //graph theory
    //DFS
    //adjacency list
    //iterative
    //
    //Solution Description:
    //Treat the rooms and keys as an adjacency list, we can traverse the rooms using DFS. Starting at room 0
    //we add the room to both `stack` and `visited`. We then get the keys for room 0, we check that they don't
    //open a room we have already visited and we add them to the stack. When the stack is empty we compare the
    //rooms visited with the total rooms.
    func canVisitAllRoomsDFSIterative(_ rooms: [[Int]]) -> Bool {
        var stack = [0]
        var visited = Set<Int>(arrayLiteral: 0)
        
        while !stack.isEmpty {
            let index = stack.removeLast()
            
            let neighbors = rooms[index]
            for neighbor in neighbors {
                guard !visited.contains(neighbor) else {
                    continue
                }
                
                visited.insert(neighbor)
                stack.append(neighbor)
            }
        }
        
        return visited.count == rooms.count
    }
}
