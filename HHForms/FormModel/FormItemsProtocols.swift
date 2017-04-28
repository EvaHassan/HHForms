//
//  FormItemsProtocols.swift
//  lendingcircles
//
//  Created by Hiba Hassan on 4/20/17.
//  Copyright © 2017 Lending Circles. All rights reserved.
//

import UIKit


// MARK: what defines a form element that goes into a row
enum FormItemType {
    case textField(TextFieldKeyBoardType), image
    
    var keyBoardType: UIKeyboardType  {
        get {
            switch self {
            case .textField(let value): return value.keyBoard
            case .image: return TextFieldKeyBoardType.regular.keyBoard
            }
        }
    }
}

enum TextFieldKeyBoardType {
    case email, phone, number, regular
    
    var keyBoard: UIKeyboardType {
        get {
            switch self {
            case .email:
                return UIKeyboardType.emailAddress
            case .phone:
                return UIKeyboardType.phonePad
            case .number:
                return UIKeyboardType.numberPad
            default:
                return UIKeyboardType.default
            }
        }
    }
}

protocol FormItem { var itemType: FormItemType { get set }}

protocol TextFieldFormItem: FormItem {
    var placeHolder: String? { get set }
    var attributedText: NSAttributedString? {set get}
    
    init(keyBoardType: TextFieldKeyBoardType)
}


protocol ImageFormItem: FormItem {
    var image: UIImage? {get set}
    
    init(image: UIImage?)
}

//MARK: items implementation

struct TextFieldItem: TextFieldFormItem {
    var itemType: FormItemType
    var attributedText: NSAttributedString?
    var placeHolder: String?

    init(keyBoardType: TextFieldKeyBoardType) {
        self.itemType = FormItemType.textField(keyBoardType)
    }
}

struct ImageItem: ImageFormItem {
    var itemType: FormItemType
    var image: UIImage?
    
    init(image: UIImage?) {
        self.image = image
        self.itemType = .image
    }
}


struct FormItemFactory {
    
    static func makeTextFieldItem(keyBoardType: TextFieldKeyBoardType) -> TextFieldItem {
        return TextFieldItem(keyBoardType: keyBoardType)
    }
    
    static func makeImageItem(image: UIImage?) -> ImageFormItem {
        return ImageItem(image: image)
    }
}



