// Created 12/07/2023.

import Foundation

//https://leetcode.com/problems/grid-game/
struct GridGame {
    
    //Time: O(n) where n is the number of elements in `grid`
    //Space: O(n)
    //array
    //prefix sum
    //
    //Solution Description:
    //The trick here is not to maximise the points taken by the first robot by implementing a greedy solution, instead we to
    //want to minimise the available points available for the second robot. The key observation is that once a robot can not
    //move left or up so once a robot moves either right or down, points become unreachable i.e. after moving onto the second
    //row, all available points on the first row are unreachable and vice-versa. So instead of the first robot maximise it's
    //points total, it needs to deny as many points as possible to the second robot by splitting those points over the 2 rows.
    //That way the second robot can only reach half the available points still remaining on the grid after the first robot has
    //completed it's path. So using prefix sums we first calculate the path for any given cell in the grid based on it's row.
    //These prefix sums will allow us to calculate the points gathered by each robot without having to actually traverse `grid`
    //each time. Next we test out each the first robot making a downwards movement at each downward option. With the rows
    //effectively cut in two we calculate the points available on each row and the second robot chooses the greater. We then
    //compare that greater against `minPointsAvailable` and keep track of the overall minimum points available for the second
    //robot - this minimum is across all maximum points available i.e. if the first robot made the optimal downwards turn to
    //minimise the available points for the second robot and that second robot then choose the maximum available points.
    //Finally after iterating through each possible downward turning point, we return the minimum-maximum points that the
    //second can get.
    //
    //N.B. it really helps to think of the two robots as actually competing.
    func gridGame(_ grid: [[Int]]) -> Int {
        //grid always contains two rows
        var prefixSumRow1 = grid[0]
        var prefixSumRow2 = grid[1]
        
        for i in 1..<grid[0].count {
            prefixSumRow1[i] += prefixSumRow1[(i - 1)]
            prefixSumRow2[i] += prefixSumRow2[(i - 1)]
        }
        
        var minPointsAvailable = Int.max
        
        for i in 0..<grid[0].count { //first robot traversing each downward path that can be taken
            let topPointsAvailable = prefixSumRow1.last! - prefixSumRow1[i]
            let bottomPointsAvailable = i > 0 ? prefixSumRow2[(i - 1)] : 0
            //second robot wants maximum points
            let secondRobotPoints = max(topPointsAvailable, bottomPointsAvailable)
            
            //only store the path that results in the minimum points for the second robot
            minPointsAvailable = min(minPointsAvailable, secondRobotPoints)
        }
        
        return minPointsAvailable
    }
}
