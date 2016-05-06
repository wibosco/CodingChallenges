//
//  ReverseStringAViewController.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 05/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class SingleTextFieldViewController: UIViewController {

    // MARK: Accessor
    
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    var questionType: QuestionType?

    // MARK: ViewLifeCycle

    override func viewDidLoad() {
        
        super.viewDidLoad()

        
    }
    
    // MARK: Reverse
    
    func reverse(string: String) {
        
        print(string.characters.reverse())
    }
}

// MARK: UITextFieldDelegate

extension SingleTextFieldViewController: UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if let text = textField.text {
            
            self.reverse(text)
        }
        
        return true
    }
}

