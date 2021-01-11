//
//  QGeidView
//  swiftui_cheat
//

import SwiftUI
import QGrid

struct QGridView: View {
    
    // 画面で持たない方がいい？？？
    let stubDatas: [QGridStruct] = [
        QGridStruct(id: 1, title: "お知らせ", subTitle: "誕生日です。", imageName: "animal_arupaka"),
        QGridStruct(id: 2, title: "イベント情報", subTitle: "半額セール！", imageName: "animal_buta"),
        QGridStruct(id: 3, title: "キャンペーン", subTitle: "友達割引！！", imageName: "animal_neko"),
        QGridStruct(id: 4, title: "お知らせ", subTitle: "バーゲン！", imageName: "animal_penguin")
    ]

    var body: some View {
        QGrid(stubDatas, columns: 3) { data in
            QGridCell(person: data)
        }
    }
}

struct QGridStruct: Identifiable {
    let id: Int
    let title: String
    let subTitle: String
    let imageName: String
}

struct QGridCell: View {
    var person: QGridStruct
    

    
    var body: some View {
        VStack() {
            Image(person.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .shadow(color: .primary, radius: 5)
                .padding([.horizontal, .top], 7)
            Text(person.title).lineLimit(1)
            Text(person.subTitle).lineLimit(1)
        }
    }
}

struct QGridView_Previews: PreviewProvider {
    static var previews: some View {
        QGridView()
    }
}
