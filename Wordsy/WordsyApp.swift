//
//  WordsyApp.swift
//  Wordsy
//
//  Created by Federico Imberti on 16/03/22.
//

import SwiftUI

@main
struct WordsyApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
				.frame(width: 1000, height: 700, alignment: .center)
				.preferredColorScheme(.light)
        }
    }
}
