//
//  MinHeap.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 28/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class MinHeap: NSObject {

    // MARK: Construct
    
    class func buildMinHeap(input: [Int]) -> [Int] {
        
        if input.count < 2 {
            
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
    
    // MARK: Heapify
    
    class func minHeapify(heap: inout [Int], indexRoot: Int) {
        
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
            
            exchange(heap: &heap, i: indexRoot, j: smallestIndex)
            minHeapify(heap: &heap, indexRoot: smallestIndex)
        }
    }
    
    // MARK: Exchange
    
    class func exchange<T>(heap: inout [T], i:Int, j:Int) {
        
        let temp:T = heap[i]
        heap[i] = heap[j]
        heap[j] = temp
    }
    
    // MARK: Index
    
    class func leftLeafIndex(rootIndex: Int) -> Int {
        
        let heapIndex = (rootIndex + 1)
        
        return ((heapIndex * 2) - 1)
    }
    
    class func rightLeafIndex(rootIndex: Int) -> Int {
        
        let heapIndex = (rootIndex + 1)
        
        return (heapIndex * 2)
    }
    
    class func heapLastIndex(heap: [Int]) -> Int {
        
        return (heap.count - 1)
    }

}
