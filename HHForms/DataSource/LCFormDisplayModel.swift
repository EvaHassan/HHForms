//
//  FormData.swift
//  lendingcircles
//
//  Created by Hiba Hassan on 4/21/17.
//  Copyright © 2017 Lending Circles. All rights reserved.
//

import Foundation

enum LCFormSection: Int {
    case profile = 0, contactInfo, address
}



struct LCFormDisplayModel: FormDisplayModel {
    internal var sections: [SectionTypeDescriptor]
    
    init() {
        let lcFormTemplate =  [LCFormSection.profile, LCFormSection.contactInfo, LCFormSection.address]
        self.sections = LCFormDisplaModelFactory().makeSections(sections: lcFormTemplate)
    }
    
}


struct LCFormDisplaModelFactory {
    func makeSections(sections: [LCFormSection]) -> [SectionTypeDescriptor] {
        let descriptors = buildDescriptors(in: sections)
        return descriptors
    }
    
    private func buildDescriptors(in sectionTypes: [LCFormSection]) -> [SectionTypeDescriptor] {
        var descriptors: [SectionTypeDescriptor] = []
        for sectionType in sectionTypes {
            let descriptor = getDescriptor(section: sectionType)
            descriptors.append(descriptor)
        }
        
        return descriptors
    }
    
    private func getDescriptor(section: LCFormSection) -> SectionTypeDescriptor {
        switch section {
        case .profile:
            return LCProfileSectionFactory.makeProfileSection()
        case .contactInfo:
            return LCContactSectionFactory.makeContactSection() 
        case .address:
            return LCAddressSectionFactory.makeAddressSection()
        }
    }
}




