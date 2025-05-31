// Created 31/05/2025.

import Foundation

//https://leetcode.com/problems/goat-latin/
struct GoatLatin {
    
    //Time: O(n) where n is the number of words in `sentence`
    //Space: O(n)
    //string
    //array
    //
    //Solution Description:
    //First we split the words out of the sentance using the " " seperator then we iterate through each word. If the first
    //character of a word is a consonant we we move that character to the end. Next we add "ma" to the end and the "a"
    //values. The tranformed word is then added to the `goatLatin` array. To avoid having to calculate the "a" values each
    //time we gradually grow that array with each iteration. Once all words have been processed we combine the elements
    //into a single string and return it.
    func toGoatLatin(_ sentence: String) -> String {
        var suffix: [Character] = ["a"]
        let words = sentence.components(separatedBy: " ")

        let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]

        var goatLatin = [String]()

        for word in words {
            var characters = Array(word)
            if !vowels.contains(characters[0]) {
                let first = characters.removeFirst()
                characters.append(first)
            }
            characters += ["m", "a"]
            characters += suffix

            goatLatin.append(String(characters))

            suffix += "a"
        }

        return goatLatin.joined(separator: " ")
    }
}
