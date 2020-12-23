
import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    init(){
        // NavigationBarの背景色の設定
        UINavigationBar.appearance().barTintColor = UIColor(Color.materialColor(colorCode: .teal))
        // TabViewの背景色の設定
        UITabBar.appearance().barTintColor = UIColor(Color.materialColor(colorCode: .teal))
        
        // 選択されていないアイテムの色
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.materialColor(colorCode: .brown))
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
                
                Text("page3")
                    .tabItem {
                        Image(systemName: "link.circle.fill")
                        Text("Third")
                    }
                    .tag(3)
                
                Text("page4")
                    .tabItem {
                        Image(systemName: "play.rectangle.fill")
                        Text("Forth")
                    }
                    .tag(4)
            }.accentColor(Color.materialColor(colorCode: .amber))
            .navigationBarTitle("Swiftui_cheat", displayMode: .inline)
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
