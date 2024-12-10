//
//  CoreDataManager.swift
//  NewsApp
//
//  Created by Manpreet Gulati on 07/12/24.
//

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NewsAppModel")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func saveBookmark(title: String, subTitle: String, url: String, imageUrl: String?) {
        let bookmark = Bookmark(context: context)
        bookmark.title = title
        bookmark.subTitle = subTitle
        bookmark.url = url
        bookmark.imageUrl = imageUrl
        saveContext()
    }
    func saveContext() {
        let context = persistentContainer.viewContext
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

extension CoreDataManager {

    func fetchBookmarks() -> [Bookmark] {
        let request: NSFetchRequest<Bookmark> = Bookmark.fetchRequest()
        do {
            let results = try context.fetch(request)
            print("Fetched \(results.count) bookmarks from Core Data") // Debugging
            return results
        } catch {
            print("Failed to fetch bookmarks: \(error)")
            return []
        }
    }

}

