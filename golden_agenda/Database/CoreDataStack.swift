//
//  CoreDataStack.swift
//  golden_agenda
//
//  Created by Yongmin Kim on 2024-07-15.
//  Ref: https://developer.apple.com/documentation/coredata
//  Ref: https://github.com/SwiftfulThinking/SwiftUI-Continued-Learning
//  Ref: https://www.youtube.com/watch?v=huRKU-TAD3g

import CoreData

// Define an observable class to encapsulate all Core Data-related functionality.
class CoreDataStack: ObservableObject {
    static let shared = CoreDataStack()
    
    @Published var categories: [CategoryEntity] = []
    
    // Create a persistent container as a lazy variable to defer instantiation until its first use.
    lazy var persistentContainer: NSPersistentContainer = {
        // Pass the data model filename to the container’s initializer.
        let container = NSPersistentContainer(name: "GoldenAgendaModels")
        
        // Load any persistent stores, which creates a store if none exists.
        container.loadPersistentStores { _, error in
            if let error {
                // Handle the error appropriately. However, it's useful to use
                // `fatalError(_:file:line:)` during development.
                fatalError("Failed to load persistent stores: \(error.localizedDescription)")
            }
        }
        
        return container
    }()
        
    private init() {
        addFirstCategory()
    }
    
    func getCategories() {
        let request = NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
        
        let sort = NSSortDescriptor(keyPath: \CategoryEntity.order, ascending: true)
        request.sortDescriptors = [sort]
        
        do {
            categories = try persistentContainer.viewContext.fetch(request)
            
            // print("Categories: \(categories.count)")
        } catch {
            print("Error fetching. \(error.localizedDescription)")
        }
    }

    func addCategory(title: String, order: Int) {
        let newCategory = CategoryEntity(context: persistentContainer.viewContext)
        newCategory.id = UUID()
        newCategory.title = title
        newCategory.order = Int16(order) // TODO: Increment the order as added
        
        save()

        getCategories()
    }
    
    // Ref: https://www.advancedswift.com/batch-delete-everything-core-data-swift/
    func deleteAllCategories() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "CategoryEntity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try persistentContainer.viewContext.execute(deleteRequest)
            save()
            
            categories.removeAll()
        } catch {
            print("Error excuting. \(error.localizedDescription)")
        }
    }
    
    private func addFirstCategory() {
        getCategories()
        
        if categories.count == 0 {
            addCategory(title: "Uncategorized", order: 0)
        }
    }
    
    func save() {
        do {
            try persistentContainer.viewContext.save()
            print("Saved successfully!")
        } catch {
            print("Error saving Core Data. \(error.localizedDescription)")
        }
    }
}
