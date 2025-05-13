// Created 13/05/2025.

import Foundation

//https://leetcode.com/problems/beautiful-towers-i/
struct BeautifulTowersI {
    
    //Time: O(n ^ 2) where n is the number of elements in `heights`
    //Space: O(1)
    //array
    //counting
    //nested loops
    //
    //Solution Description:
    //We iterate through all elements in `heights` and treat each one as the peak. We then iterate left and right of that peak
    //and keeping track of that minimum height for that iteration calculate any reductions that would need to be made, after
    //each reduction we add it to `sum`. Once all elements have been processed we compare the current sum against the largest
    //seen so far and replace `maxSum` if required. Once all elements have treated as peak we return `maxSum`.
    func maximumSumOfHeights(_ heights: [Int]) -> Int {
        var maxSum = 0
        
        for i in 0..<heights.count {
            var sum = heights[i]
            var minHeight = heights[i]
            
            for j in (0..<i).reversed() {
                minHeight = min(minHeight, heights[j] )
                sum += minHeight
            }
            
            minHeight = heights[i]
            
            for j in (i + 1)..<heights.count {
                minHeight = min(minHeight, heights[j] )
                sum += minHeight
            }
            
            maxSum = max(maxSum, sum)
        }
        
        return maxSum
    }
}
