//
//  PrimeTests.swift
//  CodingChallenges
//
//  Created by William Boles on 06/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class PrimeTests: XCTestCase {
    
    // MARK: IsPrime
    
    func test_A() {
        XCTAssertTrue(Prime.isPrime(value: 5))
    }
    
    func test_B() {
        XCTAssertFalse(Prime.isPrime(value: 28))
    }
    
    func test_C() {
        XCTAssertFalse(Prime.isPrime(value: 55))
    }
    
    // MARK: PrimeFactors
    
    func test_primeFactors() {
        Prime.primeFactors(value: 864)
        
        XCTAssertTrue(true)
    }
    
}
