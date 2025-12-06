// Created 29/10/2021.

import Foundation

//https://www.hackerrank.com/challenges/magic-square-forming/problem
struct MagicSquare {
    static func formingMagicSquare(s: [[Int]]) -> Int {
        let allPossible3x3MagicSquares = [[[8, 1, 6], [3, 5, 7], [4, 9, 2]],
                                          [[6, 1, 8], [7, 5, 3], [2, 9, 4]],
                                          [[4, 9, 2], [3, 5, 7], [8, 1, 6]],
                                          [[2, 9, 4], [7, 5, 3], [6, 1, 8]],
                                          [[8, 3, 4], [1, 5, 9], [6, 7, 2]],
                                          [[4, 3, 8], [9, 5, 1], [2, 7, 6]],
                                          [[6, 7, 2], [1, 5, 9], [8, 3, 4]],
                                          [[2, 7, 6], [9, 5, 1], [4, 3, 8]]]

        var minDelta = Int.max
        for magicSquare in allPossible3x3MagicSquares {
            var currentDelta = 0
            for rowIndex in 0..<3 {
                for valueIndex in 0..<3 {
                    currentDelta += abs(s[rowIndex][valueIndex] - magicSquare[rowIndex][valueIndex])
                }
            }
            minDelta = min(minDelta, currentDelta)
        }

        return minDelta
    }
}
