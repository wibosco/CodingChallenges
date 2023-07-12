//
//  BrickWall.swift
//  LeetCode
//
//  Created by William Boles on 10/07/2023.
//

import Foundation

//https://leetcode.com/problems/brick-wall/
//array
struct BrickWall {
    
    //Time: O(n * m) where n is the number of elements in `wall`, m is the number of elements in each row
    //Space: O(m)
    //counting
    //nested loops
    //
    //Solution Description:
    //To cut through the least number of bricks we need to find a path that uses the most gaps (the space between the bricks).
    //The left and right edges of the wall don't count as a gap. Thinking of the wall in terms of rows and columns we can
    //treat each brick as occupying at least one index in this table. This indexing allows us to iterate through each row and
    //each brick in those rows and track where the gaps are in the wall against each other i.e. we only care about the column
    //index of each gap and can forget about the row index. We iterate through each brick row and take the width/length of
    //each brick to determine where that brick ends and so where the gap is in that row - we track this gap in
    //`gapsBetweenBricks`. Once we have iterated through all bricks in the wall we retrieve the index with the maximum gaps
    //and use that to determine the least destructive path through the wall. If there are no internal gaps in the wall then we
    //default to `0`.
    //
    //N.B. The trick here to stop thinking about cutting through bricks and rather start thinking about avoiding cuts by
    //using the gaps between bricks.
    static func leastBricks(_ wall: [[Int]]) -> Int {
        var gapsBetweenBricks = [Int: Int]() //[row-index: gap-count]

        for bricks in wall {
            var gapOffset = 0 //index offset in this row of bricks where each gap is i.e. column
            for brick in bricks[0..<(bricks.count - 1)] { //don't count row right gap
                gapOffset += brick //add bricks width straight away to avoid counting row left gap
                
                gapsBetweenBricks[gapOffset, default: 0] += 1
            }
        }
        
        return wall.count - (gapsBetweenBricks.values.max() ?? 0)
    }
}
