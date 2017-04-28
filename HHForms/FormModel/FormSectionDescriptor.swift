//
//  FormSectionDescriptor.swift
//  lendingcircles
//
//  Created by Hiba Hassan on 4/21/17.
//  Copyright © 2017 Lending Circles. All rights reserved.
//

import Foundation


protocol SectionTypeDescriptor {
    var sectionIndex: Int { get }
    var title: String? { get }
    var sectionItems: [RowTypeDescriptor] { get set }
}

extension SectionTypeDescriptor {
    func rowDescriptorFor(index: Int) -> RowTypeDescriptor? {
        guard index > -1 && index < sectionItems.count else { return nil }
        
        return sectionItems[index]
    }
    
    mutating func updateRowDescriptor(index: Int, updated descriptor: RowTypeDescriptor) {
        guard index > -1 && index < sectionItems.count else { return }
        
        sectionItems[index] = descriptor
    }
}

//MARK descriptors implementation

struct SectionDescriptor: SectionTypeDescriptor {
    var sectionIndex: Int
    var title: String?
    var sectionItems: [RowTypeDescriptor]
}

struct SectionDescriptorFactory {
    static func makeDescriptor(for section: Int, title: String?, rows: [RowTypeDescriptor] ) -> SectionTypeDescriptor {
        return SectionDescriptor(sectionIndex: section, title: title, sectionItems: rows)
    }
    
}


