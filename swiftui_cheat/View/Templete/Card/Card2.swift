//
//  Card2
//  swiftui_cheat
//

import SwiftUI

struct Card2: View {
    
    var body: some View {
        HStack(alignment: .top) {
            Image("chincoteague")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
            
            VStack(alignment: .leading) {
                Text("タイトル１")
                    .font(.system(size: 12))
                    .foregroundColor(Color.white)
                    .padding(.all, 4)
                    .background(Color.pink)
                    .padding(.trailing, 8)
                
                Text("タイトル２")
                    .font(.system(size: 14, weight: .semibold))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.trailing, 8)
                
                Text("タイトル３")
                    .font(.system(size: 14, weight: .semibold))
                
                HStack(spacing: 0) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(Color.yellow)
                    Text("タイトル４")
                        .font(.system(size: 12))
                        .padding(.leading, 2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.top, 10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(5)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
        )
        .padding(20)
    }
}
struct Card2_Previews: PreviewProvider {
    static var previews: some View {
        Card2()
    }
}
