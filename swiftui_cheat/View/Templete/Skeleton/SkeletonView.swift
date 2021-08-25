//
//  SkeletonView
//  swiftui_cheat
//

import SwiftUI

struct SkeletonView: View {
    @State var items = [String]()
    
    var body: some View {
        List {
            Section(header: Text("normal redacted")) {
                Text("こんにちわ")
                    .redacted(reason: .placeholder)
            }

            Section(header: Text("onSkeleton")) {
                Text("こんにちわ")
                    .onSkeleton(active: self.items.isEmpty)
            }
            
            Section(header: Text("onSkeleton2 blurred")) {
                Card1()
                    .onSkeleton2(active: self.items.isEmpty, type: .blurred)
            }
            
            Section(header: Text("onSkeleton2 confidential")) {
                Card1()
                    .onSkeleton2(active: self.items.isEmpty, type: .confidential)
            }
            
            Section(header: Text("onSkeleton2 placeholder")) {
                Card1()
                    .onSkeleton2(active: self.items.isEmpty, type: .placeholder)
            }

            Section(header: Text("normal redacted")) {
                ScrollView(.horizontal){
                    HStack(spacing: 10) {
                        Card1()
                        Card1()
                        Card1()
                        Card1()
                    }
                }
                .onSkeleton(active: self.items.isEmpty)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
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
