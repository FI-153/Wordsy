//
//  Modifers.swift
//  Wordsy
//
//  Created by Federico Imberti on 05/04/22.
//

import Foundation
import SwiftUI

struct CenterModifier: ViewModifier {
	func body(content: Content) -> some View {
		HStack {
			Spacer()
			content
			Spacer()
		}
	}
}
