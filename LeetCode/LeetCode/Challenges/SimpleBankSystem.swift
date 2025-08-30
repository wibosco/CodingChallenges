// Created 30/08/2025.

import Foundation

//https://leetcode.com/problems/simple-bank-system/
class SimpleBankSystem {
    private var balances: [Int]

    init(_ balance: [Int]) {
        self.balances = balance
    }
    
    func transfer(_ account1: Int, _ account2: Int, _ money: Int) -> Bool {
        guard account1 <= balances.count, account2 <= balances.count else {
            return false
        }

        return withdraw(account1, money) && deposit(account2, money)
    }
    
    func deposit(_ account: Int, _ money: Int) -> Bool {
        guard account <= balances.count else {
            return false
        }

        balances[(account - 1)] += money

        return true
    }
    
    func withdraw(_ account: Int, _ money: Int) -> Bool {
        guard account <= balances.count else {
            return false
        }

        guard balances[(account - 1)] >= money else {
            return false
        }

        balances[(account - 1)] -= money

        return true
    }
}
