// Created 05/06/2024.

import Foundation

struct DIStringMatch {
    
    //Time: O(
    //Space: O(
    //string
    //array
    //two pointers
    //greedy
    //
    //Solution Description:
    //Iterating through `s` we keep two values (pointers) - `low` and `high`, with `low` being 0 and `high` bring `n-1`.
    //If we encounter "I" we append the `low` value to our `values` array and incremet `low`; if we encounter "D" then we
    //append the `high` value to our `values` array and decrement `high`. As our `values` array should process the last
    //element after iterating through all `chars` we append `high` (could have been `low` as they should both have the
    //same value at this point) to `values` and return `values`.
    func diStringMatch(_ s: String) -> [Int] {
        let chars = Array(s)
        
        var low = 0
        var high = chars.count
        
        var values = [Int]()
        
        for c in chars {
            if c == "I" {
                values.append(low)
                low += 1
            } else {
                values.append(high)
                high -= 1
            }
        }
        values.append(high)
        
        return values
    }
}
