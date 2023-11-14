//
//  ValidParenthesisString.swift
//  LeetCode
//
//  Created by William Boles on 05/07/2023.
//

import Foundation

//https://leetcode.com/problems/valid-parenthesis-string/
struct ValidParenthesisString {
    
    //Time: O(n^3) where n is the number of characters in `s`
    //Space: O(n^2)
    //string
    //array
    //graph theory
    //DFS
    //recursive
    //n-ary tree
    //memoization
    //top-down
    //dynamic programming
    //
    //Solution Description:
    //In order for parentheses to balance, a left parenthesis must come before a right parenthesis i.e. we can recover from any
    //number of unpaired left parenthesis later in the string but we can't recover from an unpaired right parenthesis. So if we
    //keep track of the number of left parenthesis that we encounter and subtract one from that count whenever we encounter a
    //right parenthesis then if that count ever drops below 0 then we know that this combination of parenthesis can not be valid.
    //Treating `s` as a graph we can explore/generate all possible values of `*` to determine if any lead to a valid string.
    //Using DFS we can then search each of these branches ("", "(", ")") and determine if any lead to `leftCount` being `0` once
    //the `s` has been fully iterated. There is no need for us to update `characters` with the choice we are making for any
    //given `*` instead we simply update `leftCount` to behave as if we had encountered one of the 3 possible choices for that
    //`*`. To save effort on traversing the graph we can store the result of completed branches in `memo`. The key to each `memo`
    //result being the current index and the left count - we don't need to care about the path we have taken only what we have
    //at that moment as all possible paths that got as to that same value of index and left count will be treated the same for
    //any forward choices.
    static func checkValidString(_ s: String) -> Bool {
        var memo = [String: Bool]()
        
        let result = dfs(Array(s), 0, 0, &memo)
        
        return result
    }
    
    private static func dfs(_ characters: [Character], _ index: Int, _ leftCount: Int, _ memo: inout [String: Bool]) -> Bool {
        let memoKey = "\(index)\(leftCount)"
        guard memo[memoKey] == nil else {
            return memo[memoKey]!
        }
        
        guard index < characters.count else {
            return (leftCount == 0)
        }
        
        guard leftCount >= 0 else {
            return false
        }
        
        let c = characters[index]
        var result = false
        
        if c == "(" {
            result = dfs(characters, (index + 1), (leftCount + 1), &memo)
        } else if c == ")" {
            result = dfs(characters, (index + 1), (leftCount - 1), &memo)
        } else { // *
            result = dfs(characters, (index + 1), leftCount, &memo) || //treat * as empty string
                    dfs(characters, (index + 1), (leftCount + 1), &memo) || //treat * as "("
                    dfs(characters, (index + 1), (leftCount - 1), &memo) //treat * as ")"
        }
        
        memo[memoKey] = result
        
        return result
    }
    
    //Time: O(n * 3^n) where n is the number of characters in `s`
    //Space: O(n)
    //string
    //array
    //graph theory
    //DFS
    //recursive
    //n-ary tree
    //inout
    //
    //Solution Description:
    //In order for parentheses to balance, a left parenthesis must come before a right parenthesis i.e. we can recover from any
    //number of unpaired left parenthesis later in the string but we can't recover from an unpaired right parenthesis. So if we
    //keep track of the number of left parenthesis that we encounter and subtract one from that count whenever we encounter a
    //right parenthesis then if that count ever drops below 0 then we know that this combination of parenthesis can not be valid.
    //Treating `s` as a graph we can explore/generate all possible values of `*` to determine if any lead to a valid string.
    //Using DFS we can then search each of these branches ("", "(", ")") and determine if any lead to `leftCount` being `0` once
    //the `s` has been fully iterated. There is no need for us to update `characters` with the choice we are making for any
    //given `*` instead we simply update `leftCount` to behave as if we had encountered one of the 3 possible choices for that
    //`*`.
    static func checkValidStringBruteForce(_ s: String) -> Bool {
        var isValid = false
        
        dfs(Array(s), 0, 0, &isValid)
        
        return isValid
    }
    
    private static func dfs(_ characters: [Character], _ index: Int, _ leftCount: Int, _ isValid: inout Bool) {
        guard !isValid else {
            return
        }
        
        guard index < characters.count else {
            isValid = (leftCount == 0)
            return
        }
        
        guard leftCount >= 0 else {
            return
        }
        
        let c = characters[index]
        
        if c == "(" {
            dfs(characters, (index + 1), (leftCount + 1), &isValid)
        } else if c == ")" {
            dfs(characters, (index + 1), (leftCount - 1), &isValid)
        } else { // *
            dfs(characters, (index + 1), leftCount, &isValid) //treat * as empty string
            dfs(characters, (index + 1), (leftCount + 1), &isValid) //treat * as "("
            dfs(characters, (index + 1), (leftCount - 1), &isValid) //treat * as ")"
        }
    }
}
