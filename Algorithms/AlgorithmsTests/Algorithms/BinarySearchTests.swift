//
//  BinarySearchTests.swift
//  AlgorithmsTests
//
//  Created by William Boles on 25/05/2022.
//

import XCTest

@testable import Algorithms

class BinarySearchTests: XCTestCase {

    // MARK: - Tests
    
    func test_valueIsFirstMid_targetFound() {
        let values = [1, 2, 3, 4, 5]
        
        let index = BinarySearch.findIndex(of: 3, in: values)
        
        XCTAssertEqual(index, 2)
    }
    
    func test_singleValue_targetFound() {
        let values = [1]
        
        let index = BinarySearch.findIndex(of: 1, in: values)
        
        XCTAssertEqual(index, 0)
    }
    
    func test_singleValue_targetNotFound() {
        let values = [1]
        
        let index = BinarySearch.findIndex(of: 5, in: values)
        
        XCTAssertNil(index)
    }
    
    func test_valuesContainsDuplicate_targetFound() {
        let values = [1, 2, 2, 3, 4, 4, 5]
        
        let index = BinarySearch.findIndex(of: 4, in: values)
        
        XCTAssertEqual(index, 5)
    }
    
    func test_valueIsInLeft_targetFound() {
        let values = [2, 3, 5, 7, 11]
        
        let index = BinarySearch.findIndex(of: 3, in: values)
        
        XCTAssertEqual(index, 1)
    }
    
    func test_valueIsInRight_targetFound() {
        let values = [-5, 2, 3, 5, 7, 11]
        
        let index = BinarySearch.findIndex(of: 7, in: values)
        
        XCTAssertEqual(index, 4)
    }
    
    func test_valueIsLeftEdge_targetFound() {
        let values = [2, 3, 5, 7, 11]
        
        let index = BinarySearch.findIndex(of: 2, in: values)
        
        XCTAssertEqual(index, 0)
    }
    
    func test_valueIsRightEdge_targetFound() {
        let values = [2, 3, 5, 7, 11]
        
        let index = BinarySearch.findIndex(of: 11, in: values)
        
        XCTAssertEqual(index, 4)
    }
    
    func test_mulitpleIterations_targetFound() {
        let values = [-17, -9, 0, 2, 3, 5, 7, 11, 13, 16, 20, 22, 34, 78]
        
        let index = BinarySearch.findIndex(of: 34, in: values)
        
        XCTAssertEqual(index, 12)
    }
    
    func test_mulitpleIterations_negativeTarget_targetFound() {
        let values = [-17, -9, 0, 2, 3, 5, 7, 11, 13, 16, 20, 22, 34, 78]
        
        let index = BinarySearch.findIndex(of: -9, in: values)
        
        XCTAssertEqual(index, 1)
    }
    
    func test_mulitpleIterations_valueNotFound() {
        let values = [-17, -9, 0, 2, 3, 5, 7, 11, 13, 16, 20, 22, 34, 78]
        
        let index = BinarySearch.findIndex(of: 56, in: values)
        
        XCTAssertNil(index)
    }
}
