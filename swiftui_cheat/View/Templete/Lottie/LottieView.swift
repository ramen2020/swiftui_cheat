//
//  LottieView
//  swiftui_cheat
//

import SwiftUI
import Lottie

struct LottiePlacticeView: View {
    var body: some View {
        VStack {
            LottieView(name: "voice_wave", loopMode: .loop)
                .frame(width: 250, height: 250)
        }
    }
}

struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode = .playOnce
    
    var animationView = AnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {}
}
struct LottiePlacticeView_Previews: PreviewProvider {
    static var previews: some View {
        LottiePlacticeView()
    }
}
