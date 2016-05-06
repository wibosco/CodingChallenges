//
//  QuestionsViewController.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 05/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

// MARK: - Enum

enum QuestionType: Int {
    
    case StringReversalA
    case StringReversalB
    case StringReversalWithWordOrderingPerserved
    case SortByAlpabeticalOrder
    case ConvertDecimalToBinary
    case Palindrome
    case FindGCD
    case DetermineIfPrime
    case GeneratePrimes
    case PowerOf2
    case CommonCharacters
    case BuzzFizz
    
    static let count: Int = {
        
        var max: Int = 0
        while let _ = QuestionType(rawValue: max) {
            
            max += 1
        }
        
        return max
    }()
    
    
}

class QuestionsViewController: UIViewController {
    
    // MARK: Constants
    
    private static let kQuestionCellIdentifier = "kQuestionCellIdentifier"
    
    // MARK: - InstanceVariables
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - ViewLifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        /*----------------*/
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: QuestionsViewController.kQuestionCellIdentifier)
    }
    
    // MARK: - Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        print("segue: \(segue), sender: \(sender)")
        
        guard let indexPath = sender as? NSIndexPath else {
            return
        }
        
        let viewController = segue.destinationViewController as! SingleTextFieldViewController
        
        viewController.questionType = QuestionType.init(rawValue: indexPath.row)
    }
}

// MARK: - UITableViewDelegate

extension QuestionsViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("QuestionSelected", sender: indexPath)
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension QuestionsViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return QuestionType.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(QuestionsViewController.kQuestionCellIdentifier, forIndexPath: indexPath)
        
        switch indexPath.row {
        case QuestionType.StringReversalA.rawValue:
            cell.textLabel?.text = "Reverse String A"
        case QuestionType.StringReversalB.rawValue:
            cell.textLabel?.text = "Reverse String A"
        case QuestionType.StringReversalWithWordOrderingPerserved.rawValue:
            cell.textLabel?.text = "Reverse String but keep word ordering"
        case QuestionType.SortByAlpabeticalOrder.rawValue:
            cell.textLabel?.text = "Sorts words by alphabetical ordering"
        case QuestionType.ConvertDecimalToBinary.rawValue:
            cell.textLabel?.text = "convert decimal to binary"
        case QuestionType.Palindrome.rawValue:
            cell.textLabel?.text = "Palindrome"
        case QuestionType.FindGCD.rawValue:
            cell.textLabel?.text = "Finc GCD (Greatest Common Denominator)"
        case QuestionType.DetermineIfPrime.rawValue:
            cell.textLabel?.text = "Determine if value is Prime"
        case QuestionType.GeneratePrimes.rawValue:
            cell.textLabel?.text = "Generate a list of primes"
        case QuestionType.PowerOf2.rawValue:
            cell.textLabel?.text = "Power of 2"
        case QuestionType.CommonCharacters.rawValue:
            cell.textLabel?.text = "Common characters"
        case QuestionType.BuzzFizz.rawValue:
            cell.textLabel?.text = "Buzz Fizz"
        default:
            break
        }
        
        
        
        return cell
    }
}
