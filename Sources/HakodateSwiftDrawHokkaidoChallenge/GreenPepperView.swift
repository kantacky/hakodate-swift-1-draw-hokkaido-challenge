import SwiftUI

/// ピーマンの輪切り
struct GreenPepperView: View {
    var body: some View {
        ZStack {
            // 外側のリング
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color(red: 0.2, green: 0.55, blue: 0.1),
                            Color(red: 0.1, green: 0.4, blue: 0.05),
                        ],
                        center: .center,
                        startRadius: 4,
                        endRadius: 14
                    )
                )
                .frame(width: 28, height: 28)

            // 中の空洞
            Circle()
                .fill(Color.black.opacity(0.7))
                .frame(width: 14, height: 14)

            // 種の粒
            Circle()
                .fill(Color(red: 0.85, green: 0.82, blue: 0.6))
                .frame(width: 3, height: 3)
                .offset(x: -2, y: -1)

            Circle()
                .fill(Color(red: 0.85, green: 0.82, blue: 0.6))
                .frame(width: 2.5, height: 2.5)
                .offset(x: 2, y: 2)
        }
        .shadow(radius: 0.5)
    }
}

#Preview {
    GreenPepperView()
        .padding()
        .background(Color.gray)
}
