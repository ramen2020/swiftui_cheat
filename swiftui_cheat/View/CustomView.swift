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
            
            NavigationLink(destination: SkeletonView()) {
                Text("SkeletonView")
            }
        }
        .font(.system(size: 18, weight: .bold))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(Color.materialColor(colorCode: .amber))
        .background(Color.materialColor(colorCode: .teal))
    }
}

struct SkeletonView: View {
    @State var items = [String]()
    
    var body: some View {
        VStack {
            Text("こんにちわ")
                .redacted(reason: .placeholder)

            Text("こんにちわ")
                .onSkeleton(active: self.items.isEmpty)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.items = ["こんばんわ", "やっほ", "おはよう", "こんばんわ"]
            }
        }
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView()
    }
}
