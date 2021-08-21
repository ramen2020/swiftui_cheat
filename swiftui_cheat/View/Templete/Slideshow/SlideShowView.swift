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

            SlideShowImage()
            
            Spacer().frame(height: 50)
        }
    }
}


struct SlideShowImage: View {
    
    @State private var selection = 0
    
    var body: some View {
        VStack(spacing: 0){
            TabView(selection: $selection) {
                ForEach(Range(0...4)) { index in
                    Image("ramen7")
                        .resizable()
                        .scaledToFit()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 300)
            .frame(maxWidth: .infinity)

            HStack {
                ForEach(0..<4) { num in
                    Circle()
                        .fill(num == selection ? Color.green : Color.gray)
                        .frame(width: 8, height: 8)
                        .id(num)
                        .tag(num)
                        .onTapGesture(perform: {
                            withAnimation {
                                selection = num
                            }
                        })
                }
            }.frame(maxWidth: .infinity, alignment: .center)
        }
    }
}


struct SlideShowView_Previews: PreviewProvider {
    static var previews: some View {
        SlideShowView()
    }
}
