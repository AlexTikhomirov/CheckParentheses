//
//  ViewController.swift
//  CheckParentheses
//
//  Created by  Tikhomirov on 23.01.2018.
//  Copyright © 2018 SHT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - Private methods
    private func changeText(_ textView: UITextView) {
        guard let text = textView.text else { return }
        var leftCount = 0
        var rightCount = 0
        var flagError = false
        for item in text {
            if item == "(" { leftCount += 1 }
            if item == ")" { leftCount <= rightCount ? (flagError = true) : (rightCount += 1) }
        }
        if flagError {
           textView.textColor = UIColor.red
        } else if leftCount > rightCount {
            textView.textColor = UIColor.orange
        } else {
            textView.textColor = UIColor.black
        }
    }
}

// MARK: - UITextViewDelegate
extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        changeText(textView)
    }
}
