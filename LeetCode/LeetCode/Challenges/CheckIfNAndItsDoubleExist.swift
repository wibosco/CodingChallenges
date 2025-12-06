// Created 23/02/2024.

import Foundation

//https://leetcode.com/problems/check-if-n-and-its-double-exist/
struct CheckIfNAndItsDoubleExist {
    
    //Time: O(n) where n is the number of elements in `arr`
    //Space: O(n)
    //array
    //set
    //
    //Solution Description:
    //To avoid looping through `arr` multiple time we can use the set `seen` to store the values we have already seen
    //as we perform our one pass through `arr`. In that one pass we search for both double `value` and half `value`
    //(where the current value is an even number). If either of those values exist in `seen` we return true else we add
    //`value` to seen and move onto the next iteration of `arr`. If having iterated through `arr` without returning we
    //return false as a double doesn't exist.
    func checkIfExist(_ arr: [Int]) -> Bool {
        var seen = Set<Int>()
        
        for value in arr {
            //have we seen double this value already
            if seen.contains((value * 2)) {
                return true
            } else if value % 2 == 0 {
                //have we seen half of this value already i.e. this value is the double
                if seen.contains((value / 2)) {
                    return true
                }
            }

            seen.insert(value)
        }
        
        return false
    }
}
