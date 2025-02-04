//
//  CustomSortStringTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 17/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class CustomSortStringTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let order = "cba"
        let s = "abcd"
        
        let result = CustomSortString().customSortString(order, s)
        
        XCTAssertEqual(result, "cbad")
    }
    
    func test_B() {
        let order = "cbafg"
        let s = "abcd"
        
        let result = CustomSortString().customSortString(order, s)
        
        XCTAssertEqual(result, "cbad")
    }
    
    func test_C() {
        let order =  "hucw"
        let s = "utzoampdgkalexslxoqfkdjoczajxtuhqyxvlfatmptqdsochtdzgypsfkgqwbgqbcamdqnqztaqhqanirikahtmalzqjjxtqfnh"
        
        let result = CustomSortString().customSortString(order, s)
        
        XCTAssertEqual(result, "hhhhhuucccwaaaaaaaaabbdddddeffffggggiijjjjkkkkllllmmmmnnnoooopppqqqqqqqqqqqrsssttttttttvxxxxxyyzzzzz")
    }

}
