//
//  Page2View
//  swiftui_cheat
//

import SwiftUI

struct CustomView: View {
    var body: some View {
        VStack(spacing: 30) {

            NavigationLink(destination: ButtonView()) {
                Text("ButtonView")
            }

            NavigationLink(destination: CustomNavigationBarView()) {
                Text("CustomNavigationBarView")
            }
            
            NavigationLink(destination: CustomNavigationBarImageView()) {
                Text("CustomNavigationBarImageView")
            }
        }
        .font(.system(size: 18, weight: .bold))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(Color.materialColor(colorCode: .amber))
        .background(Color.materialColor(colorCode: .teal))
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView()
    }
}
