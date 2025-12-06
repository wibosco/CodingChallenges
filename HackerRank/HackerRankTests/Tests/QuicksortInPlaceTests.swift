// Created 19/05/2022.


import XCTest

@testable import HackerRank

final class QuicksortInPlaceTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        var array = [5, 8, 1, 3, 7, 9, 2]
        
        QuicksortInPlace.sortInPlace(array: &array, leftIndex: 0, rightIndex: (array.count - 1))
        
        XCTAssertEqual([1, 2, 3, 5, 7, 8, 9], array)
    }
    
    func test_B() {
        var array = [5, 8, 1, 3, 7, 9, 2, 12, 14, 15, 16, 22, 23, 25, 4, 10, 6]
        
        QuicksortInPlace.sortInPlace(array: &array, leftIndex: 0, rightIndex: (array.count - 1))
        
        XCTAssertEqual([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14, 15, 16, 22, 23, 25], array)
    }
    
    func test_C() {
        var array = [5, 8, 1, 3, 7, 5, 9, 2, 3, 4]
        
        QuicksortInPlace.sortInPlace(array: &array, leftIndex: 0, rightIndex: (array.count - 1))
        
        XCTAssertEqual([1, 2, 3, 3, 4, 5, 5, 7, 8, 9], array)
    }
    
    func test_D() {
        var array = [1, 3, 9, 8, 2, 7, 5]
        
        QuicksortInPlace.sortInPlace(array: &array, leftIndex: 0, rightIndex: (array.count - 1))
        
        XCTAssertEqual([1, 2, 3, 5, 7, 8, 9], array)
    }
}
