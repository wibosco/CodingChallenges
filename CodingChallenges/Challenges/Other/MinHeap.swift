//
//  MinHeap.swift
//  CodingChallenges
//
//  Created by William Boles on 28/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

struct MinHeap {
    
    // MARK: - Construct
    
    static func buildMinHeap(input: [Int]) -> [Int] {
        guard input.count > 1 else {
            return input
        }
        
        var lastParentIndex = input.count / 2
        var heap = input
        
        while lastParentIndex >= 0 {
            minHeapify(heap: &heap, indexRoot: lastParentIndex)
            lastParentIndex -= 1
        }
        
        return heap
    }
    
    // MARK: - Heapify
    
    static func minHeapify(heap: inout [Int], indexRoot: Int) {
        if leftLeafIndex(rootIndex: indexRoot) > heapLastIndex(heap: heap) {
            return
        }
        
        let rootValue  = heap[indexRoot]
        var smallestIndex = indexRoot
        var smallestValue = rootValue
        
        if heap.count > leftLeafIndex(rootIndex: indexRoot) {
            let leftLeafValue = heap[leftLeafIndex(rootIndex: indexRoot)]
            
            if smallestValue > leftLeafValue {
                smallestValue = leftLeafValue
                smallestIndex = leftLeafIndex(rootIndex: indexRoot)
            }
        }
        
        if rightLeafIndex(rootIndex: indexRoot) <= heapLastIndex(heap: heap) {
            if heap.count > rightLeafIndex(rootIndex: indexRoot) {
                
                let rightLeafValue = heap[rightLeafIndex(rootIndex: indexRoot)]
                
                if smallestValue > rightLeafValue {
                    smallestValue = rightLeafValue
                    smallestIndex = rightLeafIndex(rootIndex: indexRoot)
                }
                
            }
        }
        
        if smallestIndex != indexRoot {
            heap.swapAt(indexRoot, smallestIndex)
            minHeapify(heap: &heap, indexRoot: smallestIndex)
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
