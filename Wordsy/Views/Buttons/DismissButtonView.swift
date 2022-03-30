//
//  DismissButtonView.swift
//  Wordsy
//
//  Created by Federico Imberti on 30/03/22.
//

import SwiftUI

struct DismissButtonView: View {
    var body: some View {
        Image(systemName: "x.circle.fill")
			.resizable()
			.scaledToFit()
			.frame(width: 30, height: 30)
			.foregroundColor(.bgYellow)
    }
}

struct DismissButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DismissButtonView()
    }
}
