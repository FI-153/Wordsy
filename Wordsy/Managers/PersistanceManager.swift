//
//  PersistanceManager.swift
//  Wordsy
//
//  Created by Federico Imberti on 25/03/22.
//

import Foundation
import CoreData

class PersistanceManager{
	
	static let shared = PersistanceManager()
	let db:NSPersistentContainer
	let context:NSManagedObjectContext

	private init(){
		db = NSPersistentContainer(name: "Results")
		db.loadPersistentStores { (_, error) in
			guard error == nil else {
				fatalError("Impossible to load persistant store")
			}
		}
		context = db.viewContext
	}
	
	static func getShared() -> PersistanceManager{
		return shared
	}
	
	func save(completion: @escaping(Error?) -> () = {_ in}) {
		if context.hasChanges {
			do{
				try context.save()
				completion(nil)
			} catch let error {
				print(error.localizedDescription)
			}
		}
	}
	
	func delete(_ object:NSManagedObject, completion: @escaping(Error?) -> () = {_ in}){
		context.delete(object)
		self.save(completion: completion)
	}
	
	func add(_ resultToBeSaved:TestResult){
		
		let item = SavedResult(context: context)
		item.id = resultToBeSaved.id
		item.timestamp = resultToBeSaved.timestamp
		item.wordsPm = Int16(resultToBeSaved.wordsPm)
		item.charsPm = Int16(resultToBeSaved.charsPm)
		item.precision = Int16(resultToBeSaved.precision)
		
		self.save()
	}
	
	
	
}
