//
//  LCFormProfileSection.swift
//  lendingcircles
//
//  Created by Hiba Hassan on 4/21/17.
//  Copyright © 2017 Lending Circles. All rights reserved.
//

import Foundation

struct LCProfileSectionFactory {
    static func makeProfileSection() -> SectionTypeDescriptor {
        let title = NSLocalizedString(LCFormSectionHeaderTitle.profile.rawValue, comment: "")
        var rowDescriptor =  RowDescriptorFactory.makeProfileRowDescriptor()
        rowDescriptor.update(placeHolder1: ProfileSection.firstName, placeHolder2: ProfileSection.lastName)
           
        let sectionDescriptor = SectionDescriptorFactory.makeDescriptor(for: LCFormSection.profile.rawValue, title: title, rows: [rowDescriptor])
        
        return sectionDescriptor
    }
}
