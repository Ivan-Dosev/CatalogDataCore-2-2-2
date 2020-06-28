//
//  Becarstvo+CoreDataProperties.swift
//  CatalogDataCore
//
//  Created by Ivan Dosev Dimitrov on 30.03.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//
//

import Foundation
import CoreData


extension Becarstvo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Becarstvo> {
        return NSFetchRequest<Becarstvo>(entityName: "Becarstvo")
    }

    @NSManaged public var id: Int32
    @NSManaged public var nameLecarstvo: String?
    @NSManaged public var nameFirm: String?
    @NSManaged public var vidove: String?
    @NSManaged public var optinal: String?

}
