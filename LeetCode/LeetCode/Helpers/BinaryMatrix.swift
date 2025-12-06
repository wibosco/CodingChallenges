// Created 15/04/2022.

import Foundation

final class BinaryMatrix {
    let matrix: [[Int]]
    
    init(_ matrix: [[Int]]) {
        self.matrix = matrix
    }
    
    func get(_ row: Int, _ col: Int) -> Int {
        return matrix[row][col]
    }
    
    func dimensions() -> [Int] {
        let rows = matrix.count
        let columns = matrix[0].count
        
        return [rows, columns]
    }
}
