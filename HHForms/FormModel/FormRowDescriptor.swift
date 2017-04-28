//
//  FormRowDescriptor.swift
//  lendingcircles
//
//  Created by Hiba Hassan on 4/21/17.
//  Copyright © 2017 Lending Circles. All rights reserved.
//

import UIKit

protocol Editable { }

protocol Clickable { }

protocol RowTypeDescriptor {
    var formRow: FormTypeRow { get set }
    var rowType: FormRowType { get }
    
    init(formRow: FormTypeRow, rowType: FormRowType)
}

/*extension RowTypeDescriptor {
    init(formRow: FormTypeRow, rowType: FormRowType) {
        self.init()
        self.formRow = formRow
        self.rowType = rowType
    }
} */

extension RowTypeDescriptor {
    mutating func update(formRow: FormTypeRow) {
        self.formRow = formRow
    }
}

protocol SingleTextFieldRowTypeDescriptor: RowTypeDescriptor { }

protocol DoubleTextFieldRowTypeDescriptor: RowTypeDescriptor { }

extension SingleTextFieldRowTypeDescriptor {
    mutating func update(placeHolder: String?) {
        var newFormRow = self.formRow as! SingleTextFieldTypeRow
        newFormRow.update(placeHolder: placeHolder)
        self.update(formRow: newFormRow)
    }
}

extension DoubleTextFieldRowTypeDescriptor {
    mutating func update(placeHolder1: String?) {
        var newFormRow = self.formRow as! DoubleTextFieldTypeRow
        newFormRow.update(placeHolder1: placeHolder1)
        self.update(formRow: newFormRow)
    }
    mutating func update(placeHolder2: String?) {
        var newFormRow = self.formRow as! DoubleTextFieldTypeRow
        newFormRow.update(placeHolder2: placeHolder2)
        self.update(formRow: newFormRow)
    }
    mutating func update(placeHolder1: String?, placeHolder2: String?) {
        var newFormRow = self.formRow as! DoubleTextFieldTypeRow
        newFormRow.update(placeHolder1: placeHolder1, placeHolder2: placeHolder2)
        self.update(formRow: newFormRow)
        print("vvvvvvvvvvvvv ", placeHolder1, placeHolder2)
    }
}


//MARK descriptors implementation

struct RowDescriptor : RowTypeDescriptor {
    
    var formRow: FormTypeRow
    var rowType: FormRowType
    
    init(formRow: FormTypeRow, rowType: FormRowType) {
        self.formRow = formRow
        self.rowType = rowType
    }
}

extension RowDescriptor: SingleTextFieldRowTypeDescriptor { }

extension RowDescriptor: DoubleTextFieldRowTypeDescriptor { }

/*struct SingleTextFieldRowDescriptor : SingleTextFieldRowTypeDescriptor {
    
    var formRow: FormTypeRow
    var rowType: FormRowType
    
    init(formRow: FormTypeRow, rowType: FormRowType) {
        self.formRow = formRow
        self.rowType = rowType
    }
} */
    


struct RowDescriptorFactory {
    static func makeSingleFieldRowDescriptor() -> SingleTextFieldRowTypeDescriptor {
        let item = FormRowFactory.makeSingleTextFieldRow(keyBoardType: .regular)
        return RowDescriptor(formRow: item, rowType: FormRowType.singleTextFieldRowType)
    }
    
    static func makeSingleFieldRowDescriptor(for keyboardType: TextFieldKeyBoardType) -> SingleTextFieldRowTypeDescriptor {
        let item = FormRowFactory.makeSingleTextFieldRow(keyBoardType: keyboardType)
        return RowDescriptor(formRow: item, rowType: FormRowType.singleTextFieldRowType)
    }
    
    static func makeDoubleFieldRowDescriptor() -> DoubleTextFieldRowTypeDescriptor {
        let item = FormRowFactory.makeDouleTextFieldRow(keyBoardType1: .regular, keyBoardType2: .regular)
        return RowDescriptor(formRow: item, rowType: FormRowType.doubleTextFieldRowType)
    }
    
    static func makeDoubleFieldRowDescriptor(for keyboardType1: TextFieldKeyBoardType, and keyboardType2: TextFieldKeyBoardType) -> DoubleTextFieldRowTypeDescriptor {
        let item = FormRowFactory.makeDouleTextFieldRow(keyBoardType1: keyboardType1, keyBoardType2: keyboardType2)
        return RowDescriptor(formRow: item, rowType: FormRowType.doubleTextFieldRowType)
    }
    
}

