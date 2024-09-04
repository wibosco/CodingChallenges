//
//  CompareVersionNumbers.swift
//  LeetCode
//
//  Created by William Boles on 04/09/2024.
//

import Foundation

//https://leetcode.com/problems/compare-version-numbers/
struct CompareVersionNumbers {
    
    //Time: O(max(n, m)) where n is the number of characters in `version1`
    //                   where m is the number of characters in `version2`
    //Space: O(n + m)
    //string
    //array
    //two pointers
    //
    //Solution Description:
    //We need to compare the two versions, subversion by subversion. A subversion is marked by a leading and closing ".". So
    //we iterate through both `version1` and `version1` and extract their corresponding subversions. As we are building up
    //each subversion a character at a time we need to ensure that that character when converted to an int is placed into
    //the unit column on the subversion number which we can do by mulitping the `currentSubversion` value by 10 and then
    //adding - this always solves the issue of leading zeros as 0 * 0 = 0. We can't guarantee that each version will have 
    //the same number of characters or subversions as the other so where a version is smaller in length for those
    //subversions we return 0 to compare against the other subversion. Once we have extracted both subversions we can
    //compare them, if the subversions are different we can return the result; if the subversions are the same we keep going.
    //If both all subversions have been extracted and the two versions are the same we return 0.
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let version1 = Array(version1)
        let version2 = Array(version2)
        
        var p1 = 0
        var p2 = 0
        
        while p1 < version1.count || p2 < version2.count {
            let (subversion1, end1) = extractSubversion(from: version1, p1)
            let (subversion2, end2) = extractSubversion(from: version2, p2)
            
            if subversion1 < subversion2 {
                return -1
            } else if subversion1 > subversion2 {
                return 1
            }
            
            p1 = end1 + 1
            p2 = end2 + 1
        }
        
        return 0
    }
    
    private func extractSubversion(from version: [Character], _ start: Int) -> (Int, Int) {
        var p1 = start
        var currentSubversion = 0
        
        while p1 < version.count {
            let value = version[p1]
            
            if value == "." {
                return (currentSubversion, p1)
            } else {
                currentSubversion *= 10
                currentSubversion += Int(String(value))!
                
                p1 += 1
            }
        }
        
        return (currentSubversion, p1)
    }
}
