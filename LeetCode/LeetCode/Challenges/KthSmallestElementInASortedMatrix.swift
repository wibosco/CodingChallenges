// Created 05/08/2025.

import Foundation

//https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/
struct KthSmallestElementInASortedMatrix {
    
    //Time: O(n^2) where n is the number of elements in `matrix`
    //Space: O(n^2)
    //array
    //matrix
    //nested loops
    //
    //Solution Description:
    //
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        var values = [Int]()

        for row in 0..<matrix.count {
            for column in 0..<matrix[row].count {
                let val = matrix[row][column]

                if values.count == k {
                    if values.last! > val {
                        values.removeLast()
                        values.append(val)
                    }
                } else {
                    values.append(val)
                }

                values.sort(by: <)
            }
        }

        return values.last!
    }
}
