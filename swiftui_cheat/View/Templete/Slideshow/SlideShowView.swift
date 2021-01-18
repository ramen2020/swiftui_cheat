//
//  SlideShowView
//  swiftui_cheat
//

import SwiftUI
import SwiftUIX

struct SlideShowView: View {
    var body: some View {
        ScrollView {
            Spacer().frame(height: 50)
            VStack(spacing: 50) {
                PaginationView(axis: .horizontal, transitionStyle: .scroll, showsIndicators: true, content: {
                    ForEach(Range(0...5)) { index in
                        Text("スライドショー No.\(index)")
                            .font(.system(size: 30, weight: .bold))
                    }
                })
                .frame(height: 200)
                .background(Color.materialColor(colorCode: .orange))
                .currentPageIndicatorTintColor(.primary)
            }
        }
    }
}

struct SlideShowView_Previews: PreviewProvider {
    static var previews: some View {
        SlideShowView()
    }
}
