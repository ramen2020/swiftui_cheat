//
//  LottieView
//  swiftui_cheat
//

import SwiftUI
import Lottie

struct LottiePlacticeView: View {
    var body: some View {
        VStack(spacing: 30) {
            LottieView(name: "favorite_star")
                .frame(width: 150, height: 150)

            LottieView(name: "successful")
                .frame(width: 150, height: 150)
            
            ZStack {
                LottieView(name: "voice_wave")
                    .frame(width: 250, height: 250)
                Image("animal_kuma")
            }
        }
    }
}

struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode = .loop
    
    var animationView = AnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        animationView.animation = Animation.named(name, animationCache: LRUAnimationCache.sharedCache)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.respectAnimationFrameRate = true
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
