//
//  VigenereCipher.swift
//  VigenereCipher
//
//  Created by Denis Sapalov on 19.11.2022.
//

import Foundation

class VigenereCipher {
    
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".uppercased()
    let phrase: String

    init(phrase: String) {
        self.phrase = phrase.uppercased()
    }

    func encrypt(plainText: String) -> String {
        var encryptedText = ""
        var index = 0

        for character in plainText.uppercased() {
            let indexInAlphabet = alphabetIdx(character)

            if indexInAlphabet == -1 {
                encryptedText.append(character)
                continue
            }

            let keyToEncryptWith = phrase[index % phrase.count]
            let keyIndexInAlphabet = alphabetIdx(keyToEncryptWith)
            let encryptedLetterIndex = (indexInAlphabet + keyIndexInAlphabet + alphabet.count) % alphabet.count
            encryptedText.append(alphabet[encryptedLetterIndex])
            index += 1
        }

        return encryptedText
    }

    func decrypt(encryptedText: String) -> String {
        var decryptedText = ""
        var index = 0

        for character in encryptedText.uppercased() {
            let indexInAlphabet = alphabetIdx(character)

            if indexInAlphabet == -1 {
                decryptedText.append(character)
                continue
            }

            let keyToEncryptWith = phrase[index % phrase.count]
            let keyIndexInAlphabet = alphabetIdx(keyToEncryptWith)
            let encryptedLetterIndex = (indexInAlphabet - keyIndexInAlphabet + alphabet.count) % alphabet.count
            decryptedText.append(alphabet[encryptedLetterIndex])
            index += 1
        }

        return decryptedText
    }

    private func alphabetIdx(_ character: Character) -> Int {
        var index = 0

        for chr in alphabet {
            if chr == character {
                return index
            }
            index += 1
        }

        return -1
    }
}
