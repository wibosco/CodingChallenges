//
//  KthSymbolInGrammar.swift
//  LeetCode
//
//  Created by William Boles on 21/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/k-th-symbol-in-grammar/
struct KthSymbolInGrammar {
    
    //Time: O(n) where n is the depth of the tree
    //Space: O(n) where n is the depth of the recursive stack
    //binary tree
    //recusive
    //DFS
    //
    //Solution Description:
    //Think of this as a binary tree where we need to find the value of a leaf node.
    //
    //                        0
    //             0                          1
    //        0         1              1             0
    //     0    1     1   0         1    0         0    1
    //
    //Rather than build every level of that tree instead we need to only build the path from root to leaf. Using recursion we back
    //up the leaf, determing the `k` index for each level (i.e. the path) until we get to the root where we know that value will
    //always be 0. From root we begin to move back down the tree using the `k` index that we calculated for that level to know if
    //that index will hold a `0` or `1`. Using the parents value we know that its children will either be `0 1` or `1 0` i.e. a
    //parent of `0` will always produce children of `0 1` in that order so if the `k` index is odd then the children on our path
    //will always be `0` (remember we are indexing from 1) - the opposite approach is taken if the parent is `1` as it's childern
    //will be `1 0`. We repeat this process until eventually the recursive call stack is empty and the leaf nodes value has been
    //found
    static func kthGrammar(_ n: Int, _ k: Int) -> Int {
        guard n != 1 else { //base case
            return 0
        }
        
        // need to translate the current index into its parents index on the previous level
        let parent = kthGrammar((n - 1), ((k / 2) + (k % 2)))
        let isOdd = !k.isMultiple(of: 2) //remember 1-indexing
        
        if parent == 0 {
            return isOdd ? 0 : 1 //children of this parent are in the order: 0 1
        } else {
            return isOdd ? 1 : 0 //children of this parent are in the order: 1 0
        }
    }
    
    //Time: O(2^n) where n is the depth of the tree
    //Space: O(n) where n is the depth of the recursive stack
    //binary tree
    //recusive
    //
    //Solution Description:
    //Build the full tree - all levels fully populated. Once we reach the `n`th level, return the `k`th value.
    func kthGrammarAllValues(_ n: Int, _ k: Int) -> Int {
        guard n != 1 else {
            return 0
        }
        
        let row = buildRow(n, 1, [0])
        
        return row[(k - 1)]
    }
    
    private func buildRow(_ n: Int, _ curr: Int, _ previousRow: [Int]) -> [Int] {
        guard curr < n else {
            return previousRow
        }
        
        var row = [Int]()
        for n in previousRow {
            if n == 0 {
                row.append(0)
                row.append(1)
            } else {
                row.append(1)
                row.append(0)
            }
        }
        
        return buildRow(n, (curr + 1), row)
    }
}
