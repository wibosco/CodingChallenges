//
//  MinimumNumberOfFlipsToMakeTheBinaryStringAlternating.swift
//  LeetCode
//
//  Created by William Boles on 27/07/2023.
//

import Foundation

//https://leetcode.com/problems/minimum-number-of-flips-to-make-the-binary-string-alternating/
struct MinimumNumberOfFlipsToMakeTheBinaryStringAlternating {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //array
    //sliding window
    //
    //Solution Description:
    //There are only two possible alternating patterns - one starts with `1` and the other starts with `0` e.g. for `s` of
    //length three: `101` or `010`. So know the two possible end states that `s` has to get to we just need to choose the
    //one with the fewest flips. As it's possible to move a prefix of `s` to the end of `s`, we know that we need to perform
    //the pattern matching multiple times. Rather than actually moving elements we can instead use a sliding window of size
    //`s` on a character array of `s` + `s`, this way our view into `s` will contain a valid version of `s`. Using this
    //sliding window and combined `s`, we can then compare a given character against those targets and track any mismatches.
    static func minFlips(_ s: String) -> Int {
        var characters = Array(s)
        
        let windowSize = characters.count
        //as every element can be moved to the end, do it here so that a sliding window can be used
        characters += characters
        
        var target1 = [Character]()
        var target2 = [Character]()
        
        for i in 0..<characters.count {
            if i % 2 == 0 {
                target1.append("0")
                target2.append("1")
            } else {
                target1.append("1")
                target2.append("0")
            }
        }
        
        var minimumFlips = Int.max
        
        var left = 0
        var right = 0
        
        var currentFlipsAgainstTarget1 = 0
        var currentFlipsAgainstTarget2 = 0
        
        while right < characters.count {
            if characters[right] != target1[right] {
                currentFlipsAgainstTarget1 += 1
            } else {
                currentFlipsAgainstTarget2 += 1
            }
            
            if right >= (windowSize - 1) {
                minimumFlips = min(minimumFlips, currentFlipsAgainstTarget1)
                minimumFlips = min(minimumFlips, currentFlipsAgainstTarget2)
                
                if characters[left] != target1[left] {
                    currentFlipsAgainstTarget1 -= 1
                } else {
                    currentFlipsAgainstTarget2 -= 1
                }
                
                left += 1
            }
            
            right += 1
        }

        return minimumFlips
    }
    
    //Time: O(n^2) where n is the number of elements in `s`
    //Space: O(n) not sure
    //array
    //multi-source
    //three pointers
    //memoization
    //dynamic programming
    //DFS
    //recursive
    //
    //Solution Description:
    //Treating `s` like a graph, we can use iterate through every possible version of `s` and produce an alternating string. We
    //iterate through each version of `s` and compare each element against it's immediate neighbors using three pointers. We know
    //that an alternating pattern should be "101" or "010" so if we find a pattern that does not match either of those we update
    //the appropriate element by flipping it. As we are going left-right we can only safely update the `mid` or `right` elements
    //as updating the `left` element will result in a previous alternating pattern being chnaged. When a flip is made we track
    //that flip and add it to an ongoing total of flips. Once all elements in that version of `s` have been checked, we compare
    //the number of flips required to make an alternating pattern against the minmum flips required for any version of `s`. To
    //reduce the amount of work required we use memoization. Once all version of `s` have been checked we return the minimum.
    static func minFlipsMemo(_ s: String) -> Int {
        var characters = Array(s)
        var minimumFlips = Int.max
        var memo = [[Character]: Int]()
        
        for _ in 0..<characters.count {
            let first = characters.removeFirst()
            characters.append(first)
            
            var copy = characters
            
            let flips = dfs(&copy, 1, &memo)
            minimumFlips = min(minimumFlips, flips)
        }
        
        return minimumFlips
    }
    
    private static func dfs(_ characters: inout [Character], _ mid: Int, _ memo: inout [[Character]: Int]) -> Int {
        guard mid < (characters.count - 1) else {
            return 0
        }
        
        let forward = Array(characters[mid...])
        
        guard memo[forward] == nil else {
            return memo[forward]!
        }
        
        let left = mid - 1
        let right = mid + 1
        
        var flips = 0
        
        if characters[left] != characters[right] {
            flipCharacter(&characters, right)
            
            flips += 1
        }
        
        if characters[left] == characters[mid] {
            flipCharacter(&characters, mid)
            
            flips += 1
        }
        
        let totalFlips = dfs(&characters, right, &memo) + flips
        
        memo[forward] = totalFlips
        
        return totalFlips
    }
    
    private static func flipCharacter(_ characters: inout [Character], _ index: Int) {
        if characters[index] == "0" {
            characters[index] = "1"
        } else {
            characters[index] = "0"
        }
    }
}
