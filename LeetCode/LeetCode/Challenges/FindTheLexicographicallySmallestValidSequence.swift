//
//  FindTheLexicographicallySmallestValidSequence.swift
//  LeetCode
//
//  Created by William Boles on 04/02/2025.
//

//
import Foundation

//https://leetcode.com/problems/find-the-lexicographically-smallest-valid-sequence/
struct FindTheLexicographicallySmallestValidSequence {
    
    //Time: O(n * m) where n is the number of characters in `words1`
    //               where m is the number of characters in `words2`
    //Space: O(
    //string
    //array
    //DFS
    //recursive
    //in-out
    //backtracking
    //memoization
    //greedy
    //two pointers
    //
    //Solution Description:
    //Treating `word1` as a graph we can use DFS with backtracking to traverse it in the pursuit of finding a sequence of
    //characters that match `words2`. At each node in `words1` we check if it is equal to the current search character of
    //`words2` - if they are equal we "take" that node and add it to `currentPath`; if they are not equal we potentally
    //follow two paths:
    //
    //1. If `changes` is greater than 0 we can change the node's value to match the current search character and can
    //   continue traversing down that path.
    //2. We skip that node and check the next node for the current search character.
    //
    //To improve the efficiency of our search we use memoization to store any failed paths we have already traversed. If
    //we find a path through `word1` that matches `word2` we set that path to `foundPath` and return from our recursive
    //stack.
    func validSequence(_ word1: String, _ word2: String) -> [Int] {
        let chars1 = Array(word1)
        let chars2 = Array(word2)
        
        var memo = Set<[Int]>()
        var currentPath = [Int]()
        var foundPath = [Int]()
        
        dfs(chars1, chars2, 0, 0, 1, &currentPath, &foundPath, &memo)
        
        return foundPath
    }
    
    private func dfs(_ chars1: [Character], _ chars2: [Character], _ p1: Int, _ p2: Int, _ changes: Int, _ currentPath: inout [Int], _ foundPath: inout [Int], _ memo: inout Set<[Int]>) {
        guard foundPath.isEmpty else {
            return
        }
        
        guard changes >= 0 else {
            return
        }
        
        guard p2 < chars2.count else {
            foundPath = currentPath
            return
        }
        
        guard p1 < chars1.count else {
            return
        }
        
        let key = [currentPath.count, p1, p2, changes]
        guard !memo.contains(key) else {
            return
        }

        if chars1[p1] == chars2[p2] {
            currentPath.append(p1)
            dfs(chars1, chars2, p1 + 1, p2 + 1, changes, &currentPath, &foundPath, &memo)
            currentPath.removeLast()
        } else {
            currentPath.append(p1)
            dfs(chars1, chars2, p1 + 1, p2 + 1, changes - 1, &currentPath, &foundPath, &memo)
            currentPath.removeLast()
            
            if foundPath.isEmpty { //no path found so try skipping
                dfs(chars1, chars2, p1 + 1, p2, changes, &currentPath, &foundPath, &memo)
            }
        }
        
        memo.insert(key)
    }
}
