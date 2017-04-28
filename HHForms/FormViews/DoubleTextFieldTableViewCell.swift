//
//  DoubleTextFieldTableViewCell.swift
//  lendingcircles
//
//  Created by Hiba Hassan on 4/21/17.
//  Copyright © 2017 Lending Circles. All rights reserved.
//

import UIKit

class DoubleTextFieldTableViewCell: UITableViewCell {
    
    struct Layout {
        static let margin:  CGFloat = 8
        static let height: CGFloat  = 40
    }
    
    lazy var textField_1: UITextField = {
        let field = UITextField(frame: .zero)
        //field.placeholder = "hmbjcbdkjbckjdbckjdb"
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    lazy var textField_2: UITextField = {
        let field = UITextField(frame: .zero)
        //field.placeholder = "hhh   hhhhh   hhhhhh "
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    var formRow: DoubleTextFieldTypeRow? {
        didSet {
            self.updateKeyboardType()
            self.updateFieldsPlaceHoders()
        }
    }
    
    private func updateKeyboardType() {
        guard let keyboard_1 = formRow?.textField_1.itemType.keyBoardType else { return }
        guard let keyboard_2 = formRow?.textField_2.itemType.keyBoardType else { return }
        self.textField_1.keyboardType = keyboard_1
        self.textField_2.keyboardType = keyboard_2
    }
    
    private func updateFieldsPlaceHoders() {
        self.textField_1.placeholder = formRow?.textField_1.placeHolder
        self.textField_2.placeholder = formRow?.textField_2.placeHolder
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.textField_1)
        self.contentView.addSubview(self.textField_2)
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension DoubleTextFieldTableViewCell {
    override func updateConstraints() {
        self.textField_1.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: Layout.margin/2).isActive = true
        self.textField_1.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -Layout.margin/2).isActive = true
        self.textField_1.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: Layout.margin).isActive = true
        self.textField_1.trailingAnchor.constraint(equalTo: self.textField_2.leadingAnchor, constant: -Layout.margin * 1.5).isActive = true
        
        self.textField_2.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: Layout.margin/2).isActive = true
        self.textField_2.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -Layout.margin/2).isActive = true
        self.textField_2.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -Layout.margin).isActive = true
        
        self.textField_1.heightAnchor.constraint(equalToConstant: Layout.height).isActive = true
        self.textField_2.heightAnchor.constraint(equalToConstant: Layout.height).isActive = true
        self.textField_1.widthAnchor.constraint(equalTo: self.textField_2.widthAnchor, constant: 0).isActive = true
        
        super.updateConstraints()
        
        
    }
    
}
