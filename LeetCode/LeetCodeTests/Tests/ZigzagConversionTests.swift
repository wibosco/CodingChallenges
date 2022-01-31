//
//  ZigzagConversionTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 06/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class ZigzagConversionTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let s = "PAYPALISHIRING"
        let numRows = 3
        
        let conversion = ZigzagConversion.convert(s, numRows)
        
        XCTAssertEqual(conversion, "PAHNAPLSIIGYIR")
    }
    
    func test_B() {
        let s = "PAYPALISHIRING"
        let numRows = 4
        
        let conversion = ZigzagConversion.convert(s, numRows)
        
        XCTAssertEqual(conversion, "PINALSIGYAHRPI")
    }
    
    func test_C() {
        let s = "A"
        let numRows = 1
        
        let conversion = ZigzagConversion.convert(s, numRows)
        
        XCTAssertEqual(conversion, "A")
    }
    
    func test_D() {
        let s = "PAYPALISHIRING"
        let numRows = 1
        
        let conversion = ZigzagConversion.convert(s, numRows)
        
        XCTAssertEqual(conversion, "PAYPALISHIRING")
    }
    
    func test_E() {
        let s = "hjouvsuyoypayulyeimuotehzriicfskpggkbbipzzrzucxamludfykgruowzgiooobppleqlwphapjnadqhdcnvwdtxjbmyppphauxnspusgdhiixqmbfjxjcvudjsuyibyebmwsiqyoygyxymzevypzvjegebeocfuftsxdixtigsieehkchzdflilrjqfnxztqrsvbspkyhsenbppkqtpddbuotbbqcwivrfxjujjddntgeiqvdgaijvwcyaubwewpjvygehljxepbpiwuqzdzubdubzvafspqpqwuzifwovyddwyvvburczmgyjgfdxvtnunneslsplwuiupfxlzbknhkwppanltcfirjcddsozoyvegurfwcsfmoxeqmrjowrghwlkobmeahkgccnaehhsveymqpxhlrnunyfdzrhbasjeuygafoubutpnimuwfjqsjxvkqdorxxvrwctdsneogvbpkxlpgdirbfcriqifpgynkrrefx"
        let numRows = 503
        
        let conversion = ZigzagConversion.convert(s, numRows)
        
        XCTAssertEqual(conversion, "hjouvsuyoypayulyeimuotehzriicfskpggkbbipzzrzucxamludfykgruowzgiooobppleqlwphapjnadqhdcnvwdtxjbmyppphauxnspusgdhiixqmbfjxjcvudjsuyibyebmwsiqyoygyxymzevypzvjegebeocfuftsxdixtigsieehkchzdflilrjqfnxztqrsvbspkyhsenbppkqtpddbuotbbqcwivrfxjujjddntgeiqvdgaijvwcyaubwewpjvygehljxepbpiwuqzdzubdubzvafspqpqwuzifwovyddwyvvburczmgyjgfdxvtnunneslsplwuiupfxlzbknhkwppanltcfirjcddsozoyvegurfwcsfmoxeqmrjowrghwlkobmeahkgccnaehhsveymqpxhlrnunyfdzrhbasjeuygafoubutpnimuwfjqsjxvkqdorxxvrwctdsneogvbpkxlpgdirbfcriqifpgynkrxrfe")
    }
    
    func test_F() {
        let s = "txkrsdyronxiisbacxkdczwdlevfughpftgxzhpnuoxegagixsnbujffpcmkivbpoimnrddnrcuzdakatxcnjjsangmxbomryahpekexmyzrzjsuiwjrfduujgrkuddsfkjjwqjjoiaptulbquvxxprgvksqnwktiwefmpqczsusnfufarfxgygbjatywgthcamqpcsrumjjufpuwwteubifcbeajzhnzvdrxyismtdgbscxqyclzksdnwgzypmxlsqisaceuglvapurnyepkwuavaztqnsbhjlzjoefurcwgznwxtliqfklileyywbihmhtanywebvnakjzewjudthlenlflontbumdimcopxbrhmrlkahqwqdafphrfumgrakzmmpclttshmgsnpilgllncteipqqgschfoxjbqcuzrcrerbrzpcnrxtbpmsveudjlcsmuxitoknueonfdpsxpmaeyubepgociiqehbyxlltrbgxfypepdevdzwiqdyungksqlqnzdjqepnlpfrekwzoxwynbwjqetiuhakidtykkoxavpefngvketzfpivudgqkgasmvtygjxiemmjzuhlyakfsudoyjekrhffcydkjbsnphyrdfcciphajkojvsunbzsezyqiblvquvjxbobjdjjovzyrruettyzswraxexqyszyvnzgsirjeqjxkdbfwzeqyxqxcpnchpafcclxkdgqtpndsqkqsqgqoynsnduwsxbwznvlsbensttmkdceukuiijaxowugtxfukageeksydllpontiansizuinrcwmbdhofnslzkkcvvsmknukdpvcjdrchppiuyyalrlmbxqzsilfyhpbwmdgrwiaozjixhikawwctndoxotvvkwsxbaoyipmiaufjfqmdooybtmzhfwestwpuwfuhwi"
        let numRows = 926
        
        let conversion = ZigzagConversion.convert(s, numRows)
        
        XCTAssertEqual(conversion, "txkrsdyronxiisbacxkdczwdlevfughpftgxzhpnuoxegagixsnbujffpcmkivbpoimnrddnrcuzdakatxcnjjsangmxbomryahpekexmyzrzjsuiwjrfduujgrkuddsfkjjwqjjoiaptulbquvxxprgvksqnwktiwefmpqczsusnfufarfxgygbjatywgthcamqpcsrumjjufpuwwteubifcbeajzhnzvdrxyismtdgbscxqyclzksdnwgzypmxlsqisaceuglvapurnyepkwuavaztqnsbhjlzjoefurcwgznwxtliqfklileyywbihmhtanywebvnakjzewjudthlenlflontbumdimcopxbrhmrlkahqwqdafphrfumgrakzmmpclttshmgsnpilgllncteipqqgschfoxjbqcuzrcrerbrzpcnrxtbpmsveudjlcsmuxitoknueonfdpsxpmaeyubepgociiqehbyxlltrbgxfypepdevdzwiqdyungksqlqnzdjqepnlpfrekwzoxwynbwjqetiuhakidtykkoxavpefngvketzfpivudgqkgasmvtygjxiemmjzuhlyakfsudoyjekrhffcydkjbsnphyrdfcciphajkojvsunbzsezyqiblvquvjxbobjdjjovzyrruettyzswraxexqyszyvnzgsirjeqjxkdbfwzeqyxqxcpnchpafcclxkdgqtpndsqkqsqgqoynsnduwsxbwznvlsbensttmkdceukuiijaxowugtxfukageeksydllpontiansizuinrcwmbdhofnslzkkcvvsmknukdpvcjdrchppiuyyalrlmbxqzsilfyhpbwmdgrwiaozjixhikawwctndoxotvvkwsxbaoyipmiaufjifwqhmudfowouypbwttmszehwf")
    }
}
