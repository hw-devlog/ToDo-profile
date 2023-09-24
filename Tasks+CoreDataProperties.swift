//
//  Tasks+CoreDataProperties.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/09/24.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var section: String?
    @NSManaged public var iscompleted: Bool

}

extension Tasks : Identifiable {

}
