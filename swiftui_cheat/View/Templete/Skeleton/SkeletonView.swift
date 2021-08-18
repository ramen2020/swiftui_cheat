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
