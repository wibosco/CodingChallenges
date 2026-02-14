// Created 06/08/2025.

import Foundation

//https://leetcode.com/problems/diagonal-traverse-ii/
struct DiagonalTraverseII {
    
    //Time: O(n * m) where n is the number of rows in `nums`
    //               where m is the number of columns in `nums`
    //Space: O(n)
    //array
    //matrix
    //dictionary
    //maths
    //
    //Solution Description:
    //Cells that are on the same diagonal have the same value when you sum their row and column values. We can use this property
    //to group the cells that we encounter in one pass. Once all cells are grouped we then iterate through each group, starting
    //0 and add each diagonal array to `order`. We can then return `order`.
    func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
        var diagonals = [Int: [Int]]()
        var maxKey = 0

        //this is reversed so ensure that we when values are added to the group they are added in the right order
        for r in (0..<nums.count).reversed() {
            for c in 0..<nums[r].count {
                let key = r + c
                diagonals[key, default: [Int]()].append(nums[r][c])

                maxKey = max(maxKey, key)
            }
        }

        var order = [Int]()
        for i in 0...maxKey {
            guard let diagonal = diagonals[i] else {
                continue
            }

            order += diagonal
        }

        return order
    }
    
    //Time: O(n * m) where n is the number of rows in `nums`
    //               where m is the number of columns in `nums`
    //Space: O(n)
    //array
    //matrix
    //nested loops
    //multi-pass
    //
    //Solution Description:
    //The starting cell for every matrix is either the first column or the bottom row, making an `L` shape. Some rows don't have
    //all there columns, so first we determine which row has the maximum columns so that we can traverse through the full search
    //space even if that cell doesn't exist. First we find all diagonals starting from the first column and storing each cell we
    //encounter in `order`. With each diagonal we gradually move upwards and rightwards until we run out of rows or columns.
    //Next we perform the same movement but this time starting with the cells on the bottom row. Once all diagonals have been
    //traversed we return `orders`
    func findDiagonalOrder2(_ nums: [[Int]]) -> [Int] {
        let rows = nums.count
        var columns = 0
        for r in 0..<rows {
            columns = max(columns, nums[r].count)
        }

        var order = [Int]()

        for row in 0..<rows {
            var r = row
            var c = 0

            while r >= 0, c < columns {
                if c < nums[r].count {
                    order.append(nums[r][c])
                }
            
                r -= 1
                c += 1
            }
        }

        for column in 1..<columns { // column 0 diagonal was filled in the above loop
            var r = rows - 1
            var c = column

            while r >= 0, c < columns {
                if c  < nums[r].count {
                    order.append(nums[r][c])
                }

                r -= 1
                c += 1
            }
        }

        return order
    }
}
