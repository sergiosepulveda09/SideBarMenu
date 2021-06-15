//
//  ButtonViews.swift
//  SideMenuBar
//
//  Created by Sergio Sepulveda on 2021-06-14.
//

import SwiftUI

struct ButtonViews: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        MenuButton(showMenu: $showMenu)
    }
}

struct MenuButton: View {

    @Binding var showMenu: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                showMenu.toggle()
            }
        }, label: {
            
            //Animated Drawer Button
            VStack(spacing: 5) {
                Capsule()
                    .fill(showMenu ? Color.white : Color.primary)
                    .frame(width: 30, height: 3)
                //Rotating
                    .rotationEffect(.init(degrees: showMenu ? -50 : 0))
                    .offset(x: showMenu ? 2 : 0, y: showMenu ? 9 : 0)
                
                VStack(spacing: 5) {
                    Capsule()
                        .fill(showMenu ? Color.white : Color.primary)
                        .frame(width: 30, height: 3)
                    
                    //Moving Up when clicked
                    Capsule()
                        .fill(showMenu ? Color.white : Color.primary)
                        .frame(width: 30, height: 3)
                        .offset(y: showMenu ? -8 : 0)
                }
                .rotationEffect(.init(degrees: showMenu ? 50 : 0))
            }
            
        })
    }
}

struct CustomCorners: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


struct ButtonViews_Previews: PreviewProvider {
    static var previews: some View {
        ButtonViews(showMenu: Binding.constant(false) )
    }
}
