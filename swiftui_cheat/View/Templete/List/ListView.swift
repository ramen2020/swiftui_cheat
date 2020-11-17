import SwiftUI

struct ListView: View {
    
    let items = ["ごりら", "らっぱ", "ぱん"]

    var body: some View {
        VStack{
            // 静的に
            List {
                Text("item 1")
                Text("item 2")
                Text("item 3")
                Text("item 4")
                Text("item 5")
                Text("item 6")
            }
            
            Spacer()
            
            // 動的に
            List {
                 ForEach(0 ..< items.count) { index in
                     Text(items[index])
                 }
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
