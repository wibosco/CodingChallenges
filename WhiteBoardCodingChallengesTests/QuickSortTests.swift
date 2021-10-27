//
//  QuickSortTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 16/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import WhiteBoardCodingChallenges

class QuickSortTests: XCTestCase {
    
    // MARK: PartialSort
    
    func test_quickSortPartialA() {
        
        let sortedArray = QuickSort.sortIntoGroups(array: [4, 5, 3, 7, 2], indexOfPivot: 0)
        
        XCTAssertEqual([3, 2, 4, 5, 7], sortedArray)
    }
    
    // MARK: FullSort
    
    func test_quickSortFullA() {
        
        let sortedArray = QuickSort.sort(array: [5, 8, 1, 3, 7, 9, 2])
        
        XCTAssertEqual([1, 2, 3, 5, 7, 8, 9], sortedArray)
    }
    
    func test_quickSortFullB() {
        
        let sortedArray = QuickSort.sort(array: [5, 8, 1, 3, 7, 9, 2, 12, 14, 15, 16, 22, 23, 25, 4, 10, 6])
        
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14, 15, 16, 22, 23, 25], sortedArray)
    }

    func test_quickSortFullC() {
        
        let sortedArray = QuickSort.sort(array: [5, 8, 1, 3, 7, 5, 9, 2, 9])
        
        XCTAssertEqual([1, 2, 3, 5, 5, 7, 8, 9, 9], sortedArray)
    }
    
    // MARK: Alt
    
    func test_quickSortFullAltA() {
        
        let sortedArray = QuickSort.sortAlt(array: [5, 8, 1, 3, 7, 9, 2])
        
        XCTAssertEqual([1, 2, 3, 5, 7, 8, 9], sortedArray)
    }
    
    func test_quickSortFullAltB() {
        
        let sortedArray = QuickSort.sortAlt(array: [5, 8, 1, 3, 7, 9, 2, 12, 14, 15, 16, 22, 23, 25, 4, 10, 6])
        
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14, 15, 16, 22, 23, 25], sortedArray)
    }
    
    func test_quickSortFullAltC() {
        
        let sortedArray = QuickSort.sortAlt(array: [5, 8, 1, 3, 7, 5, 9, 2, 4, 3])
        
        XCTAssertEqual([1, 2, 3, 3, 4, 5, 5, 7, 8, 9], sortedArray)
    }
    
    // MARK: InPlace
    
    func test_quickSortFullInPlaceA() {
        
        var array = [5, 8, 1, 3, 7, 9, 2]
        
        QuickSort.sortInPlace(array: &array, leftIndex: 0, rightIndex: (array.count - 1))
        
        XCTAssertEqual([1, 2, 3, 5, 7, 8, 9], array)
    }
    
    func test_quickSortFullInPlaceB() {
        
        var array = [5, 8, 1, 3, 7, 9, 2, 12, 14, 15, 16, 22, 23, 25, 4, 10, 6]
        
        QuickSort.sortInPlace(array: &array, leftIndex: 0, rightIndex: (array.count - 1))
        
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14, 15, 16, 22, 23, 25], array)
    }
    
    func test_quickSortFullInPlaceC() {
        
        var array = [5, 8, 1, 3, 7, 5, 9, 2, 3, 4]
        
        QuickSort.sortInPlace(array: &array, leftIndex: 0, rightIndex: (array.count - 1))
        
        XCTAssertEqual([1, 2, 3, 3, 4, 5, 5, 7, 8, 9], array)
    }
    
    func test_quickSortFullInPlaceD() {
        
        var array = [1, 3, 9, 8, 2, 7, 5]
        
        QuickSort.sortInPlace(array: &array, leftIndex: 0, rightIndex: (array.count - 1))
        
        XCTAssertEqual([1, 2, 3, 5, 7, 8, 9], array)
    }
}
