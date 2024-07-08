//
//  AgendaRepeatMetadata+CoreDataProperties.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-07.
//
//

import Foundation
import CoreData


extension AgendaRepeatMetadata {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AgendaRepeatMetadata> {
        return NSFetchRequest<AgendaRepeatMetadata>(entityName: "AgendaRepeatMetadata")
    }

    @NSManaged public var agendaId: UUID?
    @NSManaged public var agenda_item: AgendaItem?

}

extension AgendaRepeatMetadata : Identifiable {

}
