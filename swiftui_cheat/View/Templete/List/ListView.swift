import SwiftUI

struct ListView: View {
    
    let items = ["ごりら", "らっぱ", "ぱん"]
    @State var listItems = ["Item 1", "Item 2", "Item 3"]
    
    var body: some View {
        
        VStack {
            // 静的に
            ListCardView()
//            List {
//                Text("item 1")
//                Text("item 2")
//                Text("item 3")
//                Text("item 4")
//                Text("item 5")
//                Text("item 6")
//            }
            
            // 動的に part1
            List {
                ForEach(0 ..< items.count) { index in
                    Text(items[index])
                }
            }
            
            // 動的にpart2
            List(items, id: \.self) { item in
                Text(item)
            }
            
            // sectionに分ける
            List {
                Section(header: Text("static　items")) {
                    Text("item 1")
                    Text("item 2")
                    Text("item 3")
                    Text("item 4")
                }
                Section(header: Text("dynamic items")) {
                    ForEach(0..<items.count) { index in
                        Text(items[index])
                    }
                }
            }
            
            List {
                Section(header: Text("items"), footer: Text("Footer")) {
                    Text("item 1")
                    Text("item 2")
                    Text("item 3")
                }
            }.listStyle(GroupedListStyle()) // スタイルつける
            
            List {
                ForEach(listItems, id: \.self) { (item) in
                    Text(item)
                }.onMove { (indexSet, index) in
                    self.listItems.move(fromOffsets: indexSet, toOffset: index)
                }
            }
        }
        .navigationBarTitle("List", displayMode:.large)
        .navigationBarItems(trailing: EditButton())

    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
