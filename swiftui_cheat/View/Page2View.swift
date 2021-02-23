//
//  Page2View
//  swiftui_cheat
//

import SwiftUI

struct Page2View: View {
    var body: some View {
        VStack(spacing: 30) {
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

struct Page2View_Previews: PreviewProvider {
    static var previews: some View {
        Page2View()
    }
}
