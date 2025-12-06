// Created 02/08/2023.


import XCTest

@testable import LeetCode

final class MaximumNumberOfRemovableCharactersTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let s = "abcacb"
        let p = "ab"
        let removable = [3, 1, 0]
        
        let result = MaximumNumberOfRemovableCharacters().maximumRemovals(s, p, removable)
            
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let s = "abcbddddd"
        let p = "abcd"
        let removable = [3, 2, 1, 4, 5, 6]
        
        let result = MaximumNumberOfRemovableCharacters().maximumRemovals(s, p, removable)
            
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let s = "abcab"
        let p = "abc"
        let removable = [0, 1, 2, 3, 4]
        
        let result = MaximumNumberOfRemovableCharacters().maximumRemovals(s, p, removable)
            
        XCTAssertEqual(result, 0)
    }
    
    func test_D() {
        let s = "qobftgcueho"
        let p = "obue"
        let removable = [5, 3, 0, 6, 4, 9, 10, 7, 2, 8]
        
        let result = MaximumNumberOfRemovableCharacters().maximumRemovals(s, p, removable)
            
        XCTAssertEqual(result, 7)
    }
    
    func test_E() {
        let s = "qlevcvgzfpryiqlwy"
        let p = "qlecfqlw"
        let removable = [12, 5]
        
        let result = MaximumNumberOfRemovableCharacters().maximumRemovals(s, p, removable)
            
        XCTAssertEqual(result, 2)
    }
}
