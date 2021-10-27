//
//  PrimsMinHeap.swift
//  CodingChallenges
//
//  Created by William Boles on 28/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

class PrimsMinHeap {

    // MARK: Construct
    
     static func buildMinHeap(input: [PrimsMSTEdge]) -> [PrimsMSTEdge] {
        
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
    
     static func minHeapify(heap: inout [PrimsMSTEdge], indexRoot: Int) {
        
        if leftLeafIndex(rootIndex: indexRoot) > heapLastIndex(heap: heap) {
            
            return
        }
        
        let rootNode = heap[indexRoot]
        var smallestIndex = indexRoot
        var smallestNode = rootNode
        
        if heap.count > leftLeafIndex(rootIndex: indexRoot) {
            
            let leftLeafNode = heap[leftLeafIndex(rootIndex: indexRoot)]
            
            if smallestNode.weight > leftLeafNode.weight {
                
                smallestNode = leftLeafNode
                smallestIndex = leftLeafIndex(rootIndex: indexRoot)
            }
        }
        
        if rightLeafIndex(rootIndex: indexRoot) <= heapLastIndex(heap: heap) {
            
            if heap.count > rightLeafIndex(rootIndex: indexRoot) {
                
                let rightLeafNode = heap[rightLeafIndex(rootIndex: indexRoot)]
                
                if smallestNode.weight > rightLeafNode.weight {
                    
                    smallestNode = rightLeafNode
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
    
     static func exchange<T>(heap: inout [T], i:Int, j:Int) {
        
        let temp:T = heap[i]
        heap[i] = heap[j]
        heap[j] = temp
    }
    
    // MARK: Index
    
     static func leftLeafIndex(rootIndex: Int) -> Int {
        
        let heapIndex = (rootIndex + 1)
        
        return ((heapIndex * 2) - 1)
    }
    
     static func rightLeafIndex(rootIndex: Int) -> Int {
        
        let heapIndex = (rootIndex + 1)
        
        return (heapIndex * 2)
    }
    
     static func heapLastIndex(heap: [PrimsMSTEdge]) -> Int {
        
        return (heap.count - 1)
    }
}
