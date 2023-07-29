//
//  PersistentStorage.swift
//  CoreDataDemo
//
//  Created by Swapnil on 26/07/23.
//

import Foundation
import CoreData

final class PersistentStorage {
    // MARK: - Core Data stack
    static let shared: PersistentStorage = PersistentStorage()

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    private init() {}

    // MARK: - Core Data Saving support

    lazy var context = persistentContainer.viewContext

    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
