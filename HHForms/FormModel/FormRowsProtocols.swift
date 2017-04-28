//
//  FormRowsProtocols.swift
//  lendingcircles
//
//  Created by Hiba Hassan on 4/22/17.
//  Copyright © 2017 Lending Circles. All rights reserved.
//

import UIKit


// MARK: what defines a Form Row

protocol FormTypeRow { }

protocol SingleTextFieldTypeRow: FormTypeRow, Editable {
    var textField: TextFieldFormItem { get set }
}

extension SingleTextFieldTypeRow {
    mutating func update(placeHolder text: String?) {
        self.textField.placeHolder = text
    }
    mutating func update(text attributedText: NSAttributedString?) {
        self.textField.attributedText = attributedText
    }
}

protocol DoubleTextFieldTypeRow: FormTypeRow, Editable {
    var textField_1: TextFieldFormItem { get set }
    var textField_2: TextFieldFormItem { get set }
}

extension DoubleTextFieldTypeRow {
    mutating func update(placeHolder1 text: String?) {
        self.textField_1.placeHolder = text
    }
    mutating func update(placeHolder2 text: String?) {
        self.textField_2.placeHolder = text
    }
    
    mutating func update(placeHolder1 text1: String?, placeHolder2 text2: String?) {
        self.textField_1.placeHolder = text1
        self.textField_2.placeHolder = text2
        print("cccccccc ", text1, text2)
    }
    
    mutating func update(AttributedText_1 attributedText: NSAttributedString?) {
        self.textField_1.attributedText = attributedText
    }
    mutating func update(AttributedText_2 attributedText: NSAttributedString?) {
        self.textField_2.attributedText = attributedText
    }
    mutating func update(AttributedText_1 attributedText1: NSAttributedString?, AttributedText_2 attributedText2: NSAttributedString?) {
        self.textField_1.attributedText = attributedText1
        self.textField_2.attributedText = attributedText2
    }
}



// MARK row items implememtations

struct SingleTextFieldRow: SingleTextFieldTypeRow {
    var textField: TextFieldFormItem
}

struct DoubleTextFieldRow: DoubleTextFieldTypeRow {
    var textField_1: TextFieldFormItem
    var textField_2: TextFieldFormItem

}

struct FormRowFactory {
    
    static func makeSingleTextFieldRow(keyBoardType: TextFieldKeyBoardType) -> SingleTextFieldRow {
        let item = FormItemFactory.makeTextFieldItem(keyBoardType: keyBoardType)
        return SingleTextFieldRow(textField: item)
    }
    
    static func makeDouleTextFieldRow(keyBoardType1: TextFieldKeyBoardType, keyBoardType2: TextFieldKeyBoardType) -> DoubleTextFieldRow {
        let item1 = FormItemFactory.makeTextFieldItem(keyBoardType: keyBoardType1)
        let item2 = FormItemFactory.makeTextFieldItem(keyBoardType: keyBoardType2)
        return DoubleTextFieldRow(textField_1: item1, textField_2: item2)
    }
    

}

