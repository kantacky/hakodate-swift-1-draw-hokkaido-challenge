import SwiftUI

/// ピーマンの縦切り（短冊切り）
struct GreenPepperView: View {
    var body: some View {
        GreenPepperSliceShape()
            .fill(
                LinearGradient(
                    colors: [
                        Color(red: 0.25, green: 0.6, blue: 0.15),
                        Color(red: 0.15, green: 0.45, blue: 0.08),
                        Color(red: 0.2, green: 0.55, blue: 0.1),
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .overlay(
                // 内側の筋
                GreenPepperSliceShape()
                    .stroke(
                        Color(red: 0.12, green: 0.35, blue: 0.05).opacity(0.4),
                        lineWidth: 0.5
                    )
            )
            .frame(width: 12, height: 30)
            .shadow(radius: 0.5)
    }
}

/// ピーマン縦切りの形状：緩やかにカーブした短冊
struct GreenPepperSliceShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height

        // 左側の辺（やや内側にカーブ）
        path.move(to: CGPoint(x: w * 0.15, y: h * 0.05))
        path.addQuadCurve(
            to: CGPoint(x: w * 0.1, y: h * 0.95),
            control: CGPoint(x: -w * 0.05, y: h * 0.5)
        )

        // 下端（丸み）
        path.addQuadCurve(
            to: CGPoint(x: w * 0.9, y: h * 0.95),
            control: CGPoint(x: w * 0.5, y: h * 1.05)
        )

        // 右側の辺（やや外側にカーブ）
        path.addQuadCurve(
            to: CGPoint(x: w * 0.85, y: h * 0.05),
            control: CGPoint(x: w * 1.05, y: h * 0.5)
        )

        // 上端（丸み）
        path.addQuadCurve(
            to: CGPoint(x: w * 0.15, y: h * 0.05),
            control: CGPoint(x: w * 0.5, y: -h * 0.05)
        )

        return path
    }
}

#Preview {
    GreenPepperView()
        .padding()
        .background(Color.gray)
}
