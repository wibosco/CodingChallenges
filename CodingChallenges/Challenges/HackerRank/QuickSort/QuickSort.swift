//
//  QuickSort.swift
//  CodingChallenges
//
//  Created by William Boles on 16/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class QuickSort: NSObject {

    // MARK: QuickSort
    
    //https://www.hackerrank.com/challenges/quicksort1
    class func sortIntoGroups(array: [Int], indexOfPivot: Int) -> [Int] {
        
        var left = [Int]()
        var right = [Int]()
        
        let pivot = array[indexOfPivot]
        
        for value in array {
            
            if pivot > value {
                
                left.append(value)
            }
            else {
                
                right.append(value)
            }
        }
        
        return left + right
    }
    
    class func sort(array: [Int]) -> [Int] {
        
        if array.count == 0 {
            
            return [Int]()
        }
        
        var left = [Int]()
        var right = [Int]()
        
        let pivot = array[0]
        
        for index in 1..<array.count {
            
            let value = array[index]
            
            if pivot > value {
                
                left.append(value)
            }
            else {
                
                right.append(value)
            }
        }
        
        return sort(array: left) + [pivot] + sort(array: right)
    }
    
    class func sortAlt(array: [Int]) -> [Int] {
        
        if array.count == 0 {
            
            return [Int]()
        }
        
        let pivot = array[0]
        
        let strippedArray = array[1..<array.count]
        
        let left = strippedArray.filter {$0 <= pivot}
        let right = strippedArray.filter{$0 > pivot}
        
        return sort(array: left) + [pivot] + sort(array: right)
    }
    
    // MARK: InPlace
    
    //https://www.hackerrank.com/challenges/quicksort3
    class func sortInPlace(array: inout [Int], leftIndex: Int, rightIndex: Int) {
        
        //if this isn't true then the array is sorted
        if leftIndex < rightIndex {
            
            let partionIndex = partion(array: &array, leftIndex: leftIndex, rightIndex: rightIndex)
            
            print(array.map(String.init).joined(separator: " "))
            
            QuickSort.sortInPlace(array: &array, leftIndex: leftIndex, rightIndex: partionIndex - 1)
            QuickSort.sortInPlace(array: &array, leftIndex: partionIndex + 1, rightIndex: rightIndex)
        }
    }
    
    //swap elements so that they are on the correct side of the partion, we don't care about the ordering anymore than that here
    class func swap(array: inout [Int], aIndex: Int, bIndex: Int) {
        
        let temp = array[aIndex]
        
        array[aIndex] = array[bIndex]
        array[bIndex] = temp
        
    }
    
    class func partion(array: inout [Int], leftIndex: Int, rightIndex: Int) -> Int {
        
        let pivotValue = array[rightIndex]
        
        var partionIndex = leftIndex
        
        for i in leftIndex..<rightIndex {
            
            if array[i] < pivotValue {
                
//                print("Before swap array is now: \(array[leftIndex..<rightIndex])")
//                print("about to swap value index: \(i) with partion index: \(partionIndex)")
                
                QuickSort.swap(array: &array, aIndex: i, bIndex: partionIndex)
                
//                print("After swap array is now: \(array[leftIndex..<rightIndex])")
//                print("")
                
                partionIndex += 1
            }
        }
        
        //Move pivot into positon behind partion
        QuickSort.swap(array: &array, aIndex: partionIndex, bIndex: rightIndex)
        
        return partionIndex
    }
}
