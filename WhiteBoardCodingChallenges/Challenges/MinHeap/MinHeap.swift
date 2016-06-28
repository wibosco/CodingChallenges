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
            
            minHeapify(&heap, indexRoot: lastParentIndex)
            lastParentIndex -= 1
        }
        
        return heap
    }
    
    // MARK: Heapify
    
    class func minHeapify(inout heap: [Int], indexRoot: Int) {
        
        if leftLeafIndex(indexRoot) > heapLastIndex(heap) {
            
            return
        }
        
        let rootValue  = heap[indexRoot]
        var smallestIndex = indexRoot
        var smallestValue = rootValue
        
        if heap.count > leftLeafIndex(indexRoot) {
            
            let leftLeafValue = heap[leftLeafIndex(indexRoot)]
            
            if smallestValue > leftLeafValue {
                
                smallestValue = leftLeafValue
                smallestIndex = leftLeafIndex(indexRoot)
            }
        }
        
        if rightLeafIndex(indexRoot) <= heapLastIndex(heap) {
            
            if heap.count > rightLeafIndex(indexRoot) {
                
                let rightLeafValue = heap[rightLeafIndex(indexRoot)]
                
                if smallestValue > rightLeafValue {
                    
                    smallestValue = rightLeafValue
                    smallestIndex = rightLeafIndex(indexRoot)
                }
                
            }
        }
        
        if smallestIndex != indexRoot {
            
            exchange(&heap, i: indexRoot, j: smallestIndex)
            minHeapify(&heap, indexRoot: smallestIndex)
        }
    }
    
    // MARK: Exchange
    
    class func exchange<T>(inout heap: [T], i:Int, j:Int) {
        
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
