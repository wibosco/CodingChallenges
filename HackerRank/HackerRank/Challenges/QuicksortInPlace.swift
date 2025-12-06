// Created 19/05/2022.

import Foundation

//https://www.hackerrank.com/challenges/quicksort3
final class QuicksortInPlace {
    static func sortInPlace(array: inout [Int], leftIndex: Int, rightIndex: Int) {
        
        //if this isn't true then the array is sorted
        if leftIndex < rightIndex {
            let partitionIndex = partition(array: &array, leftIndex: leftIndex, rightIndex: rightIndex)
            
            print(array.map(String.init).joined(separator: " "))
            
            sortInPlace(array: &array, leftIndex: leftIndex, rightIndex: partitionIndex - 1)
            sortInPlace(array: &array, leftIndex: partitionIndex + 1, rightIndex: rightIndex)
        }
    }

    private static func partition(array: inout [Int], leftIndex: Int, rightIndex: Int) -> Int {
        let pivotValue = array[rightIndex]
        
        var partitionIndex = leftIndex
        
        for i in leftIndex..<rightIndex {
            if array[i] < pivotValue {
                array.swapAt(i, partitionIndex)
                partitionIndex += 1
            }
        }
        
        //Move pivot into position behind partition
        array.swapAt(partitionIndex, rightIndex)
        
        return partitionIndex
    }
}
