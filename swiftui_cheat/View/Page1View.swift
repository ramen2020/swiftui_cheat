
import SwiftUI

struct Page1View: View {
    var body: some View {
        
        VStack(spacing: 30) {
            NavigationLink(destination: AlerView()) {
                Text("Alert")
            }
            
            NavigationLink(destination: CardView()) {
                Text("Card")
            }
            
            NavigationLink(destination: ListView()) {
                Text("List")
            }
            
            NavigationLink(destination: CheckBoxView()) {
                Text("Check Box")
            }

            NavigationLink(destination: RadioButtonView()) {
                Text("Radio Button")
            }
            
            NavigationLink(destination: NavigationLinkView()) {
                Text("Navigation Link")
            }
        }
    }
}

struct Page1View_Previews: PreviewProvider {
    static var previews: some View {
        Page1View()
    }
}
