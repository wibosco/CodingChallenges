//
//  HeapSort.swift
//  CodingChallenges
//
//  Created by William Boles on 27/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class HeapSort {
    
    // MARK: - Max
    
    static func maxHeapSort(input: [Int]) -> [Int] {
        guard input.count > 1 else {
            return input
        }
        
        var maxHeap = MaxHeap.buildMaxHeap(input: input)
        var heapSorted = [Int]()
        
        while maxHeap.count > 1 {
            heapSorted.insert(maxHeap[0], at: 0)
            maxHeap.swapAt(0, (maxHeap.count - 1))
            maxHeap.removeLast()
            MaxHeap.maxHeapify(heap: &maxHeap, indexRoot: 0)
        }
        
        heapSorted.insert(maxHeap[0], at: 0)
        
        return heapSorted
    }
    
    // MARK: - Min
    
    static func minHeapSort(input: [Int]) -> [Int] {
        guard input.count > 1 else {
            return input
        }
        
        var minHeap = MinHeap.buildMinHeap(input: input)
        var heapSorted = [Int]()
        
        while minHeap.count > 1 {
            
            heapSorted.insert(minHeap[0], at: 0)
            minHeap.swapAt(0, (minHeap.count - 1))
            minHeap.removeLast()
            MinHeap.minHeapify(heap: &minHeap, indexRoot: 0)
        }
        
        heapSorted.insert(minHeap[0], at: 0)
        
        return heapSorted
    }
}
