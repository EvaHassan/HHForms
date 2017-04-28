//
//  FormTableViewCell.swift
//  lendingcircles
//
//  Created by Hiba Hassan on 4/21/17.
//  Copyright © 2017 Lending Circles. All rights reserved.
//

import UIKit

class FormTableViewCell: UITableViewCell {
    
 /*   lazy var formView: FormView = {
        let view = FormView()
        view.frame = self.bounds
        view.backgroundColor = UIColor.yellow
        return view
    }() */
    
    fileprivate var formView: FormView?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        self.formView?.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        self.formView?.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        self.formView?.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
        self.formView?.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0).isActive = true
        
        super.updateConstraints()
    }
    
    func setupView(view: FormView) {
        self.formView?.removeFromSuperview()
        self.formView = view
        self.contentView.addSubview(self.formView!)
        self.formView!.translatesAutoresizingMaskIntoConstraints = false
        self.updateConstraints()
    }
    
}
