// Created 12/09/2024.

import Foundation

//https://leetcode.com/problems/k-th-smallest-prime-fraction/
struct KthSmallestPrimeFraction {
    
    //Time: O(n ^ 2 + n) where n is the number of elements in `arr`
    //Space: O(n)
    //array
    //two pointers
    //nested loops
    //quickselect
    //in-line
    //
    //Solution Description:
    //We iterate all possible permutations of `arr` and calculate the fraction for number pair. Then using `quick select` we
    //sort `fractions` around a pivot by gradually partitioning `fractions` into smaller semi-sorted arrays. We do not need to
    //fully sort `fractions`, instead we only need to sort up to the `kth` index so after each partitioning we check if the
    //elements up to the `kth` index as been sorted if so we can return `points[0..<k]` else we take one half of the
    //semi-sorted array and partition it further.
    //
    //N.B. Here we are using Lomutos partitioning scheme, see:
    //https://github.com/raywenderlich/swift-algorithm-club/tree/master/Quicksort#lomutos-partitioning-scheme
    func kthSmallestPrimeFraction(_ arr: [Int], _ k: Int) -> [Int] {
        var fractions = [(Double, Int, Int)]()
        
        var p1 = 0
        
        while p1 < arr.count {
            var p2 = arr.count - 1
            
            while p1 < p2 {
                let fraction = Double(arr[p1]) / Double(arr[p2])
                
                fractions.append((fraction, arr[p1], arr[p2]))
                
                p2 -= 1
            }
            
            p1 += 1
        }
        
        let k = k - 1 //kth element is at index k - 1
        
        quickSelect(&fractions, 0, (fractions.count - 1), k)
        
        return [fractions[k].1, fractions[k].2]
    }
    
    private func quickSelect(_ fractions: inout [(Double, Int, Int)], _ left: Int, _ right: Int, _ k: Int) {
        guard left < right else { //needed to ensure that we don't go out of bounds
            return
        }
        
        let partitionIndex = partition(&fractions, left, right)
        
        if partitionIndex == k {
            return
        } else if k < partitionIndex {
            quickSelect(&fractions, left, (partitionIndex - 1), k)
        } else {
            quickSelect(&fractions, (partitionIndex + 1), right, k)
        }
    }
    
    private func partition(_ fractions: inout [(Double, Int, Int)], _ left: Int, _ right: Int) -> Int {
        let pivot = fractions[right].0 //note that the pivot is set using the right pointer
        
        var i = left // `i` will track the start of the section that is > pivot
        for j in left..<right { //note how this is left to (right - 1) as the pivot is right
            
            //moving the elements that are less than the pivot to the left of where the pivot will eventually end up
            if fractions[j].0 <= pivot { //non-descending ordering
                fractions.swapAt(i, j)
                i += 1 //incrementing the boundary for elements that are less than or equal to the pivot
            }
        }
        
        //moving the pivot into its final location with all elements less than or equal to it to the left and all elements
        //greater than it to the right
        fractions.swapAt(i, right)
        
        return i
    }
    
    //Time: O(n ^ 2 + n log n) where n is the number of elements in `arr`
    //Space: O(n)
    //array
    //two pointers
    //nested loops
    //sorting
    //
    //Solution Description:
    //We iterate all possible permutations of `arr` and calculate the fraction for number pair. We then sort those fractions and
    //return the "kth" pair.
    func kthSmallestPrimeFractionAllPermutations(_ arr: [Int], _ k: Int) -> [Int] {
        var fractions = [(Double, Int, Int)]()
        
        var p1 = 0
        
        while p1 < arr.count {
            var p2 = arr.count - 1
            
            while p1 < p2 {
                let fraction = Double(arr[p1]) / Double(arr[p2])
                
                fractions.append((fraction, arr[p1], arr[p2]))
                
                p2 -= 1
            }
            
            p1 += 1
        }
        
        fractions.sort { $0.0 < $1.0 }
        
        let kthSmallest = fractions[(k - 1)]
        
        return [kthSmallest.1, kthSmallest.2]
    }
}
