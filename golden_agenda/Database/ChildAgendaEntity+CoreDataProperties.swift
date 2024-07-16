//
//  ChildAgendaEntity+CoreDataProperties.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-15.
//
//

import Foundation
import CoreData


extension ChildAgendaEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ChildAgendaEntity> {
        return NSFetchRequest<ChildAgendaEntity>(entityName: "ChildAgendaEntity")
    }

    @NSManaged public var show: Bool
    @NSManaged public var status: Int16
    @NSManaged public var childId: UUID?
    @NSManaged public var childToMainAgenda: MainAgendaEntity?
    @NSManaged public var childToMetadata: MetadataEntity?

}
