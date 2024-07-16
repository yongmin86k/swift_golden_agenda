//
//  RepeatEntity+CoreDataProperties.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-15.
//
//

import Foundation
import CoreData


extension RepeatEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RepeatEntity> {
        return NSFetchRequest<RepeatEntity>(entityName: "RepeatEntity")
    }

    @NSManaged public var agendaId: UUID?
    @NSManaged public var startAt: Date?
    @NSManaged public var untilAt: Date?
    @NSManaged public var remintAt: Int16
    @NSManaged public var isTimeSet: Bool
    @NSManaged public var every: Int16
    @NSManaged public var frequency: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var repeatToRepeatMetadata: NSSet?
    @NSManaged public var repeatToMain: MainAgendaEntity?

}

// MARK: Generated accessors for repeatToRepeatMetadata
extension RepeatEntity {

    @objc(addRepeatToRepeatMetadataObject:)
    @NSManaged public func addToRepeatToRepeatMetadata(_ value: RepeatMetadataEntity)

    @objc(removeRepeatToRepeatMetadataObject:)
    @NSManaged public func removeFromRepeatToRepeatMetadata(_ value: RepeatMetadataEntity)

    @objc(addRepeatToRepeatMetadata:)
    @NSManaged public func addToRepeatToRepeatMetadata(_ values: NSSet)

    @objc(removeRepeatToRepeatMetadata:)
    @NSManaged public func removeFromRepeatToRepeatMetadata(_ values: NSSet)

}

extension RepeatEntity : Identifiable {

}
