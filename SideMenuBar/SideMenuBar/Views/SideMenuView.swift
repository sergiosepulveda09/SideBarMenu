//  Created by Sergio Sepulveda on 2021-06-14.
//

import SwiftUI

struct SideMenuView: View {
    @Namespace var animation
    @Binding var selectedTab: String

    var body: some View {
        //Profile Picture
        VStack(alignment: .leading, spacing: 15){
            Image("Bulbasaur")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 4)
                .padding(.top, 50)
            VStack(alignment: .leading, spacing: 6) {
                Text("Sergio \nSepulveda")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Button(action: {
                    
                }, label: {
                    Text("View Profile")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .opacity(0.7)
                })
            }
            VStack(alignment: .leading, spacing: 10) {
                TabButtonView(image: "house", title: "Home", animation: animation, selectedTab: $selectedTab)
                TabButtonView(image: "clock.arrow.circlepath", title: "History", animation: animation, selectedTab: $selectedTab)
                TabButtonView(image: "bell.badge", title: "Notifications", animation: animation, selectedTab: $selectedTab)
                TabButtonView(image: "gearshape", title: "Settings", animation: animation, selectedTab: $selectedTab)
                TabButtonView(image: "questionmark.circle", title: "Help", animation: animation, selectedTab: $selectedTab)
            }
            .padding(.leading, -15)
            .padding(.top, 50)
            Spacer()
            VStack(alignment: .leading, spacing: 6) {
                
                //Sign Out Button
                TabButtonView(image: "rectangle.righthalf.inset.fill.arrow.right", title: "Log Out", animation: animation, selectedTab: .constant(""))
                    .padding(.leading, -15)
                
                Text("App Version 1.2.4")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .opacity(0.6)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
}

struct TabButtonView: View {
    
    var image: String
    var title: String
    var animation: Namespace.ID
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) { selectedTab = title }
        }, label: {
            HStack(spacing: 15) {
                Image(systemName: image)
                    .font(.title2)
                    .frame(width: 30)
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(selectedTab == title ? Color("BackgroundColor") : .white)
            .padding(.vertical, 12)
            .padding(.horizontal, 10)
            .frame(maxWidth: UIScreen.main.bounds.width - 170, alignment: .leading)
            .background(
                ZStack {
                    if selectedTab == title {
                        Color.white
                            .opacity(selectedTab == title ? 1 : 0)
                            .clipShape(CustomCorners(corners: [.topRight, .bottomRight], radius: 12))
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                }
            )
            
        })
    }
}
struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
