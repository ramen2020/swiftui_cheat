//
//  LibrariesView
//  swiftui_cheat
//

import SwiftUI

struct LibrariesView: View {
    var body: some View {
        VStack{
            NavigationLink(destination: PopUpView()) {
                Text("PopUpView")
            }
            
            Spacer().frame(height: 30)
//
//            NavigationLink(destination: CardView()) {
//                Text("Card")
//            }
//
//            Spacer().frame(height: 30)
//
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
