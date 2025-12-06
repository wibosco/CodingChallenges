// Created 24/02/2024.

import Foundation

//https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/
struct CountNegativeNumbersInASortedMatrix {
    
    //Time: O(n log m) where n is the number of rows in `grid`
    //                 where m is the number of columns in `grid`
    //Space: O(1)
    //array
    //matrix
    //binary search find leftmost
    //
    //Solution Description:
    //As we know the rows are sorted, we can use binary search to find the index whihch is start of the elements that are less
    //than 0. With this index we can then calculate how many elements in that row are less than 0 and update `count` with that
    //value.
    func countNegatives(_ grid: [[Int]]) -> Int {
        var count = 0
        
        for row in grid {
            let index = binarySearch(row, 0)
            
            count += row.count - index
        }
        
        return count
    }
    
    private func binarySearch(_ values: [Int], _ target: Int) -> Int {
        var left = 0
        var right = values.count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid] < target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
}
