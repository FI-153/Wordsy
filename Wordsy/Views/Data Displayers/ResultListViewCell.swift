//
//  ResultListViewCell.swift
//  Wordsy
//
//  Created by Federico Imberti on 31/03/22.
//

import SwiftUI

struct ResultListViewCell: View {
	var result:SavedResult
	
	var body: some View {
		VStack(alignment: .leading) {
			Text("\(result.timestamp!.formatted())")
				.font(.title2)
				.fontWeight(.medium)
			
			Text("Words/min: \(result.wordsPm)")
			Text("Chars/min: \(result.charsPm)")
			Text("Precision: \(result.precision)")
			
			Divider()
		}
	}
}
