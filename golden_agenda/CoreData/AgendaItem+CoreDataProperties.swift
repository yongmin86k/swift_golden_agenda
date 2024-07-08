//
//  AgendaItem+CoreDataProperties.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-07.
//
//

import Foundation
import CoreData


extension AgendaItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AgendaItem> {
        return NSFetchRequest<AgendaItem>(entityName: "AgendaItem")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var reward: Double
    @NSManaged public var penalty: Double
    @NSManaged public var cateogry: String?
    @NSManaged public var desc: String?
    @NSManaged public var location: String?
    @NSManaged public var shouldRepeat: Bool
    @NSManaged public var status: String?
    @NSManaged public var createdDate: Date?
    @NSManaged public var updatedDate: Date?
    @NSManaged public var deletedDate: Date?
    @NSManaged public var archivedDate: Date?
    @NSManaged public var order: Int16
    @NSManaged public var agenda_repeat_metadata: AgendaRepeatMetadata?

}

extension AgendaItem : Identifiable {

}
