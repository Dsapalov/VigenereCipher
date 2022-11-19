//
//  ViewController.swift
//  VigenereCipher
//
//  Created by Denis Sapalov on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var phrase: UITextField!
    
    @IBOutlet private weak var encryptText: UITextField!
    @IBOutlet private weak var encryptResult: UITextField!
    
    @IBOutlet private weak var decryptText: UITextField!
    @IBOutlet private weak var decryptResult: UITextField!
    
    private var chiper: VigenereCipher?
    
    @IBAction func encrypt() {
        if chiper == nil {
            chiper = VigenereCipher(phrase: phrase.text!)
        }
        
        guard let inputText = encryptText.text else {
            encryptResult.text = "Empty input data"
            return
        }
        
        encryptResult.text = chiper?.encrypt(plainText: inputText)
        
    }
    
    @IBAction func decrypt() {
        if chiper == nil {
            chiper = VigenereCipher(phrase: phrase.text!)
        }
        
        guard let inputText = decryptText.text else {
            decryptResult.text = "Empty input data"
            return
        }
        
        decryptResult.text = chiper?.encrypt(plainText: inputText)
    }
    
}

extension String {
    subscript(i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
}
