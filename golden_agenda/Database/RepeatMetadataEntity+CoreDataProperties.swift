//
//  RepeatMetadataEntity+CoreDataProperties.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-15.
//
//

import Foundation
import CoreData


extension RepeatMetadataEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RepeatMetadataEntity> {
        return NSFetchRequest<RepeatMetadataEntity>(entityName: "RepeatMetadataEntity")
    }

    @NSManaged public var metaType: String?
    @NSManaged public var metaValue: Int16
    @NSManaged public var repeatId: UUID?
    @NSManaged public var repeatMetadataToRepeat: RepeatEntity?

}
