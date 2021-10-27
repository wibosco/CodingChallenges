//
//  PrimsMST.swift
//  CodingChallenges
//
//  Created by William Boles on 28/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/primsmstsub
class PrimsMST: NSObject {

    // MARK: Distance
    
    class func totalWeight(sourceIndex: Int, totalNodes: Int, edges: [[Int]]) -> Int {
        
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
    
    class func buildNodes(totalNodes: Int) -> [PrimsMSTNode] {
        
        var nodes = [PrimsMSTNode]()
        
        for i in 0..<totalNodes {
            
            let node = PrimsMSTNode.init(value: i)
            nodes.append(node)
        }
        
        return nodes
    }
    
    // MARK: Connect
    
    class func connectNodes(nodes: [PrimsMSTNode], edges: [[Int]]) {
    
        for edge in edges {
            
            let source = nodes[edge[0]]
            let destination = nodes[edge[1]]
            let weight = edge[2]
            
            source.addEdge(destination: destination, weight: weight)
        }
    }
}
