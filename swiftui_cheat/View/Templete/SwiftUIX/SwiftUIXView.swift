//
//  SwiftUIXView
//  swiftui_cheat
//

import SwiftUI
import SwiftUIX

struct SwiftUIXView: View {
    
    @State var inputText: String?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ActivityIndicator()
                    .frame(width: 50, height: 50)
                    .background(Color.materialColor(colorCode: .orange))
                
                PaginationView(axis: .horizontal, transitionStyle: .scroll, showsIndicators: true, content: {
                    ForEach(Range(0...5)) { index in
                        Text("スライドショー No.\(index)")
                            .font(.system(size: 30, weight: .bold))
                    }
                })
                .frame(height: 200)
                .background(Color.materialColor(colorCode: .orange))
                .currentPageIndicatorTintColor(.primary)
                
                SearchBar("検索してください", text: $inputText)
                    .background(Color.materialColor(colorCode: .orange))

            }
        }
        .padding(.vertical, 50)
        .font(.system(size: 18, weight: .bold))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(Color.materialColor(colorCode: .deepOrange))
        .background(Color.materialColor(colorCode: .deepPurple))
        .navigationBarTitleView(Image(systemName:"house"), displayMode: .inline)
        .navigationSearchBar {
            SearchBar("検索 bar", text: $inputText)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SwiftUIXView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIXView()
    }
}
