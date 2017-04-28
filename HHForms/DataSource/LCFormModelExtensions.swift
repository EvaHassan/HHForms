//
//  LCFormModel.swift
//  lendingcircles
//
//  Created by Hiba Hassan on 4/21/17.
//  Copyright © 2017 Lending Circles. All rights reserved.
//

import Foundation


protocol ProfileItemRow: FormTypeRow {
    var imageItem: ImageFormItem {get set}
    var textField_1: TextFieldFormItem {get set}
    var textField_2: TextFieldFormItem {get set}
}

//MARK: profile item implementation

struct ProfileRow: ProfileItemRow {
    var imageItem: ImageFormItem
    var textField_1: TextFieldFormItem
    var textField_2: TextFieldFormItem
}

extension FormRowFactory {
    static func makeProfileRow() -> ProfileRow {
        let textField_1 = FormItemFactory.makeTextFieldItem(keyBoardType: .regular)
        let textField_2 = FormItemFactory.makeTextFieldItem(keyBoardType: .regular)
        let imageItem = FormItemFactory.makeImageItem(image: nil)
        
        return ProfileRow(imageItem: imageItem, textField_1: textField_1, textField_2: textField_2)
    }
}

extension RowDescriptorFactory {
    static func makeProfileRowDescriptor() -> RowTypeDescriptor {
        let item = FormRowFactory.makeProfileRow()
        return RowDescriptor(formRow: item)
    }
}
