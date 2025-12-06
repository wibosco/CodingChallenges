// Created 22/05/2022.

import Foundation

struct CountingSort {
    
    //Time: O(n + k) where n is the number of elements in `nums`, k is the unique elements in `nums`
    //Space: O(k)
    //sorting
    //counting sort
    //dictionary
    //
    //Solution Description:
    //Using counting sort we iterate through all elements in `nums` and store how often they appear in the dictionary `countMap`
    //i.e. the element is keys and the frequency is the value. We also keep track of the lowest and highest element that we
    //seen to allow for performant retrieve of those frequency values. After counting all frequencies we then iterate from `low`
    //to `high` and check if that value has an entry in the dictionary. If it does have an entry then we add the value of the
    //current iteration `i` to the `sorted` array `count` times; if it doesn't we skip it. As we are going from low to high we
    //will be adding those values in non-descending order.
    static func sort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        var low = Int.max //allow for easier retrieval of values in `countMap` without further sorting
        var high = Int.min
        
        var countMap = [Int: Int]() //element: frequency
        
        for num in nums {
            countMap[num, default: 0] += 1
            
            if num < low {
                low = num
            }
            
            if num > high {
                high = num
            }
        }
        
        var sorted = [Int]()
        for i in low...high { //non-descending order
            if let count = countMap[i] {
                sorted.append(contentsOf: Array(repeating: i, count: count))
            }
        }
        
        return sorted
    }
}
