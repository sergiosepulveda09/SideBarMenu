//
//  HomeView.swift
//  SideMenuBar
//
//  Created by Sergio Sepulveda on 2021-06-14.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    Image("Bulbasaur")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 400)
                        .cornerRadius(20)
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text("Sergio Sepulveda")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Text("Sergio, Youtuber, Programmer")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Home Page")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
