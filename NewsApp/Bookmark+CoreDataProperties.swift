//
//  Bookmark+CoreDataProperties.swift
//  NewsApp
//
//  Created by Manpreet Gulati on 07/12/24.
//
//

import Foundation
import CoreData


extension Bookmark {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bookmark> {
        return NSFetchRequest<Bookmark>(entityName: "Bookmark")
    }

    @NSManaged public var title: String?
    @NSManaged public var subTitle: String?
    @NSManaged public var url: String?
    @NSManaged public var imageUrl: String?

}

extension Bookmark : Identifiable {

}
