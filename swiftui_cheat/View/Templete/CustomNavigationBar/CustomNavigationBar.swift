//
//  CustomNavigationBar
//  swiftui_cheat
//

import SwiftUI



struct CustomNavigationBar: View {
    
    @Environment(\.presentationMode) var presentation
    
    var title: String
    var imageName: String
    var isReturn: Bool
    
    init(
        title: String = "",
        imageName: String = "",
        isReturn: Bool = false
    ) {
        self.title = title
        self.imageName = imageName
        self.isReturn = isReturn
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            Spacer().frame(height: 50)
            HStack {
                if isReturn {
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }, label: Image(systemName: "arrowshape.turn.up.left")
                        .frame(width: 10, height: 18, alignment: .leading)
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                } else {
                    Spacer()
                }
                
                VStack {
                    if imageName != "" {
                        Image(imageName)
                            .resizable()
                            .scaleEffect()
                        
                    } else {
                        Text(title).font(.system(size: 17, weight: .semibold))
                            .fixedSize(horizontal: true, vertical: false)
                    }
                }.frame(maxWidth: .infinity, alignment: .center)
                
                NavigationLink(destination: LibrariesView()){
                    Image(systemName: "star.fill")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 20)
                }
            }
            .frame(height: 50)

        }
        .frame(maxWidth: UIScreen.main.bounds.height)
        .frame(height: 100)
        .background(Color.materialColor(colorCode: .deepPurple))
        .foregroundColor(Color.materialColor(colorCode: .yellow))
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.gray),
            alignment: .bottom)
        .zIndex(10)
    }
}


struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar()
    }
}
