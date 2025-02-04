//
//  SearchSuggestionsSystem.swift
//  LeetCode
//
//  Created by William Boles on 02/08/2023.
//

import Foundation

//https://leetcode.com/problems/search-suggestions-system/
struct SearchSuggestionsSystem {
    
    //Time: O(n log n + m * n) where n is the number of elements in `products`
    //                         where m is the number of characters in `searchWord`
    //Space: O(n + m)
    //array
    //string
    //sorting
    //nested loops
    //
    //Solution Description:
    //Suggestions are expected to be in lexicographical order so first we sort `products` to ensure that is always the case. Then
    //we iterate through each character in `searchWord` and find matches for that character at that index in `products`, any
    //elements that don't match we discard so each iteration of through `searchWord` potentially results in fewer `products`
    //iterations. if more than 3 products match that iterations criteria is only add the first 3 to `suggestions`.
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        var products = products.sorted()
        let searchWord = Array(searchWord)
        
        var suggestions = [[String]]()
        
        for i in 0..<searchWord.count {
            var localProducts = [String]()
            
            for product in products {
                let product = Array(product)
                
                if i < product.count {
                    if product[i] == searchWord[i] {
                        localProducts.append(String(product))
                    }
                }
            }
                
            products = localProducts //reduce products to only those that matched
            suggestions.append(Array(localProducts.prefix(3)))
        }
        
        return suggestions
    }
}
