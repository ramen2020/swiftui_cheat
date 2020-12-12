
import SwiftUI

struct Page1View: View {
    var body: some View {
        
        VStack{
            NavigationLink(destination: AlerView()) {
                Text("Alert")
            }
            
            Spacer().frame(height: 30)
            
            NavigationLink(destination: CardView()) {
                Text("Card")
            }

            Spacer().frame(height: 30)
            
            NavigationLink(destination: ListView()) {
                Text("List")
            }
            
            NavigationLink(destination: CheckBoxView()) {
                Text("Check box")
            }
        }
    }
}

struct Page1View_Previews: PreviewProvider {
    static var previews: some View {
        Page1View()
    }
}
