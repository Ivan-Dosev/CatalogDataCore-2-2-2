//
//  Rekarstvo+CoreDataProperties.swift
//  CatalogDataCore
//
//  Created by Ivan Dosev Dimitrov on 22.04.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//
//

import Foundation
import CoreData


extension Rekarstvo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Rekarstvo> {
        return NSFetchRequest<Rekarstvo>(entityName: "Rekarstvo")
    }

    @NSManaged public var id: Int16
    @NSManaged public var lekarstvo: String?
    @NSManaged public var isOnLek: Bool
    @NSManaged public var risk: String?
    @NSManaged public var proper: String?
    @NSManaged public var dasage: String?
    @NSManaged public var careful: String?
    @NSManaged public var effects: String?

}
