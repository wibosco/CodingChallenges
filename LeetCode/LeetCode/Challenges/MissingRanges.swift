//
//  MissingRanges.swift
//  LeetCode
//
//  Created by William Boles on 10/04/2022.
//

import Foundation

//https://leetcode.com/problems/missing-ranges/
//array
struct MissingRanges {
    
    //Time: O(n) where n is the number of elements in `num`
    //Space: O(1)
    //two pointers
    //
    //Solution Description:
    //There are potentally two missing values from `nums` to allow us to determine all the missings ranges - `lower` and
    //`upper`. To avoid having to copy and alter `nums` to include these values we "virtually" insert them into the
    //iteration of `nums` by setting the first neighbor to be compared against as being `lower` (`-1` as an missing range
    //should include `lower` as a missing ranges lower bounds whereas actual `nums` neighbors would set the lower bounds to
    //"inside" that `nums` neighbors value i.e. `neighbor + 1` so the `-1` ensures that no special logic is required for the
    //artificial `nums` entry - `lower`) and setting the last neighbor to be `upper` (`+1` same reason as lower `-1`). To
    //accommodate this when comparing neighbors we don't directly access the previous element in `nums` i.e (`i - 1`) instead
    //we store the `previous` neighbor outside of the loop (initally set to `lower - 1`) and update it once an iteration is
    //complete with the `current` value; equally we iterate beyond the count of `nums` to allow us to include the `upper`
    //bounds. When iterating through `nums` if we find at least a value difference of 2 between neighbors we know that we
    //have a missing range. If that range is only 2 then there is only one number between the neighbors and we can include
    //that number as a single entry in `missingRanges`; if that range is greater than 2 then we need to include the ranges
    //upper and lower bounds as an entry in `missingRanges`. It's important to note here that the missing range does not
    //include `previous` and `current` as both these values are included in `nums` instead it includes the values "inside"
    //those `previous` and `current`
    static func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
        var missingRanges = [String]()
        
        var previous = lower - 1
        
        for i in 0...nums.count { //including `nums.count` in the range
            let current = i < nums.count ? nums[i] : upper + 1
            
            let diff = current - previous
            
            if diff >= 2 {
                //two difference so one number between
                if diff == 2 {
                    //`previous` is in `nums` so the missing value is after it could have been `current - 1` as it's
                    //the same value
                    missingRanges.append("\((previous + 1))")
                } else {
                    //`previous` and `current` are in `nums` so the missing values are between those values
                    missingRanges.append("\((previous + 1))->\(current - 1)")
                }
            }
            
            previous = current
        }
        
        return missingRanges
    }
    
    //Time: O(n) where n is the number of elements in `num`, plus the lower and upper bounds
    //Space: O(n)
    //two pointers
    //
    //Solution Description:
    //There are potentally two missing values from `nums` to allow us to determine all the missings ranges - `lower` (`-1` as
    //an missing range should include `lower` as a missing ranges lower bounds whereas actual `nums` neighbors would set the
    //lower bounds to "inside" that `nums` neighbors value i.e. `neighbor + 1` so the `-1` ensures that no special logic is
    //required for the artificial `nums` entry - `lower`) and `upper` (`+1` same reason as lower `-1`). By adding these two
    //values into `nums` we can now iterate through `nums` comparing neighbors. When iterating through `nums` if we find at
    //least a value difference of 2 between neighbors we know that we have a missing range. If that range is only 2 then there
    //is only one number between the neighbors and we can include that number as a single entry in `missingRanges`; if that
    //range is greater than 2 then we need to include the ranges upper and lower bounds as an entry in `missingRanges`. It's
    //important to note here that the missing range does not include `previous` and `current` as both these values are included
    //in `nums` instead it includes the values "inside" those `previous` and `current`
    static func findMissingRangesExpandedNums(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
        var missingRanges = [String]()
        
        var nums = nums
        nums.insert((lower - 1), at: 0) //`- 1` to allow + 1 to be applied later and stay consistent with `nums`
        nums.append((upper + 1)) //`+ 1` to allow - 1 to be applied later and stay consistent with `nums`
        
        for i in 1..<nums.count {
            let previous = nums[(i - 1)]
            let current = nums[i]
            
            let diff = current - previous
            
            if diff >= 2 {
                //two difference so one number between
                if diff == 2 {
                    //`previous` is in `nums` so the missing value is after it could have been `current - 1` as it's
                    //the same value
                    missingRanges.append("\((previous + 1))")
                } else {
                    //`previous` and `current` are in `nums` so the missing values are between those values
                    missingRanges.append("\((previous + 1))->\(current - 1)")
                }
            }
        }
        
        return missingRanges
    }
}
