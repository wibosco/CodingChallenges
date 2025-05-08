// Created 08/05/2025.

import Foundation

//https://leetcode.com/problems/convert-binary-number-in-a-linked-list-to-integer/
struct ConvertBinaryNumberInALinkedListToInteger {
    
    //Time: O(n) where n is the number of nodes in the list
    //Space: O(n)
    //linked list
    //array
    //bit manipulation
    //
    //Solution Description:
    //We iterate through the nodes in the list and extract each value into `bits`. To convert `bits` in a decimal value, we first
    //reverse the array element so that the MSB is in the largest index, and then raise 2 to the power of the index, to ensure we
    //only count bits with a value of `1` we then multiple that raised value by the bit. This decimal value is then added to
    //`decimal`. Once all bits have been processed we return `decimal`.
    func getDecimalValue(_ head: ListNode?) -> Int {
        var bits = [Int]()

        var head = head
        while let h = head {
            bits.append(h.val)

            head = h.next
        }

        var decimal = 0
        for (x, bit) in bits.reversed().enumerated() { //reverse to move MSB to largest index
            decimal += bit * Int(pow(2.0, Double(x)))
        }

        return decimal
    }
}
