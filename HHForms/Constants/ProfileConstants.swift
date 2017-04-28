//
//  ProfileConstants.swift
//  lendingcircles
//
//  Created by Hiba Hassan on 4/21/17.
//  Copyright © 2017 Lending Circles. All rights reserved.
//

import Foundation


struct ProfileSection {
    static let firstName    = "First name"
    static let lastName     = "Last name"
}

struct ContactInfoSection {
    static let email        = "email"
    static let phone        = "(xxx) xxx-xxxx"
}

struct AddressSection {
    static let address1     = "Street Address"
    static let address2     = "Apt"
    static let state        = "State"
    static let zip          = "Zipcode"
    static let country      = "Country"
}

/*struct FormRowType {
    static let singleTexFieldRowType    = "singleTextFieldRowType"
    static let doubleTextFieldRowType   = "doubleTextFieldRowType"
}

//MARK custom rows
extension FormRowType {
    static let profileRowType           = "profileRowType"
} */

enum FormRowType: String {
    case singleTextFieldRowType   = "singleTextFieldRowType"
    case doubleTextFieldRowType  = "doubleTextFieldRowType"
    case profileRowType          = "profileRowType"
}

enum LCFormSectionHeaderTitle: String {
    case profile        = ""
    case contact        = "Contact info"
    case address        = "Address"
}
