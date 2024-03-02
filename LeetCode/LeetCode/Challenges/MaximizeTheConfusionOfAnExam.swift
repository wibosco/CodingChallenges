//
//  MaximizeTheConfusionOfAnExam.swift
//  LeetCode
//
//  Created by William Boles on 02/03/2024.
//

import Foundation

//https://leetcode.com/problems/maximize-the-confusion-of-an-exam/
struct MaximizeTheConfusionOfAnExam {
    
    //Time: O(n) where n is the number of characters in `answerKey`
    //Space: O(1)
    //array
    //string
    //sliding window
    //
    //Solution Description:
    //Using a resizing sliding window we can move through `answerKey` and determine the largest window possible for either 
    //"T" or "F". In the sliding window we track the number of elements that match `character` (`matchedCount`) and the
    //number of elements that don't (`unmatched`). If `unmatched` is less than or equal to `k` then that window is "valid"
    //and we can expand it rightwards while keeping it left edge the same; if `unmatched` is greater than `k` then the
    //window is "invalid" and we move the left edge rightwards to attempt to make the window "valid" again. When the
    //window is "valid" we compare it against the largest window seen so far and repalce that largest window with the
    //current one if it is larger. Once we reach the end of characters we return this largest window. We perform this
    //process for both "T" and "F" and then take the larger of the two windows.
    func maxConsecutiveAnswers(_ answerKey: String, _ k: Int) -> Int {
        let characters = Array(answerKey)

        let maxTrueWindowSize = slidingWindow(characters, k, "T")
        let maxFalseWindowSize = slidingWindow(characters, k, "F")
        
        return max(maxTrueWindowSize, maxFalseWindowSize)
    }
    
    private func slidingWindow(_ values: [Character], _ maxChanges: Int, _ character: Character) -> Int {
        var left = 0
        var right = 0
        
        var matchedCount = 0
        var unmatchedCount = 0
        
        var maxWindowSize = 0
        
        while right < values.count {
            let value = values[right]
            
            if value == character {
                matchedCount += 1
            } else {
                unmatchedCount += 1
            }
            
            if unmatchedCount <= maxChanges {
                let windowSize = (right - left) + 1
                maxWindowSize = max(maxWindowSize, windowSize)
            } else {
                let leftValue = values[left]
                
                if leftValue == character {
                    matchedCount -= 1
                } else {
                    unmatchedCount -= 1
                }
                
                left += 1
            }
            
            right += 1
        }
        
        return maxWindowSize
    }
    
    //Time: O(2^n) where n is the number of characters in `answerKey`
    //Space: O(1)
    //array
    //string
    //DFS
    //recursive
    //top-down
    //
    //Solution Description:
    //Treating `answerKey` as a graph we perform a DFS traversal of that graph counting the number of consecutive characters
    //that match. As we can change characters that don't match, when we encounter a non-matching character we branch our
    //search with one branch changing that character (if `changesRemaining` is greater than 0) and the other branch leaving
    //the unmatched character as is. Once we reach the leaf node(s) or have encountered an unmatched character while having a
    //`changesRemaining` count of 0 we return the count of the consecutive matching characters. As the recursive stack unwinds
    //we compare the 3 possible branches and take the larger of the consecutive matching character count and return it until
    //we eventually exit the graph. We perform the same DFS for `T` and `F` matching, returning the overall larger count.
    func maxConsecutiveAnswersDFS(_ answerKey: String, _ k: Int) -> Int {
        let characters = Array(answerKey)
        
        let trueCount = dfs(characters, 0, "T", k, 0)
        let falseCount = dfs(characters, 0, "F", k, 0)
        
        return max(trueCount, falseCount)
    }
    
    private func dfs(_ values: [Character], _ index: Int, _ character: Character, _ changesRemaining: Int, _ consecutiveCount: Int) -> Int {
        guard index < (values.count - 1) else {
            return (values[index] == character) || (changesRemaining > 0) ? consecutiveCount + 1 : consecutiveCount
        }
        
        var matchedCount = consecutiveCount
        var changeCount = consecutiveCount
        var unchangeCount = 0
        
        if values[index] == character {
            matchedCount = dfs(values, (index + 1), character, changesRemaining, (consecutiveCount + 1))
        } else {
            if changesRemaining > 0 {
                changeCount = dfs(values, (index + 1), character, (changesRemaining - 1), (consecutiveCount + 1))
            }
            
            unchangeCount = dfs(values, (index + 1), character, changesRemaining, 0)
        }
        
        let maxCount = max(matchedCount, changeCount, unchangeCount)
        
        return maxCount
    }
}
