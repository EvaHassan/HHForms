//
//  FormDataSource.swift
//  lendingcircles
//
//  Created by Hiba Hassan on 4/21/17.
//  Copyright © 2017 Lending Circles. All rights reserved.
//

import Foundation


protocol FormDisplayModel {
    var sections: [SectionTypeDescriptor] {get set}
    
    //func sectionAt(index: Int) -> FormSectionDescriptor
}

extension FormDisplayModel {
    func sectionAt(index: Int) -> SectionTypeDescriptor? {
        guard index > -1 && index < sections.count else { return nil }
        return sections[index]
    }
    
    mutating func updateSection(index: Int, updated section: SectionTypeDescriptor) {
        guard index > -1 && index < sections.count else { return }
        sections[index] = section
    }
}
