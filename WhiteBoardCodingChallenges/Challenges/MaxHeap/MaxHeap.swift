//
//  MinHeap.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 27/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class MaxHeap: NSObject {
    
    // MARK: Construct
    
    class func buildMaxHeap(input: [Int]) -> [Int] {
        
        if input.count < 2 {
            
            return input
        }
        
        var lastParentIndex = input.count / 2
        var heap = input
        
        while lastParentIndex >= 0 {
            
            maxHeapify(&heap, indexRoot: lastParentIndex)
            lastParentIndex -= 1
        }
        
        return heap
    }
    
    // MARK: Heapify
    
    class func maxHeapify(inout heap: [Int], indexRoot: Int) {
        
        if leftLeafIndex(indexRoot) > heapLastIndex(heap) {
            
            return
        }
        
        let rootValue  = heap[indexRoot]
        var largestIndex = indexRoot
        var largestValue = rootValue
        
        if heap.count > leftLeafIndex(indexRoot) {
            
            let leftLeafValue = heap[leftLeafIndex(indexRoot)]
            
            if leftLeafValue > largestValue {
                
                largestValue = leftLeafValue
                largestIndex = leftLeafIndex(indexRoot)
            }
        }
        
        if rightLeafIndex(indexRoot) <= heapLastIndex(heap) {
            
            if heap.count > rightLeafIndex(indexRoot) {
                
                let rightLeafValue = heap[rightLeafIndex(indexRoot)]
                
                if rightLeafValue > largestValue {
                    
                    largestValue = rightLeafValue
                    largestIndex = rightLeafIndex(indexRoot)
                }

            }
        }
        
        if largestIndex != indexRoot {
            
            exchange(&heap, i: indexRoot, j: largestIndex)
            maxHeapify(&heap, indexRoot: largestIndex)
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
