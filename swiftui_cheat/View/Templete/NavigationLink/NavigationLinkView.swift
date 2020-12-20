//
//  NavigationLinkView
//  swiftui_cheat
//

import SwiftUI

struct NavigationLinkView: View {
    
    var body: some View {
        VStack(spacing: 30) {
            NavigationLinkCell(title: "test1", destination: NavigationLink1View())
            NavigationLinkCell(title: "test2", destination: NavigationLink2View())
            NavigationLinkCell(title: "test3", destination: NavigationLink3View())
        }
    }
}

struct NavigationLink1View: View {
    var body: some View {
        Text("NavigationLink1View")
    }
}

struct NavigationLink2View: View {
    var body: some View {
        Text("NavigationLink2View")
    }
}

struct NavigationLink3View: View {
    var body: some View {
        Text("NavigationLink3View")
    }
}

struct NavigationLinkCell<Destination : View>: View {

    let title: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
        }
    }
}

struct NavigationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkView()
    }
}
