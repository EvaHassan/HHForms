//
//  LCFormContactSection.swift
//  lendingcircles
//
//  Created by Hiba Hassan on 4/21/17.
//  Copyright © 2017 Lending Circles. All rights reserved.
//

import Foundation

struct LCContactSectionFactory {
    static func makeContactSection() -> SectionTypeDescriptor {
        
        var phoneRowDescriptor =  RowDescriptorFactory.makeSingleFieldRowDescriptor(for: .phone)
        phoneRowDescriptor.update(placeHolder: ContactInfoSection.phone)
    
        var emailRowDescriptor =  RowDescriptorFactory.makeSingleFieldRowDescriptor(for: .email)
        emailRowDescriptor.update(placeHolder: ContactInfoSection.email)
        
        let rowDescriptors = [phoneRowDescriptor, emailRowDescriptor]
        
        let title = NSLocalizedString(LCFormSectionHeaderTitle.contact.rawValue, comment: "")
        
        let sectionDescriptor = SectionDescriptor(sectionIndex: LCFormSection.contactInfo.rawValue, title: title, sectionItems: rowDescriptors)
                    
        return sectionDescriptor
    }
}
