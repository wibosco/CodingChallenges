// Created 08/04/2023.

import Foundation

//https://leetcode.com/problems/increasing-triplet-subsequence
struct IncreasingTripletSubsequence {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //greedy
    //
    //Solution Description:
    //It's important to note that when finding this subsequence the elements not need to be contiguous so what we are trying to
    //find is just any elements that follow on from each where each element increases - not that the order is important. To do
    //this we need to track two - `small` and `medium` (no need to track `large` as finding `large` means we have our
    //subsequence and can return true). As we iterate through `nums` we compare the current element against `small` and `medium`.
    //First we are only interested in `small` then once that have a value we include `medium` and once `medium` has a value we
    //include `large`. It's important to note that we want the best version of `small` and `medium` so if we encounter smaller
    //elements that fit those roles, we replace the current value with that smaller value and so increase our chances of finding
    //a triplet. This might seem counter-intuitive at first, as by replacing `small` we have invalidated the ordering but we are
    //not trying to return the order only show that the correct sequence exists so we already that there is a smaller value than
    //`medium` to the left we don't lose that knowledge by replacing `small` we just lose what that smaller value is. By
    //replacing `small` we increase the chance that we will find an even smaller `medium` value and so increase the chances that
    //we will find a `large` value (as it no longer needs be quite as large now) however if we bump into a value that is larger
    //than `medium` before it can be replace - great - we just return true. 
    func increasingTriplet(_ nums: [Int]) -> Bool {
        var small = Int.max
        var medium = Int.max

        for num in nums {
            if num < small {
                small = num
            } else if num > small && num < medium {
                medium = num
            } else if num > medium {
                return true
            }
        }

        return false
    }
}
