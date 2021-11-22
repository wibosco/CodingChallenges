//
//  MinHeap.swift
//  CodingChallenges
//
//  Created by William Boles on 27/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

struct MaxHeap {
    
    // MARK: - Construct
    
    static func buildMaxHeap(input: [Int]) -> [Int] {
        guard input.count > 1 else {
            return input
        }
        
        var lastParentIndex = input.count / 2
        var heap = input
        
        while lastParentIndex >= 0 {
            maxHeapify(heap: &heap, indexRoot: lastParentIndex)
            lastParentIndex -= 1
        }
        
        return heap
    }
    
    // MARK: - Heapify
    
    static func maxHeapify(heap: inout [Int], indexRoot: Int) {
        if leftLeafIndex(rootIndex: indexRoot) > heapLastIndex(heap: heap) {
            return
        }
        
        let rootValue  = heap[indexRoot]
        var largestIndex = indexRoot
        var largestValue = rootValue
        
        if heap.count > leftLeafIndex(rootIndex: indexRoot) {
            let leftLeafValue = heap[leftLeafIndex(rootIndex: indexRoot)]
            
            if leftLeafValue > largestValue {
                largestValue = leftLeafValue
                largestIndex = leftLeafIndex(rootIndex: indexRoot)
            }
        }
        
        if rightLeafIndex(rootIndex: indexRoot) <= heapLastIndex(heap: heap) {
            if heap.count > rightLeafIndex(rootIndex: indexRoot) {
                let rightLeafValue = heap[rightLeafIndex(rootIndex: indexRoot)]
                
                if rightLeafValue > largestValue {
                    largestValue = rightLeafValue
                    largestIndex = rightLeafIndex(rootIndex: indexRoot)
                }
            }
        }
        
        if largestIndex != indexRoot {
            heap.swapAt(indexRoot, largestIndex)
            maxHeapify(heap: &heap, indexRoot: largestIndex)
        }
    }
    
    // MARK: - Index
    
    static func leftLeafIndex(rootIndex: Int) -> Int {
        let heapIndex = (rootIndex + 1)
        
        return ((heapIndex * 2) - 1)
    }
    
    static func rightLeafIndex(rootIndex: Int) -> Int {
        let heapIndex = (rootIndex + 1)
        
        return (heapIndex * 2)
    }
    
    static func heapLastIndex(heap: [Int]) -> Int {
        return (heap.count - 1)
    }
}
