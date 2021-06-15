//
//  ViewsInterface.swift
//  SideMenuBar
//
//  Created by Sergio Sepulveda on 2021-06-14.
//

import SwiftUI

struct ViewsInterface: View {
    //Selected Tab
    @Binding var selectedTab: String
    @Binding var showMenu: Bool
    
    //Hide the tab bar on the bottom
    init(selectedTab: Binding<String>, showMenu: Binding<Bool>) {
        self._selectedTab = selectedTab
        self._showMenu = showMenu
        UITabBar.appearance().isHidden = true
        
    }
    
    var body: some View {
        ZStack {
            WhiteCards(showMenu: $showMenu)
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag("Home")
                HistoryView()
                    .tag("History")
                NotificationView()
                    .tag("Notifications")
                SettingsView()
                    .tag("Settings")
                HelpView()
                    .tag("Help")
            }
            .cornerRadius(showMenu ? 30 : 0)
            
        }
        .scaleEffect(showMenu ? 0.84 : 1)
        .offset(x: showMenu ? UIScreen.main.bounds.width - 120 : 0)
        .ignoresSafeArea()
        .overlay(
            ButtonViews(showMenu: $showMenu)
                .padding()
            ,alignment: .topLeading
        )
    }
}

struct WhiteCards: View {
    @Binding var showMenu: Bool
    var body: some View {
        Color.white
            .opacity(0.5)
            .cornerRadius(showMenu ? 30 : 0)
            .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5)
            .offset(x: showMenu ? -25 : 0)
            .padding(.vertical, 30)
        Color.white
            .opacity(0.4)
            .cornerRadius(showMenu ? 30: 0)
            .shadow(color: Color.black.opacity(0.07), radius: 5, x: -5)
            .offset(x: showMenu ? -50 : 0)
            .padding(.vertical, 60)
    }
}

struct ViewsInterface_Previews: PreviewProvider {
    static var previews: some View {
        ViewsInterface(selectedTab: Binding.constant("Home"), showMenu: Binding.constant(false))
    }
}
