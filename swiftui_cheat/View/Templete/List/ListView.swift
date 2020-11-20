import SwiftUI

struct ListView: View {
    
    let items = ["ごりら", "らっぱ", "ぱん"]
    
    var body: some View {
        
        VStack {
            // 静的に
            List {
                Text("item 1")
                Text("item 2")
                Text("item 3")
                Text("item 4")
                Text("item 5")
                Text("item 6")
            }
            
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
            
        }
        .navigationBarTitle("List", displayMode:.large)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
