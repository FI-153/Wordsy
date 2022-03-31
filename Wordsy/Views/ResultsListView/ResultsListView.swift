//
//  ResultsListView.swift
//  Wordsy
//
//  Created by Federico Imberti on 31/03/22.
//

import SwiftUI

struct ResultsListView: View {
	@StateObject var vm = ResultsListViewModel()
	
    var body: some View {
		VStack {
			Text("Results")
			
			List{
				ForEach(vm.fetchedResults) { result in
					ResultListViewCell(result: result)
						.padding()
				}
			}
			.listStyle(.plain)
		}
		.frame(width: 300)
    }
}

class ResultsListViewModel:ObservableObject {
	var db:PersistanceManager = PersistanceManager.getShared()
	
	@Published var fetchedResults:[SavedResult] = []
	
	init(){
		fetchAllSavedResults()
	}
	
	func fetchAllSavedResults(){
		let request = NSFetchRequest<SavedResult>(entityName: "SavedResult")
		
		do {
			fetchedResults = try db.context.fetch(request)
		} catch let error {
			print(error.localizedDescription)
		}
	}
}

struct ResultsListView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsListView()
			.preferredColorScheme(.light)
    }
}
