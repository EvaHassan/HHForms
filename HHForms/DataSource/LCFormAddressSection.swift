//
//  LCFormAddressSection.swift
//  lendingcircles
//
//  Created by Hiba Hassan on 4/21/17.
//  Copyright © 2017 Lending Circles. All rights reserved.
//

import Foundation

struct LCAddressSectionFactory {
    static func makeAddressSection() -> SectionTypeDescriptor {
        var address1 =  RowDescriptorFactory.makeSingleFieldRowDescriptor()
        address1.update(placeHolder: AddressSection.address1)
    
        var address2 = RowDescriptorFactory.makeSingleFieldRowDescriptor()
        address2.update(placeHolder: AddressSection.address2)
        
        var stateAndZip =  RowDescriptorFactory.makeDoubleFieldRowDescriptor(for: .regular, and: .number)
        stateAndZip.update(placeHolder1: AddressSection.state, placeHolder2: AddressSection.zip)
        
        var country = RowDescriptorFactory.makeSingleFieldRowDescriptor()
        country.update(placeHolder: AddressSection.country)
      
        let rowDescriptors: [RowTypeDescriptor] = [address1,
                                               address2,
                                               stateAndZip,
                                               country]
        
        let title = NSLocalizedString(LCFormSectionHeaderTitle.address.rawValue, comment: "")
        let sectionDescriptor = SectionDescriptorFactory.makeDescriptor(for: LCFormSection.address.rawValue, title: title, rows: rowDescriptors )
        return sectionDescriptor
    }
}
