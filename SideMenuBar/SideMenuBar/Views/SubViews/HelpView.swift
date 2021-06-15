//
//  HelpView.swift
//  SideMenuBar
//
//  Created by Sergio Sepulveda on 2021-06-14.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                Text("help")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
                    .navigationTitle("Help")
            }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
