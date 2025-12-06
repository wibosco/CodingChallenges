// Created 02/09/2024.

import Foundation

//https://leetcode.com/problems/long-pressed-name/
struct LongPressedName {
    
    //Time: O(n) where n is the number of characters in `name`
    //Space: O(n + m) where n is the number of characters in `name`
    //                where m is the number of characters in `typed`
    //string
    //array
    //two pointers
    //
    //Solution Description:
    //Using two pointers we iterate through `name` and `typed` and determine if the characters found at each pointer match. If they
    //don't match we return false; if they do match we need to determine what value to set `p2` to -  we do this by looking ahead to
    //the next `p1` value if available. If the next `p1` value is the same as curret value we increment `p2`; if th next value is
    //different to the current value we attempt to "fast forward" `p2` meaning that we increment `p2` until doesn't match the
    //current `p1` value. By doing this we ensure that we don't fast forward prematurely but only when `p1` is itself moving onto
    //a new value. If we iterate through `name` and it is a match for values checked in `typed` we need to ensure that all values
    //`typed` where checked which we do by comparing `p2` against the `typed` count - this avoids the scenario where the prefix of
    //`typed` matches but not its entirety.
    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        let nameChars = Array(name)
        let typedChars = Array(typed)
        
        var p1 = 0
        var p2 = 0
        
        while p1 < nameChars.count, p2 < typedChars.count {
            guard nameChars[p1] == typedChars[p2] else {
                return false
            }
            
            //Two scenarios for fast forwarding:
            //1. At the end of `name`
            //2. The next value to be check in `name` does not match the current value
            let canFastForward = ((p1 + 1) == nameChars.count) || (nameChars[p1] != nameChars[(p1 + 1)])
            
            if canFastForward {
                while p2 < typedChars.count, nameChars[p1] == typedChars[p2] {
                    p2 += 1
                }
            } else {
                p2 += 1
            }
            
            p1 += 1
        }
        
        return p2 == typedChars.count
    }
}
