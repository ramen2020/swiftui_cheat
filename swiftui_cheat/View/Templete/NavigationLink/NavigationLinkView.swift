//
//  NavigationLinkView
//  swiftui_cheat
//

import SwiftUI

struct NavigationLinkView: View {
    
    var body: some View {
        VStack(spacing: 30) {
            NavigationLinkCell(title: "home", destination: HomeView())
            NavigationLinkCell(title: "favorite", destination: FavoriteView())
            NavigationLinkCell(title: "test", destination: TestView())
        }
    }
}

struct NavigationLinkCell<Destination : View>: View{

    let title: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
        }
    }
}

struct HomeView: View {
    var body: some View {
        Text("HomeView")
    }
}

struct FavoriteView: View {
    var body: some View {
        Text("FavoriteView")
    }
}

struct TestView: View {
    var body: some View {
        Text("TestView")
    }
}




struct NavigationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkView()
    }
}
