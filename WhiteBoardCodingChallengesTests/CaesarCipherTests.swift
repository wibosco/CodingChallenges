//
//  CaesarCipherTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 10/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class CaesarCipherTests: XCTestCase {
    
    // MARK: Tests
    
    func test_caesarCipherA() {
        
        let encryptedString = CaesarCipher.encrypt("middle-Outz", rotate: 2)
        
        XCTAssertEqual("okffng-Qwvb", encryptedString)
    }
    
    func test_caesarCipherB() {
        
        let encryptedString = CaesarCipher.encrypt("www.abc.xy", rotate: 87)
        
        XCTAssertEqual("fff.jkl.gh", encryptedString)
    }
    
}
