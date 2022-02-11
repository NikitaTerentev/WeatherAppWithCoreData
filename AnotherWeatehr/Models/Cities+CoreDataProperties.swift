//
//  Cities+CoreDataProperties.swift
//  AnotherWeatehr
//
//  Created by Nikita on 18.12.2021.
//
//

import Foundation
import CoreData


extension Cities {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cities> {
        return NSFetchRequest<Cities>(entityName: "Cities")
    }

    @NSManaged public var cityName: String?
    @NSManaged public var cityTemp: Double

}

extension Cities : Identifiable {

}
