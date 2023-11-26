//
//  PersistanceManager.swift
//  Wordsy
//
//  Created by Federico Imberti on 25/03/22.
//

import Foundation
import CoreData

class PersistanceManager{
	
	private static var shared = PersistanceManager()
	private var db:NSPersistentContainer
	private var context:NSManagedObjectContext

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
    
    func getContext() -> NSManagedObjectContext {
        context
    }
	
	private func save(completion: @escaping(Error?) -> () = {_ in}) {
		if context.hasChanges {
			do{
				try context.save()
				completion(nil)
			} catch let error {
				print(error.localizedDescription)
			}
		}
	}
	
	private func delete(_ object:NSManagedObject, completion: @escaping(Error?) -> () = {_ in}){
		context.delete(object)
		self.save(completion: completion)
	}
	
	//MARK: - PLEASE REFACTOR ME...
	func deleteAll(completion: @escaping(Error?) -> () = {_ in}) {
		// Get a reference to a NSPersistentStoreCoordinator
		let storeContainer =
		db.persistentStoreCoordinator
		
		// Delete each existing persistent store
		do {
			for store in storeContainer.persistentStores {
				try storeContainer.destroyPersistentStore(
					at: store.url!,
					ofType: store.type,
					options: nil
				)
			}
		} catch let error {
			print(error.localizedDescription)
		}
		
		// Re-create the persistent container
		db = NSPersistentContainer(
			name: "Results" // the name of
			// a .xcdatamodeld file
		)

		// Calling loadPersistentStores will re-create the
		// persistent stores
		db.loadPersistentStores { (_, error) in
			guard error == nil else {
				fatalError("Impossible to load persistant store")
			}
		}
		
		context = db.viewContext
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
