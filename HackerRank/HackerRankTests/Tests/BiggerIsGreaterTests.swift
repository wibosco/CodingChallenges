//
//  BiggerIsGreaterTests.swift
//  HackerRankTests
//
//  Created by William Boles on 17/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

@testable import HackerRank

final class BiggerIsGreaterTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_biggerIsGreaterA() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("ab")
        
        XCTAssertEqual("ba", greaterPermutations)
    }
    
    func test_biggerIsGreaterB() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("bb")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterC() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("hefg")
        
        XCTAssertEqual("hegf", greaterPermutations)
    }
    
    func test_biggerIsGreaterD() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("dhck")
        
        XCTAssertEqual("dhkc", greaterPermutations)
    }
    
    func test_biggerIsGreaterE() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("dkhc")
        
        XCTAssertEqual("hcdk", greaterPermutations)
    }
    
    func test_biggerIsGreaterF() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("abc")
        
        XCTAssertEqual("acb", greaterPermutations)
    }
    
    func test_biggerIsGreaterG() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("lmno")
        
        XCTAssertEqual("lmon", greaterPermutations)
    }
    
    func test_biggerIsGreaterH() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("dcba")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterI() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("dcbb")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterJ() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("abdc")
        
        XCTAssertEqual("acbd", greaterPermutations)
    }
    
    func test_biggerIsGreaterK() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("abcd")
        
        XCTAssertEqual("abdc", greaterPermutations)
    }
    
    func test_biggerIsGreaterL() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("fedcbabcd")
        
        XCTAssertEqual("fedcbabdc", greaterPermutations)
    }
    
    func test_biggerIsGreaterM() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("jprfovzkdlmdcesdcpdchcwoedjchcovklhrhlzfeeptoewcqpxg")
        
        XCTAssertEqual("jprfovzkdlmdcesdcpdchcwoedjchcovklhrhlzfeeptoewcqxgp", greaterPermutations)
    }
    
    func test_biggerIsGreaterN() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("zedawdvyyfumwpupuinbdbfndyehircmylbaowuptgmw")
        
        XCTAssertEqual("zedawdvyyfumwpupuinbdbfndyehircmylbaowuptgwm", greaterPermutations)
    }
    
    func test_biggerIsGreaterO() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("zyyxwwtrrnmlggfeb")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterP() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("ocsmerkgidvddsazqxjbqlrrxcotrnfvtnlutlfcafdlwiismslaytqdbvlmcpapfbmzxmftrkkqvkpflxpezzapllerxyzlcf")
        
        XCTAssertEqual("ocsmerkgidvddsazqxjbqlrrxcotrnfvtnlutlfcafdlwiismslaytqdbvlmcpapfbmzxmftrkkqvkpflxpezzapllerxyzlfc", greaterPermutations)
    }
    
    func test_biggerIsGreaterQ() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("biehzcmjckznhwrfgglverxsezxuqpj")
        
        XCTAssertEqual("biehzcmjckznhwrfgglverxsjepquxz", greaterPermutations)
    }
    
    func test_biggerIsGreaterR() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("rebjvsszebhehuojrkkhszxltyqfdvayusylgmgkdivzlpmmtvbsavxvydldmsym")
        
        XCTAssertEqual("rebjvsszebhehuojrkkhszxltyqfdvayusylgmgkdivzlpmmtvbsavxvydldmyms", greaterPermutations)
    }
    
    func test_biggerIsGreaterS() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreater("unpzhmbgrrs")
        
        XCTAssertEqual("unpzhmbgrsr", greaterPermutations)
    }
    
    // MARK: - Alt
    
    func test_biggerIsGreaterAltA() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("ab")
        
        XCTAssertEqual("ba", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltB() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("bb")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltC() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("hefg")
        
        XCTAssertEqual("hegf", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltD() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("dhck")
        
        XCTAssertEqual("dhkc", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltE() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("dkhc")
        
        XCTAssertEqual("hcdk", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltF() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("abc")
        
        XCTAssertEqual("acb", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltG() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("lmno")
        
        XCTAssertEqual("lmon", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltH() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("dcba")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltI() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("dcbb")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltJ() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("abdc")
        
        XCTAssertEqual("acbd", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltK() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("abcd")
        
        XCTAssertEqual("abdc", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltL() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("fedcbabcd")
        
        XCTAssertEqual("fedcbabdc", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltM() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("jprfovzkdlmdcesdcpdchcwoedjchcovklhrhlzfeeptoewcqpxg")
        
        XCTAssertEqual("jprfovzkdlmdcesdcpdchcwoedjchcovklhrhlzfeeptoewcqxgp", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltN() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("zedawdvyyfumwpupuinbdbfndyehircmylbaowuptgmw")
        
        XCTAssertEqual("zedawdvyyfumwpupuinbdbfndyehircmylbaowuptgwm", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltO() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("zyyxwwtrrnmlggfeb")
        
        XCTAssertEqual("no answer", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltP() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("ocsmerkgidvddsazqxjbqlrrxcotrnfvtnlutlfcafdlwiismslaytqdbvlmcpapfbmzxmftrkkqvkpflxpezzapllerxyzlcf")
        
        XCTAssertEqual("ocsmerkgidvddsazqxjbqlrrxcotrnfvtnlutlfcafdlwiismslaytqdbvlmcpapfbmzxmftrkkqvkpflxpezzapllerxyzlfc", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltQ() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("biehzcmjckznhwrfgglverxsezxuqpj")
        
        XCTAssertEqual("biehzcmjckznhwrfgglverxsjepquxz", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltR() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("rebjvsszebhehuojrkkhszxltyqfdvayusylgmgkdivzlpmmtvbsavxvydldmsym")
        
        XCTAssertEqual("rebjvsszebhehuojrkkhszxltyqfdvayusylgmgkdivzlpmmtvbsavxvydldmyms", greaterPermutations)
    }
    
    func test_biggerIsGreaterAltS() {
        let greaterPermutations = BiggerIsGreater.biggerIsGreaterAlt("unpzhmbgrrs")
        
        XCTAssertEqual("unpzhmbgrsr", greaterPermutations)
    }
}
