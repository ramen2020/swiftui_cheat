import SwiftUI

struct ListView: View {
    var body: some View {
        VStack{
            List {
                Text("item 1")
                Text("item 2")
                Text("item 3")
                Text("item 4")
                Text("item 5")
                Text("item 6")
            }
        }
        .navigationBarTitle("List")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
