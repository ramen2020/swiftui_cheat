//
//  View+Extension
//  swiftui_cheat
//

import SwiftUI

// black Mask
extension View {
    @ViewBuilder
    func onBlackFilter(
        isFilter: Bool,
        color: Color = Color.black.opacity(0.6),
        text: String = ""
    ) -> some View {
        if isFilter {
            self
                .overlay(
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(color)
                            .cornerRadius(4)
                        Text(text)
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                )
        } else {
            self
        }
    }
}

extension View {

    @ViewBuilder
    func onSkeleton(
        active: Bool
    ) -> some View {
        self
            .redacted(reason: active ? .placeholder : [])
            .shimmering(active: active)
            .disabled(active)
    }
}


// Link: https://github.com/markiv/SwiftUI-Shimmer

/// A view modifier that applies an animated "shimmer" to any view, typically to show that
/// an operation is in progress.
public struct Shimmer: ViewModifier {
    @State private var phase: CGFloat = 0
    var duration = 1.5
    var bounce = false

    public func body(content: Content) -> some View {
        content
            .modifier(AnimatedMask(phase: phase).animation(
                Animation.linear(duration: duration)
                    .repeatForever(autoreverses: bounce)
            ))
            .onAppear { phase = 0.8 }
    }

    struct AnimatedMask: AnimatableModifier {
        var phase: CGFloat = 0

        var animatableData: CGFloat {
            get { phase }
            set { phase = newValue }
        }

        func body(content: Content) -> some View {
            content
                .mask(GradientMask(phase: phase).scaleEffect(3))
        }
    }

    struct GradientMask: View {
        let phase: CGFloat
        let centerColor = Color.black
        let edgeColor = Color.black.opacity(0.3)

        var body: some View {
            LinearGradient(gradient:
                Gradient(stops: [
                    .init(color: edgeColor, location: phase),
                    .init(color: centerColor, location: phase + 0.1),
                    .init(color: edgeColor, location: phase + 0.2)
                ]), startPoint: .leading, endPoint: .trailing)
        }
    }
}

public extension View {
    /// Adds an animated shimmering effect to any view, typically to show that
    /// an operation is in progress.
    /// - Parameters:
    ///   - active: Convenience parameter to conditionally enable the effect. Defaults to `true`.
    ///   - duration: The duration of a shimmer cycle in seconds. Default: `1.5`.
    ///   - bounce: Whether to bounce (reverse) the animation back and forth. Defaults to `false`.
    @ViewBuilder func shimmering(
        active: Bool = true, duration: Double = 1.5, bounce: Bool = false
    ) -> some View {
        if active {
            modifier(Shimmer(duration: duration, bounce: bounce))
        } else {
            self
        }
    }
}
