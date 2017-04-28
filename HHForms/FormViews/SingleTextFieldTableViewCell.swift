//
//  SingleTextFieldTableViewCell.swift
//  lendingcircles
//
//  Created by Hiba Hassan on 4/21/17.
//  Copyright © 2017 Lending Circles. All rights reserved.
//

import UIKit

class SingleTextFieldTableViewCell: UITableViewCell {
    
    struct Layout {
        static let margin:  CGFloat = 8
        static let height: CGFloat  = 40
    }
    
    lazy var textField: UITextField = {
        let field = UITextField(frame: .zero)
        //field.placeholder = "hmbjcbdkjbckjdbckjdbcsdcjk,dnfkjvndkjb,fdvdfvdfv"
        field.borderStyle = .roundedRect
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    var formRow: SingleTextFieldTypeRow? {
        didSet {
            self.updateKeyboardType()
            self.updateFieldsPlaceHoders()
        }
    }
    
    private func updateKeyboardType() {
        guard let keyboard = formRow?.textField.itemType.keyBoardType else { return }
        self.textField.keyboardType = keyboard
    }
    
    private func updateFieldsPlaceHoders() {
        self.textField.placeholder = formRow?.textField.placeHolder
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.textField)
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension SingleTextFieldTableViewCell {
    override func updateConstraints() {
        
        self.textField.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: Layout.margin/2).isActive = true
        self.textField.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -Layout.margin/2).isActive = true
        self.textField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: Layout.margin).isActive = true
        self.textField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -Layout.margin).isActive = true
        self.textField.heightAnchor.constraint(equalToConstant: Layout.height).isActive = true
        super.updateConstraints()
    }
    
}
