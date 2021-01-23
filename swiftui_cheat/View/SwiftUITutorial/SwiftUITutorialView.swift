//
//  SwiftUITutorialView
//  swiftui_cheat
//

import SwiftUI

struct SwiftUITutorialView: View {
    var body: some View {
        VStack(spacing: 30) {
            NavigationLink(destination: HandlingUserInputView()) {
                Text("HandlingUserInputView")
            }
            
//            NavigationLink(destination: SwiftUIXView()) {
//                Text("SwiftUIXView")
//            }
//            
//            NavigationLink(destination: QGridView()) {
//                Text("QGridView")
//            }
//
//            NavigationLink(destination: LottiePlacticeView()) {
//                Text("LottiePlacticeView")
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

struct SwiftUITutorialView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITutorialView()
    }
}
