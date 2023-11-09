//
//  HeapSort.swift
//  Algorithms
//
//  Created by William Boles on 22/05/2022.
//

import Foundation

struct HeapSort {
    
    //Time: O(n log n) where n is the number of elements in `nums`
    //Space: O(n)
    //sorting
    //heap sort
    //max heap
    //
    //Solution Description:
    //Using min-heap we are able sort `nums` using heap sort. First we fill the heap with the contents of `nums` and then
    //gradually the top element from the heap - each removal causes the heap to re-arrange itself and ensure that the next
    //smallest value in that heap is now at the top. As we empty to heap we fill the `sorted` array.
    static func sort(_ nums: [Int]) -> [Int] {
        var heap = Heap(elements: nums) { $0 < $1 }
        var sorted = [Int]()
        
        while !heap.isEmpty {
            guard let element = heap.remove() else {
                break
            }
            
            sorted.append(element)
        }
        
        return sorted
    }
}
