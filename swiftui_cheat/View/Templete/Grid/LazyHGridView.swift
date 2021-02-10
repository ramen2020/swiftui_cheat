//
//  LazyHGridView
//  swiftui_cheat
//

import SwiftUI

struct LazyHGridView: View {
    
    let stubDatas: [GridStruct] = [
        GridStruct(id: 1, title: "お知らせ", subTitle: "誕生日です。", imageName: "animal_arupaka"),
        GridStruct(id: 2, title: "イベント情報", subTitle: "半額セール！", imageName: "animal_buta"),
        GridStruct(id: 3, title: "キャンペーン", subTitle: "友達割引！！", imageName: "animal_neko"),
        GridStruct(id: 4, title: "お知らせ", subTitle: "バーゲン！", imageName: "animal_penguin")
    ]
    
    var gridItems: [GridItem] = [GridItem()]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItems, alignment: .top, spacing: 20) {
                ForEach(stubDatas) { data in
                    GridCell(person: data)
                }
            }
        }
    }
}

struct LazyHGridView_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGridView()
    }
}
