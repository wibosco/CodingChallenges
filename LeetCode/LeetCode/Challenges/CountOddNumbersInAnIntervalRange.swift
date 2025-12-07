// Created 07/12/2025.

import Foundation

//https://leetcode.com/problems/count-odd-numbers-in-an-interval-range/
struct CountOddNumbersInAnIntervalRange {
    
    //Time: O(1)
    //Space: O(1)
    //math
    //modulo
    //
    //Solution Description:
    //The number of odd numbers in a range can be determined by calculting half the range (`low...high`) and then adding an
    //offset if both `low` and `high` are odd.
    func countOdds(_ low: Int, _ high: Int) -> Int {
        let range = (high - low) + 1
        let offset = ((low % 2 == 1) && (high % 2 == 1)) ? 1 : 0

        let count = (range / 2) + offset

        return count
    }
    
    //Time: O(n) where is the range `low...high`
    //Space: O(1)
    //looping
    //modulo
    //
    //Solution Description:
    //Loop form `low` to `high` we count the odd numbers by performing a modulo operation.
    func countOdds2(_ low: Int, _ high: Int) -> Int {
        var count = 0

        for i in low...high {
            if i % 2 != 0 {
                count += 1
            }
        }

        return count
    }
}
