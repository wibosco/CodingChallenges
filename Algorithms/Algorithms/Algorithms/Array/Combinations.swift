// Created 01/09/2025.

import Foundation

struct Combinations {
    
    //Time: O(2^n) where n is the number of elements in `s`
    //Space: O(n)
    //DFS
    //recursive
    //backtracking
    //array
    //string
    //set
    //multi-source
    //n-ary tree
    //combination
    //subsequence
    //
    //Solution Description:
    //A combination is a non-contiguous slice of `arr` i.e. while order is preserved some elements can be skipped over.
    //Therefore to generate all combinations we need to iterate through `arr` from every possible position to every
    //possible other position - in a forwards direction. To this we iterate in a DFS manner using backtracking to selected
    //different "next" indexes from the current index. We do this until every possible start position has been fully
    //explored.
    //
    //Combinations of `[1,2,3]`
    //
    //      [1]
    //      [2]
    //      [3]
    //      [1,2]
    //      [1,3] //this is different from subarray
    //      [2,3]
    //      [1,2,3]
    //
    func generateCombinations(_ arr: [Int]) -> [[Int]] {
        var combination = [Int]()
        var combinations = [[Int]]()
        
        dfs(arr, 0, &combination, &combinations)
        
        return combinations
    }
    
    private func dfs(_ arr: [Int], _ i: Int, _ combination: inout [Int], _ combinations: inout [[Int]]) {
        guard i < arr.count else {
            return
        }
        
        for j in i..<arr.count {
            combination.append(arr[j])
            combinations.append(combination)
            
            dfs(arr, (j + 1), &combination, &combinations)
            
            combination.removeLast()
        }
    }
    
    // MARK: - Count
    
    //Time: O(1)
    //Space: O(1)
    //math
    //subsequence
    //
    //Solution Description:
    //Use a formula to work out the count.
    func countCombinations(_ arr: [Int]) -> Int {
        //2^arr.count
        return Int(pow(Double(2), Double(arr.count))) - 1 //-1 removes the empty combination
    }
}
