//
//  SmokeView.swift
//  HakodateSwiftDrawHokkaidoChallenge
//
//  Created by Kanta Oikawa on 2026/02/22.
//

import SwiftUI

/// 個々の煙パーティクル
private struct SmokeParticle: View {
    let delay: Double
    let startX: CGFloat
    let startY: CGFloat
    let driftX: CGFloat
    let riseDistance: CGFloat
    let maxScale: CGFloat
    let duration: Double

    @State private var animate = false

    var body: some View {
        Ellipse()
            .fill(Color.white.opacity(animate ? 0 : 0.35))
            .frame(width: 50, height: 30)
            .scaleEffect(animate ? maxScale : 0.3)
            .offset(
                x: startX + (animate ? driftX : 0),
                y: startY + (animate ? -riseDistance : 0)
            )
            .blur(radius: animate ? 14 : 4)
            .onAppear {
                withAnimation(
                    .easeOut(duration: duration)
                    .repeatForever(autoreverses: false)
                    .delay(delay)
                ) {
                    animate = true
                }
            }
    }
}

/// 鍋の上に漂う煙エフェクト
struct SmokeView: View {
    private let particles: [(id: Int, delay: Double, startX: CGFloat, startY: CGFloat, driftX: CGFloat, riseDistance: CGFloat, maxScale: CGFloat, duration: Double)] = {
        (0..<16).map { i in
            (
                id: i,
                delay: Double(i) * 0.25,
                startX: CGFloat.random(in: -100...100),
                startY: CGFloat.random(in: -20...20),
                driftX: CGFloat.random(in: -60...60),
                riseDistance: CGFloat.random(in: 100...180),
                maxScale: CGFloat.random(in: 1.8...3.0),
                duration: Double.random(in: 2.5...4.0)
            )
        }
    }()

    var body: some View {
        ZStack {
            ForEach(particles, id: \.id) { p in
                SmokeParticle(
                    delay: p.delay,
                    startX: p.startX,
                    startY: p.startY,
                    driftX: p.driftX,
                    riseDistance: p.riseDistance,
                    maxScale: p.maxScale,
                    duration: p.duration
                )
            }
        }
    }
}

#Preview {
    ZStack {
        Color(white: 0.3)
        SmokeView()
    }
}
