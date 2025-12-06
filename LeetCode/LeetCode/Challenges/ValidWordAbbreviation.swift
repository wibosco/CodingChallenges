// Created 23/12/2021.

import Foundation

//https://leetcode.com/problems/valid-word-abbreviation/
struct ValidWordAbbreviation {
    
    //Time: O(max(n, m)) where n is the number of characters in `word`
    //                   where m is the number of characters in `abbr`
    //Space: O(n + m)
    //string
    //array
    //two pointers
    //fast forward
    //
    //Solution Description:
    //We iterate through both `word` and `abbr` together using two pointers. Where the current value of each character array
    //is a letter we directly compare those two elements - if they don't match we return false; if they match we increment
    //both pointers. Where the current value of `abbr` is a number, we first check that number isn't `0` (if it is we return
    //false) and then fast forward through `abbr` building up the number. When we have the full number we increment the `word`
    //pointer (`p1`) by that number. When we exhaust either/both `word` and `abbr` we check if both have been fully processed
    //and return true or false depending on the outcome.
    func validWordAbbreviation(_ word: String, _ abbr: String) -> Bool {
        var p1 = 0
        var p2 = 0

        let word = Array(word)
        let abbr = Array(abbr)

        while p2 < abbr.count, p1 < word.count {
            if abbr[p2].isNumber {
                guard abbr[p2] != "0" else {
                    return false
                }

                var num = 0
                //fast forward
                while p2 < abbr.count, let digit = abbr[p2].wholeNumberValue {
                    num *= 10
                    num += digit

                    p2 += 1
                }
                p1 += num
            } else {
                if abbr[p2] != word[p1] {
                    return false
                }

                p2 += 1
                p1 += 1
            }
        }

        return p1 == word.count && p2 == abbr.count
    }
    
    //Time: O(n) where n is the number of characters in `abbr`
    //Space: O(m) where m is the number of characters in `word`
    //string
    //array
    //two pointers
    //
    //Solution Description:
    //We iterate through both `word` and `abbr` together using two pointers. Where the current value of each character array
    //is a letter we directly compare those two elements - if they don't match we return false; if they match we increment
    //both pointers. Where the current value of `abbr` is a number, we first check that number isn't `0` (if it is we return
    //false) and then fast forward through `abbr` building up the number. When we have the full number we increment the `word`
    //pointer (`p1`) by that number. When we exhaust `abbr` we check that `word` was fully matched by comparing it against
    //`word.count` and return the outcome of that check.
    func validWordAbbreviation2(_ word: String, _ abbr: String) -> Bool {
        var num = ""
        let chars = Array(word)
        var p = 0
        
        for c in abbr {
            if c.isNumber {
                if num.isEmpty && c == "0" {
                    return false
                }
                
                num += String(c)
            } else {
                p += Int(num) ?? 0
                num = ""
                
                if p >= chars.count {
                    return false
                }
                
                if chars[p] != c {
                    return false
                }
                
                p += 1
            }
        }
        
        p += Int(num) ?? 0
        
        return p == chars.count
    }
    
    //Time: O(n) where n is the number of characters in `abbr`
    //Space: O(n + m) where m is the number of characters in `word`
    //string
    //array
    //two pointers
    //fast forward
    //
    //Solution Description:
    //We iterate through both `word` and `abbr` together using two pointers. Where the current value of each character array
    //is a letter we directly compare those two elements - if they don't match we return false; if they match we increment
    //both pointers. Where the current value of `abbr` is a number, we first check that number isn't `0` (if it is we return
    //false) and then fast forward through `abbr` building up the number. When we have the full number we increment the `word`
    //pointer (`p1`) by that number. When we exhaust either/both `word` and `abbr` we check if both have been fully processed
    //and return true or false depending on the outcome.
    func validWordAbbreviation3(_ word: String, _ abbr: String) -> Bool {
        var wordPointer = 0
        var abbrPointer = 0

        let word = Array(word)
        let abbr = Array(abbr)

        while wordPointer < word.count, abbrPointer < abbr.count {
            var count = 0
            while abbrPointer < abbr.count && abbr[abbrPointer].isNumber {
                if count == 0 && abbr[abbrPointer] == "0" { //leading zero
                    return false
                }
                count *= 10
                count += Int(String(abbr[abbrPointer]))!

                abbrPointer += 1
            }

            wordPointer += count

            if wordPointer == word.count && abbrPointer == abbr.count {
                return true
            } else if wordPointer >= word.count {
                return false
            } else if abbrPointer >= abbr.count {
                return false
            } else if word[wordPointer] != abbr[abbrPointer] {
                return false
            }
            
            abbrPointer += 1
            wordPointer += 1
        }

        return wordPointer == word.count && abbrPointer == abbr.count
    }
}
