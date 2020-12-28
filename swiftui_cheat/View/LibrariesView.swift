//
//  LibrariesView
//  swiftui_cheat
//

import SwiftUI

struct LibrariesView: View {
    var body: some View {
        VStack(spacing: 30) {
            NavigationLink(destination: PopUpView()) {
                Text("PopUpView")
            }
            
            NavigationLink(destination: SwiftUIXView()) {
                Text("SwiftUIXView")
            }
//
//            NavigationLink(destination: CardView()) {
//                Text("Card")
//            }

//            NavigationLink(destination: ListView()) {
//                Text("List")
//            }
        }
        .font(.system(size: 18, weight: .bold))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(Color.materialColor(colorCode: .amber))
        .background(Color.materialColor(colorCode: .blue))
    }
}

struct LibrariesView_Previews: PreviewProvider {
    static var previews: some View {
        LibrariesView()
    }
}
