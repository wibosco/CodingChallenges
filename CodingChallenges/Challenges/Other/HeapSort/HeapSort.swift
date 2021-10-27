//
//  HeapSort.swift
//  CodingChallenges
//
//  Created by William Boles on 27/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class HeapSort {

    // MARK: Max
    
     static func maxHeapSort(input: [Int]) -> [Int] {
        
        if input.count < 2 {
            
            return input
        }
        
        var maxHeap = MaxHeap.buildMaxHeap(input: input)
        var heapSorted = [Int]()
        
        while maxHeap.count > 1 {
            
            heapSorted.insert(maxHeap[0], at: 0)
            exchange(heap: &maxHeap, i: 0, j: (maxHeap.count - 1))
            maxHeap.removeLast()
            MaxHeap.maxHeapify(heap: &maxHeap, indexRoot: 0)
        }
        
        heapSorted.insert(maxHeap[0], at: 0)
        
        return heapSorted
    }
    
    // MARK: Min
    
     static func minHeapSort(input: [Int]) -> [Int] {
        
        if input.count < 2 {
            
            return input
        }
        
        var minHeap = MinHeap.buildMinHeap(input: input)
        var heapSorted = [Int]()
        
        while minHeap.count > 1 {
            
            heapSorted.insert(minHeap[0], at: 0)
            exchange(heap: &minHeap, i: 0, j: (minHeap.count - 1))
            minHeap.removeLast()
            MinHeap.minHeapify(heap: &minHeap, indexRoot: 0)
        }
        
        heapSorted.insert(minHeap[0], at: 0)
        
        return heapSorted
    }
    
    // MARK: Exchange
    
     static func exchange<T>(heap: inout [T], i:Int, j:Int) {
        
        let temp:T = heap[i]
        heap[i] = heap[j]
        heap[j] = temp
    }
}
