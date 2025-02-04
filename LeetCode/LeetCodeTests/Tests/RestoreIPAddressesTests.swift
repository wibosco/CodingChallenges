//
//  RestoreIPAddressesTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 23/03/2022.
//

import XCTest

@testable import LeetCode

final class RestoreIPAddressesTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "25525511135"
        
        let addresses = RestoreIPAddresses().restoreIpAddresses(s)
        
        let expectedAddresses = ["255.255.11.135", "255.255.111.35"]
        
        //order isn't important
        for address in addresses {
            XCTAssertTrue(expectedAddresses.contains(address))
        }
        
        XCTAssertEqual(addresses.count, expectedAddresses.count)
    }
    
    func test_B() {
        let s = "0000"
        
        let addresses = RestoreIPAddresses().restoreIpAddresses(s)
        
        let expectedAddresses = ["0.0.0.0"]
        
        //order isn't important
        for address in addresses {
            XCTAssertTrue(expectedAddresses.contains(address))
        }
        
        XCTAssertEqual(addresses.count, expectedAddresses.count)
    }
    
    func test_C() {
        let s = "101023"
        
        let addresses = RestoreIPAddresses().restoreIpAddresses(s)
        
        let expectedAddresses = ["1.0.10.23", "1.0.102.3", "10.1.0.23", "10.10.2.3", "101.0.2.3"]
        
        //order isn't important
        for address in addresses {
            XCTAssertTrue(expectedAddresses.contains(address))
        }
        
        XCTAssertEqual(addresses.count, expectedAddresses.count)
    }
}
