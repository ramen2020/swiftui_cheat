//
//  SwiftUIXView
//  swiftui_cheat
//
//  既存のSwiftにはあるが、SwiftUIはないviewを補ってくれるライブラリ。
//

import SwiftUI
import SwiftUIX

struct SwiftUIXView: View {
    
    @State var inputText: String?
    @State var text: String?
    
    var body: some View {
        ScrollView {
            Spacer().frame(height: 50)
            VStack(spacing: 50) {
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
                
                LinkPresentationView(url: URL(string: "https://github.com/SwiftUIX/SwiftUIX")!)
                    .frame(height: 100)
                
                  
                CircularProgressBar(0.5)
                    .lineWidth(5)
                    .foregroundColor(Color.materialColor(colorCode: .deepOrange))
                    .frame(height: 100)
                
                LinearProgressBar(0.3)
                    .foregroundColor(Color.materialColor(colorCode: .deepOrange))
                    .frame(height: 15)
                    .padding(.horizontal, 50)
                
                VStack{
                    TextView("placeholder text", text: $text, onEditingChanged: { editing in
                        print(editing)
                    })
                }
                .frame(height: 200)
                .background(.white)

                
                Spacer().frame(height: 500)
//                CocoaList()
//                CocoaScrollView()
//                CollectionView()
//                TextView()

            }
        }
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
