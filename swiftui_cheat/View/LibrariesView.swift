//
//  LibrariesView
//  swiftui_cheat
//

import SwiftUI

struct LibrariesView: View {
    var body: some View {
        VStack(spacing: 0) {
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
    }
}

struct LibrariesView_Previews: PreviewProvider {
    static var previews: some View {
        LibrariesView()
    }
}
