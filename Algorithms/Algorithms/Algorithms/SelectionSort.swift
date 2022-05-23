//
//  SelectionSort.swift
//  Algorithms
//
//  Created by William Boles on 22/05/2022.
//

import Foundation

struct SelectionSort {
    
    //Time: O(n^2) where n is the number of elements in `nums`
    //Space: O(1)
    //sorting
    //selection sort
    //
    //Solution Description:
    //Using selection sort, we find the smallest element in `nums` and replace the current element at 0 with that smallest
    //element. Next find the second smallest element in `nums` and replace the current element at 1 with that second smallest
    //element. This process is repeated until all elements are sorted.
    static func sort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        var nums = nums
        
        for sortingIndex in 0..<nums.count {
            var smallestIndex = sortingIndex
            
            for currentIndex in (sortingIndex + 1)..<nums.count {
                if nums[currentIndex] < nums[smallestIndex] { //ascending order
                    smallestIndex = currentIndex
                }
            }
            
            nums.swapAt(sortingIndex, smallestIndex)
        }
        
        return nums
    }
}
