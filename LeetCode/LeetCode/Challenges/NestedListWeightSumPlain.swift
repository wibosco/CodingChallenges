// Created 01/09/2025.

import Foundation

//https://leetcode.com/problems/nested-list-weight-sum/ with a string array
class NestedListWeightSumPlain {
    
    //Time: O(n) where n is the characters of elements in `nestedList`
    //Space: O(1)
    //array
    //fast forward
    //
    //Solution Description:
    //Treating `nestedList` as an array of characters we iterate through each character when we encounter a number we
    //multiple it by the bracket depth and add it to `sum`. As number can be multiple digits, when we encounter a number
    //we fast forward through `nestedList` until we build the "whole" number. Encountering a "[" is treated as going "deeper"
    //so we increment `depth` whereas encountering a "]" is treated as "surfacing" so we decrement `depth`. When all
    //characters in `nestedList` have been processed we return `sum`.
    func depthSum(_ nestedList: String) -> Int {
        let nestedList = Array(nestedList)
        
        var p1 = 0
        
        var depth = 0
        var sum = 0
        
        while p1 < nestedList.count {
            guard nestedList[p1] != "," else {
                p1 += 1
                continue
            }
            
            if nestedList[p1] == "[" {
                depth += 1
                
                p1 += 1
            } else if nestedList[p1] == "]" {
                depth -= 1
                
                p1 += 1
            } else {
                var num = 0
                while p1 < nestedList.count, let digit = nestedList[p1].wholeNumberValue {
                    num *= 10
                    num += digit
                    
                    p1 += 1
                }
                
                sum += (num * depth)
            }
        }
        
        return sum
    }
}
