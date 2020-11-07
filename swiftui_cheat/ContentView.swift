
import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                NavigationLink(destination: AlerView()) {
                    Text("page1")
                }
                    .tabItem {
                        Image(systemName: "person.crop.circle.fill")
                        Text("First")
                    }
                    .tag(1)
                
                Text("page2")
                    .tabItem {
                        Image(systemName: "bolt.square.fill")
                        Text("Second")
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
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
