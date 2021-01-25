//
//  HandlingUserInputView
//  swiftui_cheat
//

import Foundation
import SwiftUI

struct HandlingUserInputView: View {
    var body: some View {
        HandlingUserInputLandmarkList()
            .environmentObject(HandlingUserInputModelData())
    }
}

struct HandlingUserInputView_Previews: PreviewProvider {
    static var previews: some View {
        HandlingUserInputView()
    }
}
