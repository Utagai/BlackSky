//
//  EncryptionFunctions.swift
//  Project BlackSky
//
//  Created by Tim Bryant on 1/5/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import Security



var blockSize = 2
var PublicTag: String?
var PrivateTag: String?


func findKey(_ tag: String) -> SecKey? { //details are gritty but the function finds which keys to use for encryption based on the user
    let query: [String: AnyObject] = [
        kSecClass as String: kSecClassKey,
        kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
        kSecAttrApplicationTag as String: tag as AnyObject,
        kSecReturnRef as String: true as AnyObject
    ]
    
    var keyPtr: AnyObject?
    let result = SecItemCopyMatching(query as CFDictionary, &keyPtr)
    
    switch result {
    case noErr:
        let key = keyPtr as! SecKey
        return key
    case errSecItemNotFound:
        return nil
    default:
        print("Error occurred: \(result)`")
        return nil
    }
}

let publicKeyParameters: [String: AnyObject] = [
    kSecAttrIsPermanent as String: true as AnyObject,
    kSecAttrApplicationTag as String: PublicTag! as AnyObject
]
let privateKeyParameters: [String: AnyObject] = [
    kSecAttrIsPermanent as String: true as AnyObject,
    kSecAttrApplicationTag as String: PrivateTag! as AnyObject
]

let parameters: [String: AnyObject] = [
    kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
    kSecAttrKeySizeInBits as String: 2048 as AnyObject,
    kSecPublicKeyAttrs as String: publicKeyParameters as AnyObject,
    kSecPrivateKeyAttrs as String: privateKeyParameters as AnyObject
]


func generateKeys() { //function that generates the keys, called during the registration process
    var publicKey, privateKey: SecKey?
    _ = SecKeyGeneratePair(parameters as CFDictionary, &publicKey, &privateKey)
    blockSize = SecKeyGetBlockSize(publicKey!)
}

func Encrypt2(_ UserInput: String, publicKeyFunctionParameter: SecKey?) -> String { //date is entered in as a string and goes into the db as an encrypted string
    


    /*   var encryptedData = [UInt8](count: Int(blockSize), repeatedValue: 0)

    let plainText = UserInput
    let plainTextData = [UInt8](plainText.utf8)
    let plainTextDataLength = plainText.characters.count
    
    var encryptedDataLength = blockSize
    
    _ = SecKeyEncrypt(publicKeyFunctionParameter!, SecPadding.PKCS1, plainTextData, plainTextDataLength, &encryptedData, &encryptedDataLength)
    
    var encryptedString = ""
    
    for var i = 0; i < 256; ++i {

        encryptedString = encryptedString + String(encryptedData[i]) + " "
    }
    return encryptedString
*/

    return UserInput
}

func Decrypt2(_ encryptedTextString: String, privateKeyFunctionParameter: SecKey?) -> String{ //the encrypted string from the db is converted to the original string
    
    

 /*   let encryptedTextInt = encryptedTextString.characters.split(" ").flatMap { UInt8(String($0)) }

    
    var decryptedData = [UInt8](count: Int(blockSize), repeatedValue: 0)
    var decryptedDataLength = blockSize
    
    _ = SecKeyDecrypt(privateKeyFunctionParameter!, SecPadding.PKCS1, encryptedTextInt, decryptedDataLength, &decryptedData, &decryptedDataLength)
    
    
    let decryptedText = String(bytes: decryptedData, encoding:NSUTF8StringEncoding)
    
    return decryptedText!


    */  return encryptedTextString
}

