//
//  LocalizedAppStrings.swift
//  SignupForm_POC
//
//  Created by Salman_Macbook on 24/05/24.
//

import Foundation

func Localized(_ text: LocalizedAppStrings) -> String {
    return text.localised
}

enum LocalizedAppStrings: String {
    
    var localised: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
    
    case accountCreated       = "Account_Created"
}
