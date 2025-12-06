// Created 21/03/2022.

import Foundation

//https://leetcode.com/problems/subsets-ii/
struct SubsetsII {
    
    //Time: O(2^n * n log n) where n is the number of nodes in `nums`
    //Space: O(k + m * m) where k is the number of subsets
    //                    where m is the number of levels in our tree
    //                    where n current subset
    //array
    //backtracking
    //recursive
    //DFS
    //graph theory
    //n-ary tree
    //inout
    //
    //Solution Description:
    //To generate every possible subset we need to be always moving "forward" with `nums` and adding each array that we
    //build to `subsets` (note that unlike combinations or permutations we don't wait to reach "x" before adding the
    //current to `subset`, we add any length of `current` to subsets). We first sort `nums` so that all duplicate values
    //are beside each other - this will us to efficiently compare elements in `nums` to find duplicates. We use
    //backtracking to ensure that all possible combinations are generated and to ensure we are always moving forward we
    //track the starting index of the previous iteration and ensure that we only use elements to the right of that index.
    //To avoid having duplicate `subset` arrays but still using all elements, each iteration we check if the current
    //element is the same as the previous element and if so we skip searching down that branch as this combination will
    //still generated through the DFS call on another branch.
    //
    //Similar to: https://leetcode.com/problems/combination-sum-ii/
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var subsets = [[Int]]()
        
        backtrack(nums.sorted(), 0, [Int](), &subsets)
        
        return subsets
    }
    
    private func backtrack(_ nums: [Int], _ left: Int, _ current: [Int], _ subsets: inout [[Int]]) {
        subsets.append(current)
        
        guard left < nums.count else {
            return
        }
        
        for i in left..<nums.count {
            let num = nums[i]
            
            if i != left && nums[i] == nums[i - 1] {
                //skip duplicates of the same number here
                //we will catch them on through the next DFS call i.e. the next startingIndex will be the duplicate index
                //(hence the first condition of `i > startingIndex`) so for [2, 2, 2, 5] curr will eventually be `[2, 2, 2]`
                //through the DFS call so no need to build that here as well
                continue
            }
            
            backtrack(nums, (i + 1), (current + [num]), &subsets)
        }
    }
}
