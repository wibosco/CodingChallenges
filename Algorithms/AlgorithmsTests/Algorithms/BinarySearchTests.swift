//
//  BinarySearchTests.swift
//  AlgorithmsTests
//
//  Created by William Boles on 25/05/2022.
//

import XCTest

@testable import Algorithms

final class BinarySearchTests: XCTestCase {

    // MARK: - Tests
    
    // MARK: FindAny
    
    func test_findIndex_valueIsFirstMid_targetFound() {
        let values = [1, 2, 3, 4, 5]
        
        let index = BinarySearch.findIndex(of: 3, in: values)
        
        XCTAssertEqual(index, 2)
    }
    
    func test_findIndex_singleValue_targetFound() {
        let values = [1]
        
        let index = BinarySearch.findIndex(of: 1, in: values)
        
        XCTAssertEqual(index, 0)
    }
    
    func test_findIndex_singleValue_targetNotFound() {
        let values = [1]
        
        let index = BinarySearch.findIndex(of: 5, in: values)
        
        XCTAssertNil(index)
    }
    
    func test_findIndex_valuesContainsDuplicate_targetFound() {
        let values = [1, 2, 2, 3, 4, 4, 5]
        
        let index = BinarySearch.findIndex(of: 4, in: values)
        
        XCTAssertEqual(index, 5)
    }
    
    func test_findIndex_valueIsInLeft_targetFound() {
        let values = [2, 3, 5, 7, 11]
        
        let index = BinarySearch.findIndex(of: 3, in: values)
        
        XCTAssertEqual(index, 1)
    }
    
    func test_findIndex_valueIsInRight_targetFound() {
        let values = [-5, 2, 3, 5, 7, 11]
        
        let index = BinarySearch.findIndex(of: 7, in: values)
        
        XCTAssertEqual(index, 4)
    }
    
    func test_findIndex_valueIsLeftEdge_targetFound() {
        let values = [2, 3, 5, 7, 11]
        
        let index = BinarySearch.findIndex(of: 2, in: values)
        
        XCTAssertEqual(index, 0)
    }
    
    func test_findIndex_valueIsRightEdge_targetFound() {
        let values = [2, 3, 5, 7, 11]
        
        let index = BinarySearch.findIndex(of: 11, in: values)
        
        XCTAssertEqual(index, 4)
    }
    
    func test_findIndex_multipleIterations_targetFound() {
        let values = [-17, -9, 0, 2, 3, 5, 7, 11, 13, 16, 20, 22, 34, 78]
        
        let index = BinarySearch.findIndex(of: 34, in: values)
        
        XCTAssertEqual(index, 12)
    }
    
    func test_findIndex_multipleIterations_negativeTarget_targetFound() {
        let values = [-17, -9, 0, 2, 3, 5, 7, 11, 13, 16, 20, 22, 34, 78]
        
        let index = BinarySearch.findIndex(of: -9, in: values)
        
        XCTAssertEqual(index, 1)
    }
    
    func test_findIndex_multipleIterations_valueNotFound() {
        let values = [-17, -9, 0, 2, 3, 5, 7, 11, 13, 16, 20, 22, 34, 78]
        
        let index = BinarySearch.findIndex(of: 56, in: values)
        
        XCTAssertNil(index)
    }
    
    // MARK: FindFirst
    
    func test_findFirstIndex_firstValueIsFirstMid_targetFound() {
        let values = [1, 2, 4, 4, 5]
        
        let index = BinarySearch.findFirstIndex(of: 4, in: values)
        
        XCTAssertEqual(index, 2)
    }
    
    func test_findFirstIndex_singleValue_targetFound() {
        let values = [1]
        
        let index = BinarySearch.findFirstIndex(of: 1, in: values)
        
        XCTAssertEqual(index, 0)
    }
    
    func test_findFirstIndex_singleValue_targetNotFound() {
        let values = [1]
        
        let index = BinarySearch.findFirstIndex(of: 5, in: values)
        
        XCTAssertNil(index)
    }
    
    func test_findFirstIndex_valuesDoesNotContainDuplicates_targetFound() {
        let values = [1, 3, 4, 5]
        
        let index = BinarySearch.findFirstIndex(of: 4, in: values)
        
        XCTAssertEqual(index, 2)
    }
    
    func test_findFirstIndex_firstValueIsNotFirstMid_targetFound() {
        let values = [1, 4, 4, 5, 5]
        
        let index = BinarySearch.findFirstIndex(of: 4, in: values)
        
        XCTAssertEqual(index, 1)
    }
    
    func test_findFirstIndex_multipleIterations_targetFound() {
        let values = [-17, -9, 0, 2, 3, 5, 7, 11, 11, 13, 16, 20, 22, 34, 34, 34, 34, 78]
        
        let index = BinarySearch.findFirstIndex(of: 34, in: values)
        
        XCTAssertEqual(index, 13)
    }
    
    func test_findFirstIndex_valueIsInLeft_targetFound() {
        let values = [2, 3, 3, 5, 7, 11, 13, 16]
        
        let index = BinarySearch.findFirstIndex(of: 3, in: values)
        
        XCTAssertEqual(index, 1)
    }
    
    func test_findFirstIndex_valueIsInRight_targetFound() {
        let values = [-5, -2, 1, 2, 3, 5, 7, 7, 11]
        
        let index = BinarySearch.findFirstIndex(of: 7, in: values)
        
        XCTAssertEqual(index, 6)
    }
    
    func test_findFirstIndex_valueIsLeftEdge_targetFound() {
        let values = [2, 2, 3, 5, 7, 11]
        
        let index = BinarySearch.findFirstIndex(of: 2, in: values)
        
        XCTAssertEqual(index, 0)
    }
    
    func test_findFirstIndex_valueIsRightEdge_targetFound() {
        let values = [2, 3, 5, 7, 11, 11]
        
        let index = BinarySearch.findFirstIndex(of: 11, in: values)
        
        XCTAssertEqual(index, 4)
    }
    
    func test_findFirstIndex_multipleIterations_negativeTarget_targetFound() {
        let values = [-17, -17, -9, -9, 0, 2, 3, 5, 7, 11, 13, 16, 20, 22, 34, 78]
        
        let index = BinarySearch.findFirstIndex(of: -9, in: values)
        
        XCTAssertEqual(index, 2)
    }
    
    func test_findFirstIndex_multipleIterations_valueNotFound() {
        let values = [-17, -9, 0, 2, 3, 5, 7, 11, 13, 16, 16, 20, 22, 34, 78]
        
        let index = BinarySearch.findFirstIndex(of: 56, in: values)
        
        XCTAssertNil(index)
    }
    
    // MARK: FindLast
    
    func test_findLastIndex_firstValueIsFirstMid_targetFound() {
        let values = [1, 2, 4, 4, 5]
        
        let index = BinarySearch.findLastIndex(of: 4, in: values)
        
        XCTAssertEqual(index, 3)
    }
    
    func test_findLastIndex_singleValue_targetFound() {
        let values = [1]
        
        let index = BinarySearch.findLastIndex(of: 1, in: values)
        
        XCTAssertEqual(index, 0)
    }
    
    func test_findLastIndex_singleValue_targetNotFound() {
        let values = [1]
        
        let index = BinarySearch.findLastIndex(of: 5, in: values)
        
        XCTAssertNil(index)
    }
    
    func test_findLastIndex_valuesDoesNotContainDuplicates_targetFound() {
        let values = [1, 3, 4, 5]
        
        let index = BinarySearch.findLastIndex(of: 4, in: values)
        
        XCTAssertEqual(index, 2)
    }
    
    func test_findLastIndex_firstValueIsNotFirstMid_targetFound() {
        let values = [1, 4, 4, 5, 5]
        
        let index = BinarySearch.findLastIndex(of: 4, in: values)
        
        XCTAssertEqual(index, 2)
    }
    
    func test_findLastIndex_multipleIterations_targetFound() {
        let values = [-17, -9, 0, 2, 3, 5, 7, 11, 11, 13, 16, 20, 22, 34, 34, 34, 34, 78]
        
        let index = BinarySearch.findLastIndex(of: 34, in: values)
        
        XCTAssertEqual(index, 16)
    }
    
    func test_findLastIndex_valueIsInLeft_targetFound() {
        let values = [2, 3, 3, 5, 7, 11, 13, 16]
        
        let index = BinarySearch.findLastIndex(of: 3, in: values)
        
        XCTAssertEqual(index, 2)
    }
    
    func test_findLastIndex_valueIsInRight_targetFound() {
        let values = [-5, -2, 1, 2, 3, 5, 7, 7, 11]
        
        let index = BinarySearch.findLastIndex(of: 7, in: values)
        
        XCTAssertEqual(index, 7)
    }
    
    func test_findLastIndex_valueIsLeftEdge_targetFound() {
        let values = [2, 2, 3, 5, 7, 11]
        
        let index = BinarySearch.findLastIndex(of: 2, in: values)
        
        XCTAssertEqual(index, 1)
    }
    
    func test_findLastIndex_valueIsRightEdge_targetFound() {
        let values = [2, 3, 5, 7, 11, 11]
        
        let index = BinarySearch.findLastIndex(of: 11, in: values)
        
        XCTAssertEqual(index, 5)
    }
    
    func test_findLastIndex_multipleIterations_negativeTarget_targetFound() {
        let values = [-17, -17, -9, -9, 0, 2, 3, 5, 7, 11, 13, 16, 20, 22, 34, 78]
        
        let index = BinarySearch.findLastIndex(of: -9, in: values)
        
        XCTAssertEqual(index, 3)
    }
    
    func test_findLastIndex_multipleIterations_valueIsInMidRange_valueNotFound() {
        let values = [-17, -9, 0, 2, 3, 5, 7, 11, 13, 16, 16, 20, 22, 34, 78]
        
        let index = BinarySearch.findLastIndex(of: 56, in: values)
        
        XCTAssertNil(index)
    }
    
    func test_findLastIndex_multipleIterations_valueIsTooSmall_valueNotFound() {
        let values = [-17, -9, 0, 2, 3, 5, 7, 11, 13, 16, 16, 20, 22, 34, 78]
        
        let index = BinarySearch.findLastIndex(of: -100, in: values)
        
        XCTAssertNil(index)
    }
    
    func test_findLastIndex_multipleIterations_valueIsToolarge_valueNotFound() {
        let values = [-17, -9, 0, 2, 3, 5, 7, 11, 13, 16, 16, 20, 22, 34, 78]
        
        let index = BinarySearch.findLastIndex(of: 100, in: values)
        
        XCTAssertNil(index)
    }
}
