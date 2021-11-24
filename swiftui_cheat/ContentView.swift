
import SwiftUI
import PartialSheet

struct ContentView: View {
    
    @State private var selection = 0
    
    init(){
        // NavigationBarの背景色の設定
        UINavigationBar.appearance().barTintColor = UIColor(Color.black)
        // itemの色
        UINavigationBar.appearance().tintColor = UIColor(Color.materialColor(colorCode: .amber))
        // titleの色
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.materialColor(colorCode: .amber))]
        // TabViewの背景色の設定
        UITabBar.appearance().barTintColor = UIColor(Color.black)
        // 選択されていないアイテムの色
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.materialColor(colorCode: .teal))
    }

    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                Page1View()
                    .tabItem {
                        Image(systemName: "person.crop.circle.fill")
                        Text("First")
                    }
                    .tag(1)
                
                LibrariesView()
                    .tabItem {
                        Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                        Text("Libraries")

                    }
                    .tag(2)
                
                Spacer()
                
                SwiftUITutorialView()
                    .tabItem {
                        Image(systemName: "link.circle.fill")
                        Text("Tutorial")
                    }
                    .tag(3)
                
                CustomView()
                    .tabItem {
                        Image(systemName: "play.rectangle.fill")
                        Text("Forth")
                    }
                    .tag(4)
            }
            .accentColor(Color.materialColor(colorCode: .amber))
            .overlay(
                Button {

                } label: {
                    Image(systemName: "envelope.circle.fill")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 72, height: 72)
                        .background(Color.materialColor(colorCode: .yellow))
                        .cornerRadius(36)
                        .border(Color.materialColor(colorCode: .yellow), width: 1, cornerRadius: 36)
                }, alignment: .bottom
            )
            .navigationTitle("Swiftui_cheat")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                print("左のボタンが押されました。")
            }, label: {
                Image(systemName: "32.circle.fill")
            }), trailing: HStack {
                Button(action: {
                    print("右のボタン１が押されました。")
                }, label: {
                    Image(systemName: "play.circle.fill")
                })
                Button(action: {
                    print("右のボタン２が押されました。")
                }, label: {
                    Image(systemName: "r.circle.fill")
                })
            })
            .addPartialSheet(style:
                PartialSheetStyle(
                    background: .solid(Color(UIColor.tertiarySystemBackground)),
                    handlerBarStyle: .none,
                    iPadCloseButtonColor: .clear,
                    enableCover: true,
                    coverColor: Color(red: 0, green: 0, blue: 0, opacity: 0.6),
                    blurEffectStyle: nil, // UIBlurEffect.Style(rawValue: 2)
                    cornerRadius: 10,
                    minTopDistance: 300
                )
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
