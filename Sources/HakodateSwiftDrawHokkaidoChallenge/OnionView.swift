import SwiftUI

/// 玉ねぎの輪切り
struct OnionView: View {
    var body: some View {
        ZStack {
            // 外側のリング
            Circle()
                .stroke(
                    Color(red: 0.95, green: 0.9, blue: 0.75),
                    lineWidth: 4
                )
                .frame(width: 26, height: 26)

            // 中間のリング
            Circle()
                .stroke(
                    Color(red: 0.92, green: 0.85, blue: 0.7).opacity(0.8),
                    lineWidth: 3
                )
                .frame(width: 18, height: 18)

            // 中心のリング
            Circle()
                .stroke(
                    Color(red: 0.9, green: 0.82, blue: 0.65).opacity(0.6),
                    lineWidth: 2
                )
                .frame(width: 10, height: 10)

            // 半透明の表面
            Circle()
                .fill(Color(red: 0.95, green: 0.92, blue: 0.82).opacity(0.3))
                .frame(width: 30, height: 30)
        }
        .shadow(radius: 0.5)
    }
}

#Preview {
    OnionView()
}
