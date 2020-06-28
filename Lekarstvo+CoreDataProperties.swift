//
//  Lekarstvo+CoreDataProperties.swift
//  CatalogDataCore
//
//  Created by Ivan Dosev Dimitrov on 28.03.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//
//

import Foundation
import CoreData


extension Lekarstvo { 

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lekarstvo> {
        return NSFetchRequest<Lekarstvo>(entityName: "Lekarstvo")
    }

    @NSManaged public var id: Int32
    @NSManaged public var kgPazient: Int32
    @NSManaged public var goPazient: Int32
    @NSManaged public var fromMin: Float
    @NSManaged public var toMin: Float
    @NSManaged public var fromMax: Float
    @NSManaged public var toMax: Float
    @NSManaged public var isMin: Bool
    @NSManaged public var isMax: Bool
    @NSManaged public var mjarka: String?
    @NSManaged public var maxDoza: Float
    @NSManaged public var firstDoza: Float
    @NSManaged public var priemI: Int32
    @NSManaged public var priemII: Int32
    @NSManaged public var opis: String?
    @NSManaged public var lekarstvo: String?
    @NSManaged public var grupa: String?

}
