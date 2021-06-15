//
//  ContentView.swift
//  SideMenuBar
//
//  Created by Sergio Sepulveda on 2021-06-14.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedBar: String = "Home"
    @State var showMenu: Bool = false
    @State private var offset = CGSize.zero
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                SideMenuView(selectedTab: $selectedBar)
            }
            ViewsInterface(selectedTab: $selectedBar, showMenu: $showMenu)


        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
