//
//  CoreDataManagerr.swift
//  AnotherWeatehr
//
//  Created by Nikita on 18.12.2021.
//

import UIKit
import CoreData


final class CoreDataManager {
    
    let context: NSManagedObjectContext
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
        
        
    }

    func saveCity(cityName: String, temp: Double) {
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Cities", in: context) else { return }
        
        let cityObject = Cities(entity: entity, insertInto: context)
        cityObject.cityName = cityName // how to make it cellsFrom.cityLabel
        cityObject.cityTemp = temp
        
        do {
            try context.save()
        } catch {
            print((error as NSError).localizedDescription)
        }
    }


    func deleteCity() {

        let fetchRequest: NSFetchRequest<Cities> = Cities.fetchRequest()

        if let cities = try? context.fetch(fetchRequest) {
            for city in cities {
                context.delete(city)
            }
        }

        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func fetch() -> [Weather] {

        let fetchRequest: NSFetchRequest<Cities> = Cities.fetchRequest()
        
        do {
            let cities = try context.fetch(fetchRequest)
            return cities.map({Weather(name: $0.cityName ?? "", temp: $0.cityTemp)})
        } catch  {
            return []
        }
    }
}
