//
//  SingleTextFiledView.swift
//  lendingcircles
//
//  Created by Hiba Hassan on 4/21/17.
//  Copyright © 2017 Lending Circles. All rights reserved.
//

import UIKit

class SingleTextFieldView: FormView {
    
    struct Layout {
        static let margin:  CGFloat = 8
        static let height: CGFloat  = 44
    }
    
    lazy var textField: UITextField = {
        let field = UITextField(frame: .zero)
        field.placeholder = "hmbjcbdkjbckjdbckjdbcsdcjk,dnfkjvndkjb,fdvdfvdfv"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    init() {
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        self.addSubview(self.textField)
        self.updateConstraints()
    }

}

extension SingleTextFieldView {
    override func updateConstraints() {
        
        self.textField.topAnchor.constraint(equalTo: self.topAnchor, constant: Layout.margin).isActive = true
        self.textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Layout.margin).isActive = true
        self.textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Layout.margin).isActive = true
        self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Layout.margin).isActive = true
        self.textField.heightAnchor.constraint(equalToConstant: Layout.height).isActive = true
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        self.updateConstraints()
        super.layoutSubviews()
        
    }
    
}
