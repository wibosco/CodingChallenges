//
//  UnionFind.swift
//  Algorithms
//
//  Created by William Boles on 10/06/2022.
//

import Foundation

//Union-by-rank/disjoint set
//See: https://www.youtube.com/watch?v=wU6udHRIkcc
//
//Can only be applied on undirected graphs
//
//Solution Description:
//1. Each vertice is given an initial value of -1 to indicate that they are their own root
//2. Perform a union between two vertices by finding the root of each vertice (this will be a negative number). This root may not
//   be directly associated with the vertice but instead require multiple steps hence the while loop in `find`
//3. Compare the size of the nodes associated with each vertices root and select the root with the most nodes i.e. lowest negative
//   value. Update the smaller root to point at the other root and update the other roots count to include the count that the
//   former root had
final class UnionFind {
    private(set) var ranks: [Int]
    
    // MARK: - Init
    
    init(count: Int) {
        ranks = Array(repeating: -1, count: count)
    }
    
    // MARK: - Operations
    
    func find(_ x: Int) -> Int { //O(1)
        guard ranks[x] >= 0 else { // 0 is valid as an array index
            return x
        }
        ranks[x] = find(ranks[x]) //update ranks[x] to point nearer to the root of this set so speeding up finding
        return ranks[x]
    }
    
    @discardableResult
    func union(_ x: Int, _ y: Int) -> Bool { //O(1)
        let xRoot = find(x)
        let yRoot = find(y)
        
        guard xRoot != yRoot else {
            //x and y are already in the same set, so performing this union will result in introducing a cycle into this graph.
            return false
        }
        
        //join the smaller graph with larger. If both are the same
        //size then favour `x`
        //careful with the comparison here as the larger root has a smaller value (due to
        //being negative)
        if ranks[xRoot] <= ranks[yRoot] {
            let tmp = ranks[yRoot]
            ranks[yRoot] = xRoot
            ranks[xRoot] += tmp //increasing the value as this index, increases the rank of that root
        } else {
            let tmp = ranks[xRoot]
            ranks[xRoot] = yRoot
            ranks[yRoot] += tmp //increasing the value as this index, increases the rank of that root
        }
        
        return true
    }
    
    func connected(_ x: Int, _ y: Int) -> Bool {
        return find(x) == find(y)
    }
}
