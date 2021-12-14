//
//  PrimsMST.swift
//  CodingChallenges
//
//  Created by William Boles on 28/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/primsmstsub
//MST
//Prim's Algorithm - https://en.wikipedia.org/wiki/Prim%27s_algorithm
class PrimsMST {

    // MARK: Distance
    
     static func totalWeight(sourceIndex: Int, totalNodes: Int, edges: [[Int]]) -> Int {
        let nodes = buildNodes(totalNodes: totalNodes)
        connectNodes(nodes: nodes, edges: edges)
        
        let source = nodes[sourceIndex]
        var countOfEdgesAddedToTotal = 0
        let totalEdgesInMST = (totalNodes - 1)
        var edgeHeap = PrimsMinHeap.buildMinHeap(input: Array(source.edges.values))
        var totalWeight = 0
        
        source.connected = true
        
        while totalEdgesInMST > countOfEdgesAddedToTotal {
            let minimumEdge = edgeHeap.removeFirst()
            
            let edgeDestination = minimumEdge.destination
            let edgeSource = minimumEdge.source
            
            if !(edgeDestination.connected && edgeSource.connected) {
                edgeDestination.connected = true
                edgeSource.connected = true
                
                totalWeight += minimumEdge.weight
                
                let destinationEdges = Array(minimumEdge.destination.edges.values)
                edgeHeap.append(contentsOf: destinationEdges)
                
                countOfEdgesAddedToTotal += 1
            }
            
            edgeHeap = PrimsMinHeap.buildMinHeap(input: edgeHeap)
        }
        
        return totalWeight
    }
    
    // MARK: Build
    
     static func buildNodes(totalNodes: Int) -> [PrimsMSTNode] {
        var nodes = [PrimsMSTNode]()
        for i in 0..<totalNodes {
            let node = PrimsMSTNode(value: i)
            nodes.append(node)
        }
        
        return nodes
    }
    
    // MARK: Connect
    
     static func connectNodes(nodes: [PrimsMSTNode], edges: [[Int]]) {
        for edge in edges {
            let source = nodes[edge[0]]
            let destination = nodes[edge[1]]
            let weight = edge[2]
            
            source.addEdge(destination: destination, weight: weight)
        }
    }
}

class PrimsMSTNode {
    var value: Int
    var connected = false
    var edges = [PrimsMSTNode: PrimsMSTEdge]()

    // MARK: Lifecycle
    
    init(value: Int) {
        self.value = value
    }
    
    // MARK: Edge
    
    func addEdge(destination: PrimsMSTNode, weight: Int) {
        let existingEdge = edges[destination]
        if let existingEdge = existingEdge {
            if existingEdge.weight > weight {
                edges[destination] = PrimsMSTEdge(source: self, destination: destination, weight: weight)
                destination.addEdge(destination: self, weight: weight)
            }
        } else {
            edges[destination] = PrimsMSTEdge(source: self, destination: destination, weight: weight)
            destination.addEdge(destination: self, weight: weight)
        }
    }
}

extension PrimsMSTNode: Equatable {
    static func == (lhs: PrimsMSTNode, rhs: PrimsMSTNode) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension PrimsMSTNode: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}


class PrimsMSTEdge {

    // MARK: Properties
    
    var source: PrimsMSTNode
    var destination: PrimsMSTNode
    var weight: Int
    
    // MARK: Lifecycle
    
    init(source: PrimsMSTNode, destination: PrimsMSTNode, weight: Int) {
        self.source = source
        self.destination = destination
        self.weight = weight
    }
}

extension PrimsMSTEdge: Equatable {
    static func == (lhs: PrimsMSTEdge, rhs: PrimsMSTEdge) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}

extension PrimsMSTEdge: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

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
        let temp: T = heap[i]
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

