//
//  Skelton+View+Extention
//  swiftui_cheat
//

import SwiftUI

extension View {

    @ViewBuilder
    func onSkeleton(
        active: Bool
    ) -> some View {
        if active {
        self
            .redacted(reason: active ? .placeholder : [])
            .shimmering(active: active)
            .disabled(active)
        }
    }
}


extension View {

    @ViewBuilder
    func onSkeleton2(
        active: Bool,
        type: RedactionReason
    ) -> some View {
        if active {
        self
            .redacted(reason: type)
            .shimmering(active: active)
            .disabled(active)
        } else {
            self
        }
    }
}

// LINK: https://www.fivestars.blog/articles/redacted-custom-effects/
public enum RedactionReason {
  case placeholder
  case confidential
  case blurred
}

struct Placeholder: ViewModifier {
  func body(content: Content) -> some View {
    content
      .accessibility(label: Text("Placeholder"))
      .opacity(0)
      .overlay(
        RoundedRectangle(cornerRadius: 2)
          .fill(Color.black.opacity(0.1))
          .padding(.vertical, 4.5)
    )
  }
}

struct Confidential: ViewModifier {
  func body(content: Content) -> some View {
    content
      .accessibility(label: Text("Confidential"))
        .overlay(Color.gray)
  }
}

struct Blurred: ViewModifier {
  func body(content: Content) -> some View {
    content
      .accessibility(label: Text("Blurred"))
      .blur(radius: 4)
  }
}

struct Redactable: ViewModifier {
  let reason: RedactionReason?

  @ViewBuilder
  func body(content: Content) -> some View {
    switch reason {
    case .placeholder:
      content
        .modifier(Placeholder())
    case .confidential:
      content
        .modifier(Confidential())
    case .blurred:
      content
        .modifier(Blurred())
    case nil:
      content
    }
  }
}


extension View {
  func redacted(reason: RedactionReason?) -> some View {
    modifier(Redactable(reason: reason))
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
