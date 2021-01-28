/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of landmarks.
 
 Link: https://developer.apple.com/tutorials/swiftui/handling-user-input
*/

import SwiftUI

struct HandlingUserInputLandmarkRow: View {
    var landmark: HandlingUserInputLandmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)

            Spacer()

            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct HandlingUserInputLandmarkRow_Previews: PreviewProvider {
    static var landmarks = HandlingUserInputModelData().landmarks

    static var previews: some View {
        Group {
            HandlingUserInputLandmarkRow(landmark: landmarks[0])
            HandlingUserInputLandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
