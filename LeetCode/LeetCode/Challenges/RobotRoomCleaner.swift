//
//  RobotRoomCleaner.swift
//  LeetCode
//
//  Created by William Boles on 01/04/2022.
//

import Foundation

//https://leetcode.com/problems/robot-room-cleaner/
struct RobotRoomCleaner {
    
    //Dummy implementation only used so solution will build
    final class Robot {
        // Returns true if the cell in front is open and robot moves into the cell.
        // Returns false if the cell in front is blocked and robot stays in the current cell.
        @discardableResult
        func move() -> Bool {
            return true
        }
        
        // Robot will stay in the same cell after calling turnLeft/turnRight.
        // Each turn will be 90 degrees.
        func turnLeft() {}
        func turnRight() {}
        
        // Clean the current cell.
        func clean() {}
    }
    
    //Time: O(4(n - m) where n is the size of the grid
    //                 where m is the number of obstacles
    //Space: O(n - m)
    //matrix
    //relative indexing
    //DFS
    //backtracking
    //visited
    //unknown start
    //
    //Solution Description:
    //Starting at an unknown location which will be [0, 0] we treat the possible movements from that location as movements
    //in a matrix so:
    //
    //up: is -1 row
    //down +1 row
    //left: -1 column
    //right: +1  column
    //
    //As we around the matrix we use these row and column changes to determine the matrix location we are at like you would
    //do on a graph with [0, 0] being the origin and positive and negative spaces existing. With this consistent coordinate
    //system we can now track where the robot is going so that we don't end up repeating movements using the `visited` set.
    //Using backtracking we are able to move in all unvisited/obstructed directions, ensuring that we cover the full matrix.
    //For each cell (row, column combination) we attempt to move in all directions in a DFS manner. As we are moving if we
    //encounter an obstacle or have no unvisited cell to move into we backtrack the robot. We do this by performing a 180
    //turn, move and then perform another 180 to face the original direction ready to choose a different direction.
    static func cleanRoom(_ robot: Robot) {
        // going clockwise : 0: 'up', 1: 'right', 2: 'down', 3: 'left'
        let relativeIndexing = [[-1, 0], [0, 1], [1, 0], [0, -1]]
        var visited = Set<[Int]>()
        
        backtrack(robot, 0, 0, 0, relativeIndexing, &visited)
    }
    
    private static func backtrack(_ robot: Robot, _ row: Int, _ column: Int, _ direction: Int, _ relativeIndexing: [[Int]], _ visited: inout Set<[Int]>) {
        visited.insert([row, column])
        robot.clean()
        
        // going clockwise : 0: 'up', 1: 'right', 2: 'down', 3: 'left'
        for i in 0..<relativeIndexing.count { //4 possible directions
            let newDirection = (direction + i) % relativeIndexing.count //wrap directions round
            let newRow = row + relativeIndexing[newDirection][0]
            let newColumn = column + relativeIndexing[newDirection][1]
            
            //haven't already been to this cell and doesn't contain an obstacle
            if !visited.contains([newRow, newColumn]) && robot.move() {
                backtrack(robot, newRow, newColumn, newDirection, relativeIndexing, &visited)
                
                //need to go back to the cell we came from and then face the same direction so that next iteration
                //we can choose a different direction
                robot.turnRight()
                robot.turnRight() //180 about turn
                robot.move()
                robot.turnRight()
                robot.turnRight() //180 about turn
            }
            
            robot.turnRight()
        }
    }
}
