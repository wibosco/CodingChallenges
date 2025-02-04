//
//  RestoreIPAddresses.swift
//  LeetCode
//
//  Created by William Boles on 23/03/2022.
//

import Foundation

//https://leetcode.com/problems/restore-ip-addresses/
struct RestoreIPAddresses {
    
    //Time: O(3^n) where n is the number of elements in `s`, 3 as each element has 3 possible configurations
    //Space: O(3^n)
    //string
    //backtracking
    //array
    //
    //Solution Description:
    //IPv4 address contains a maximum of 12 digits so if `s` is greater than 12 we know it's invalid and exit early. With a
    //valid number of digits we know need to separate them into all their possible combinations i.e. each section can contain
    //between 1 and 3 digits. Using backtracking we separate each combination and we place them into an ongoing array
    //`current` if at any time that array contains more than 4 elements we know that the IP address is invalid and we exit
    //that branch. If we use all digits in `s` and `current` equals 4 then we have a valid IP address and add it `addresses`
    func restoreIpAddresses(_ s: String) -> [String] {
        guard s.count <= 12 else { //maximum size of a valid IP address
            return [String]()
        }
        
        var addresses = [String]()
        let characters = Array(s) //easier to work an array than string indexing
        
        backtrack(characters, 0, [String](), &addresses)
        
        return addresses
    }
    
    private func backtrack(_ characters: [Character], _ left: Int, _ current: [String], _ addresses: inout [String]) {
        guard current.count < 5 else { //valid IP address has 4 sections anything more and it's invalid
            return
        }
        
        guard left < characters.count else {
            if current.count == 4 {
                let address = current.joined(separator: ".")
                addresses.append(address)
            }
            return
        }
        
        for i in 0..<3 { //a valid section must contain between 1 and 3 digits
            let right = left + i
            guard right < characters.count else {
                break
            }
            
            //convert to an array so that the indexing starts at zero instead of `left`
            let values = Array(characters[left...right])
            
            //`0` on it's own is valid but not e.g. `01` or `000`
            if values[0] == "0" && values.count > 1 {
                continue
            }
            
            let strValue = String(values)
            
            if values.count == 3 {
                if Int(strValue)! > 255 {
                    continue
                }
            }
            
            backtrack(characters, (right + 1), (current + [strValue]), &addresses)
        }
    }
}
