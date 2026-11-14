// Created 14/11/2026.

import Foundation

//https://leetcode.com/problems/rotate-string/
struct RotateString {
    
    //Time: O(n * m) where n is the number of characters in `s`
    //               where m is the number of characters in `goal`
    //Space: O(n + m)
    //array
    //modulo
    //two pointers
    //
    //Solution Description:
    //If `goal` is a rotation of `s`, then `s` can be found within `goal` by starting at some index and wrapping around
    //the end. We iterate through `goal` looking for characters that match the first character of `s` - each one is a
    //potential starting index. From there, we step through `s` and `goal` together, comparing characters. If a pair
    //doesn't match, this isn't a valid rotation, so we move on to the next potential starting index. The `goal` pointer
    //wraps around to 0 using modulo when it reaches the end of its array. If every character of `s` matches, the `goal`
    //pointer will have wrapped all the way back to the starting index, so we return true. If no starting index produces
    //a full match, we return false.
    func rotateString(_ s: String, _ goal: String) -> Bool {
        guard s.count == goal.count else {
            return false
        }

        let s = Array(s)
        let goal = Array(goal)

        for i in 0..<goal.count {
            guard goal[i] == s[0] else {
                continue
            }

            var j = i

            for k in 0..<s.count {
                guard goal[j] == s[k] else {
                    break
                }

                j = (j + 1) % goal.count
            }

            if j == i { //all of `s` matched and we ended up back at the same index that we began from
                return true
            }
        }

        return false
    }
}
