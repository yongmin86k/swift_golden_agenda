//
//  CategoryEntity+CoreDataProperties.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-15.
//
//

import Foundation
import CoreData


extension CategoryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryEntity> {
        return NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var order: Int16
    @NSManaged public var categoryToMain: MainAgendaEntity?

}

extension CategoryEntity : Identifiable {

}
