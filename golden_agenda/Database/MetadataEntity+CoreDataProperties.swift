//
//  MetadataEntity+CoreDataProperties.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-15.
//
//

import Foundation
import CoreData


extension MetadataEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MetadataEntity> {
        return NSFetchRequest<MetadataEntity>(entityName: "MetadataEntity")
    }

    @NSManaged public var agendaId: UUID?
    @NSManaged public var completedDate: Date?
    @NSManaged public var createdDate: Date?
    @NSManaged public var deletedDate: Date?
    @NSManaged public var lastModifiedDate: Date?
    @NSManaged public var metadataToMain: MainAgendaEntity?
    @NSManaged public var metadataToChild: ChildAgendaEntity?

}

extension MetadataEntity : Identifiable {

}
