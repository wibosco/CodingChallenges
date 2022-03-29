//
//  DecodeWays.swift
//  LeetCode
//
//  Created by William Boles on 21/03/2022.
//

import Foundation

//https://leetcode.com/problems/decode-ways/
//string
struct DecodeWays {
    private static let alphabet = ["1": "a", "2": "b", "3": "c", "4": "d", "5": "e", "6": "f", "7": "g", "8": "h", "9": "i", "10": "j", "11": "k", "12": "l", "13": "m", "14": "n", "15": "o", "16": "p", "17": "q", "18": "r", "19": "s", "20": "t", "21": "u", "22": "v", "23": "w", "24": "x", "25": "y", "26": "z"]
    
    //Time: O(n) where `n` is the number of 
    //Space: O(n)
    //memoization
    //recursive
    //DFS
    //binary tree
    //
    //Solution Description:
    //Treating `s` and the possible ways of decoding it as a binary tree we can perform a DFS through the tree. As this
    //binary tree will have repeating subtrees i.e. the same paths but in different order, we can use memoization to cut
    //down on the number of recursive calls needed by returning the number of possible decoding paths from any given
    //index. This means that we only need to complete the DFS iteration through the tree once for every index so if we
    //end up on that index again we can shortcut and just return the count. The other consideration is that only certain
    //paths through `s` are valid so when attempting to decode we need to check if the present character sequence is a
    //valid encoding
    //
    //Similar to: https://leetcode.com/problems/climbing-stairs/
    static func numDecodings(_ s: String) -> Int {
        var memo = [Int: Int]()
        
        return dfs(Array(s), 0, &memo)
    }
    
    private static func dfs(_ characters: [Character], _ left: Int, _ memo: inout [Int: Int]) -> Int {
        guard left < characters.count else {
            return 1
        }
        
        guard memo[left] == nil else {
            return memo[left]! //already seen how this index ends - remember this is DFS so each path is taken to the end
                               //before any other path is started
        }
        
        var decodings = 0
        for i in 0...1 {
            let right = (left + i)
            
            guard right < characters.count else {
                break
            }
            
            let encoding = String(characters[left...right])
                
            guard alphabet[encoding] != nil else {
                continue
            }
                
            decodings += dfs(characters, (right + 1), &memo) //this index has been used so move the nect iteration should move on
        }
        
        memo[left] = decodings
        
        return decodings
    }
}
