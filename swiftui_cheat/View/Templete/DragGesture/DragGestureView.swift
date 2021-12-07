//
//  DragGestureView
//  swiftui_cheat
//

import SwiftUI

struct DragGestureView: View {
    @State var hidden: Bool = false
    @GestureState private var dragOffset: CGSize = .zero

    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(title: "DragGestureView", isReturn: true)
                .offset(y: hidden ? -100 : 0)
            ScrollView {
                VStack(spacing: 100) {
                    Text("こんにちわ")
                    Text("こんにちわ")
                    Text("こんにちわ")
                    Text("こんにちわ")
                    Text("こんにちわ")
                    Text("こんにちわ")
                    Text("こんにちわ")
                    Text("こんにちわ")
                    Text("こんにちわ")
                }
                .frame(maxWidth: .infinity)
            }

            CustomNavigationBar(title: "", isReturn: false)
                .offset(y: hidden ? 100 : 0)
        }
        // MARK: scrollview内だと、ドラッグジェスチャーは機能しない。。。サブビューの追跡をキャンセルするから。
        // https://developer.apple.com/forums/thread/655465
            .gesture(
            DragGesture()
                .onChanged { value in
                // ドラッグ中の処理
                print("startLocation: \(value.startLocation)")
                print("location: \(value.location)")
                print("translation: \(value.translation)")

                if value.startLocation.y < value.location.y {
                    withAnimation(Animation.linear(duration: 0.2)) {
                        self.hidden = false
                    }
                } else {
                    withAnimation(Animation.linear(duration: 0.2)) {
                        self.hidden = true
                    }
                }
            }
        )
        .ignoresSafeArea(.all)
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}



struct DragGestureView_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureView()
    }
}
