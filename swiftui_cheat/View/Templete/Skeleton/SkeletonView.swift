//
//  SkeletonView
//  swiftui_cheat
//

import SwiftUI

struct SkeletonView: View {
    @State var items = [String]()
    
    var body: some View {
        VStack {
            Text("こんにちわ")
                .redacted(reason: .placeholder)

            Text("こんにちわ")
                .onSkeleton(active: self.items.isEmpty)
            
            Card1()
                .onSkeleton2(active: self.items.isEmpty, type: .blurred)
            
            Card1()
                .onSkeleton2(active: self.items.isEmpty, type: .confidential)
            
            Card1()
                .onSkeleton2(active: self.items.isEmpty, type: .placeholder)

            VStack {
                Card1()
            }.onSkeleton(active: self.items.isEmpty)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.items = ["こんばんわ", "やっほ", "おはよう", "こんばんわ"]
            }
        }
    }
}
struct SkeletonView_Previews: PreviewProvider {
    static var previews: some View {
        SkeletonView()
    }
}
