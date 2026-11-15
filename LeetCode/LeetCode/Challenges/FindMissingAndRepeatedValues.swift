// Created 15/11/2026.

import Foundation

//https://leetcode.com/problems/find-missing-and-repeated-values/
struct FindMissingAndRepeatedValues {
    
    //Time: O(n ^ 2) where n is the number of rows and columns in `grid`
    //Space: O(n ^ 2)
    //matrix
    //array
    //set
    //
    //Solution Description:
    //As we know `grid` contains values in the range `1...n^2`, to find the missing value we use a set, `missing`, that is
    //pre-populated with every value in that range. As we iterate through `grid` we remove each value we encounter from
    //`missing`, so once we have iterated through all of `grid`, `missing` should contain only one value - the missing one.
    //To find the repeated value we use a set, `seen`, to track the values we have encountered as we iterate through `grid`.
    //When we encounter a value that is already in `seen`, we set `repeated` to that value. Once `grid` has been fully
    //traversed we return the repeated and missing values.
    func findMissingAndRepeatedValues(_ grid: [[Int]]) -> [Int] {
        var missing = Set(1...(grid.count * grid.count))
        var seen = Set<Int>()

        var repeated = -1

        for r in 0..<grid.count {
            for c in 0..<grid[r].count {
                let val = grid[r][c]
                
                missing.remove(val)

                guard !seen.contains(val) else {
                    repeated = val
                    continue
                }
                seen.insert(val)
            }
        }

        return [repeated, missing.first!]
    }
}
