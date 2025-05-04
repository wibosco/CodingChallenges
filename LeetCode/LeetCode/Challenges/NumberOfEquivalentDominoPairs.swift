// Created 04/05/2025.

import Foundation

//https://leetcode.com/problems/number-of-equivalent-domino-pairs/
struct NumberOfEquivalentDominoPairs {
    
    //Time: O(n + m log m) where n is the number of elements in `dominoes`
    //                     where m is the max number of elements in any given `dominoes` element
    //Space: O(n) where n is the number of elements in `dominoes`
    //array
    //sorting
    //counting
    //permutations
    //frequency
    //
    //Solution Description:
    //Iterating through each element in `dominoes`, we sort that elements array and check it if that sorted array as already been
    //seen. We then increment `matchingPairs` by the current `frequencies` value for the sorted array (the new match will be able
    //to be paired with each existing value so doubling the matching pairs for that sorted array). We then increment the
    //`frequencies` value for the sorted array and repeat the process for the next element in `dominoes`. Once all elements in
    //`dominoes` have been checked we return `matchingPairs`.
    func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
        var frequencies = [[Int]: Int]()
        var matchingPairs = 0
        
        for d in dominoes {
            let d = d.sorted { $0 < $1 }
            
            let frequency = frequencies[d] ?? 0
            matchingPairs += frequency
            frequencies[d] = (frequency + 1)
        }
        
        return matchingPairs
    }
}
