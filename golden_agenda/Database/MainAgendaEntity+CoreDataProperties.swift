//
//  MainAgendaEntity+CoreDataProperties.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-15.
//
//

import Foundation
import CoreData


extension MainAgendaEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MainAgendaEntity> {
        return NSFetchRequest<MainAgendaEntity>(entityName: "MainAgendaEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var pointEarned: Int16
    @NSManaged public var pointLost: Int16
    @NSManaged public var detail: String?
    @NSManaged public var location: String?
    @NSManaged public var mainToChildAgenda: NSSet?
    @NSManaged public var mainToCategory: CategoryEntity?
    @NSManaged public var mainToMetadata: MetadataEntity?
    @NSManaged public var mainToRepeat: RepeatEntity?

}

// MARK: Generated accessors for mainToChildAgenda
extension MainAgendaEntity {

    @objc(addMainToChildAgendaObject:)
    @NSManaged public func addToMainToChildAgenda(_ value: ChildAgendaEntity)

    @objc(removeMainToChildAgendaObject:)
    @NSManaged public func removeFromMainToChildAgenda(_ value: ChildAgendaEntity)

    @objc(addMainToChildAgenda:)
    @NSManaged public func addToMainToChildAgenda(_ values: NSSet)

    @objc(removeMainToChildAgenda:)
    @NSManaged public func removeFromMainToChildAgenda(_ values: NSSet)

}

extension MainAgendaEntity : Identifiable {

}
