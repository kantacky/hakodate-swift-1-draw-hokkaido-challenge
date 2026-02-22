import SwiftUI

/// カボチャのスライス（三日月型の断面）
struct PumpkinView: View {
    var body: some View {
        ZStack {
            // 果肉部分
            Capsule()
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.95, green: 0.65, blue: 0.1),
                            Color(red: 0.85, green: 0.5, blue: 0.05),
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 30, height: 12)

            // 皮の部分（下端の緑色ライン）
            Capsule()
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.15, green: 0.35, blue: 0.1),
                            Color(red: 0.1, green: 0.25, blue: 0.05),
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: 30, height: 4)
                .offset(y: 5)

            // ハイライト
            Capsule()
                .fill(Color.white.opacity(0.25))
                .frame(width: 18, height: 4)
                .offset(y: -2)
        }
        .shadow(radius: 0.5)
    }
}

#Preview {
    PumpkinView()
}
