
import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0

    var body: some View {
        TabView(selection: $selection) {
            Text("page1")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("First")
                }
                .tag(1)
            
            Text("page2")
                .tabItem {
                    Image(systemName: "favorite.fill")
                    Text("Second")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
