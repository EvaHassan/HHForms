//
//  ProfileCustomTableViewCell.swift
//  lendingcircles
//
//  Created by Hiba Hassan on 4/21/17.
//  Copyright © 2017 Lending Circles. All rights reserved.
//

import UIKit

class ProfileCustomTableViewCell: UITableViewCell {
    
    struct Layout {
        static let margin:  CGFloat = 15
        static let imageHeight: CGFloat = 72
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
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: Layout.imageHeight, height: Layout.imageHeight))
        imageView.backgroundColor = UIColor.lightGray
        imageView.contentMode = .scaleAspectFill
        //imageView.image = UIImage(named: "VideoThumbnail2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var formRow: ProfileItemRow? {
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
        self.contentView.addSubview(self.avatarImageView)
        self.contentView.addSubview(self.textField_1)
        self.contentView.addSubview(self.textField_2)
        self.makeImageViewRound()
        self.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ProfileCustomTableViewCell {
    override func updateConstraints() {
        self.textField_1.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: Layout.margin/2).isActive = true
        self.textField_1.bottomAnchor.constraint(equalTo: self.textField_2.topAnchor, constant: -Layout.margin).isActive = true
        self.textField_1.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: Layout.margin).isActive = true
        self.textField_1.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -Layout.margin ).isActive = true
        
        self.textField_2.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -Layout.margin/2).isActive = true
        self.textField_2.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -Layout.margin).isActive = true
        
        self.textField_1.heightAnchor.constraint(equalToConstant: Layout.height).isActive = true
        self.textField_2.heightAnchor.constraint(equalToConstant: Layout.height).isActive = true
        self.textField_1.widthAnchor.constraint(equalTo: self.textField_2.widthAnchor, constant: 0).isActive = true
        
        self.avatarImageView.heightAnchor.constraint(equalToConstant: Layout.imageHeight).isActive = true
        self.avatarImageView.widthAnchor.constraint(equalToConstant: Layout.imageHeight).isActive = true
        self.avatarImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: Layout.margin).isActive = true
        self.avatarImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
        super.updateConstraints()
    }
    
    
    func makeImageViewRound() {
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.width / 2
        self.avatarImageView.layer.masksToBounds = true
    }

    
}

