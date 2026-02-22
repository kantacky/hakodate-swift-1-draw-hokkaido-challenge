//
//  GenghisKhanPartyView.swift
//  HakodateSwiftDrawHokkaidoChallenge
//
//  Created by Kanta Oikawa on 2026/02/22.
//

import SwiftUI

/// 肉の配置情報
private struct MeatPlacement: Identifiable {
    let id: Int
    let x: CGFloat
    let y: CGFloat
    let rotation: Double
    let cookingLevel: CookingLevel
}

/// 重ならない肉の配置を生成
private func generateMeatPlacements(count: Int, potSize: CGFloat) -> [MeatPlacement] {
    // 肉の楕円（45x28）を回転させた場合の外接円の半径
    let meatRadius: CGFloat = 23
    let minDistance: CGFloat = meatRadius * 2
    let range = potSize / 4

    var placements: [MeatPlacement] = []
    var attempts = 0
    let maxAttempts = 500

    while placements.count < count && attempts < maxAttempts {
        let x = CGFloat.random(in: -range...range)
        let y = CGFloat.random(in: -range...range)

        let overlaps = placements.contains { p in
            let dx = p.x - x
            let dy = p.y - y
            return (dx * dx + dy * dy) < (minDistance * minDistance)
        }

        if !overlaps {
            placements.append(MeatPlacement(
                id: placements.count,
                x: x,
                y: y,
                rotation: Double.random(in: 0...360),
                cookingLevel: CookingLevel.allCases.randomElement()!
            ))
        }
        attempts += 1
    }
    return placements
}

struct GenghisKhanPartyView: View {
    // 鍋のサイズ定義
    let potSize: CGFloat = 300

    // 具材の数
    let meatCount = 14
    let sproutCount = 20
    let greenPepperCount = 6
    let onionCount = 5
    let pumpkinCount = 5

    // 肉の配置（重なり回避）
    @State private var meatPlacements: [MeatPlacement] = []

    var body: some View {
        ZStack {
            // 背景色
            Color(white: 0.95).edgesIgnoringSafeArea(.all)

            VStack {
                Text("北海道名物 ジンギスカン")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)

                ZStack {
                    // --- レイヤー1: 土台となる鍋 ---
                    GenghisKhanPotView()
                        .frame(width: potSize, height: potSize)

                    // --- レイヤー2: 野菜（外側の溝エリアに配置） ---
                    ZStack {
                        // もやし
                        ForEach(0..<sproutCount, id: \.self) { _ in
                            let angle = Double.random(in: 0 ..< 360)
                            let distance = CGFloat.random(in: potSize * 0.40 ... potSize * 0.45)
                            BeanSproutView()
                                .rotationEffect(Angle(degrees: Double.random(in: 0...360)))
                                .offset(
                                    x: distance * CGFloat(cos(angle * .pi / 180)),
                                    y: distance * CGFloat(sin(angle * .pi / 180))
                                )
                        }

                        // ピーマン
                        ForEach(0..<greenPepperCount, id: \.self) { _ in
                            let angle = Double.random(in: 0 ..< 360)
                            let distance = CGFloat.random(in: potSize * 0.40 ... potSize * 0.45)
                            GreenPepperView()
                                .rotationEffect(Angle(degrees: Double.random(in: 0...360)))
                                .offset(
                                    x: distance * CGFloat(cos(angle * .pi / 180)),
                                    y: distance * CGFloat(sin(angle * .pi / 180))
                                )
                        }

                        // 玉ねぎ
                        ForEach(0..<onionCount, id: \.self) { _ in
                            let angle = Double.random(in: 0 ..< 360)
                            let distance = CGFloat.random(in: potSize * 0.40 ... potSize * 0.45)
                            OnionView()
                                .rotationEffect(Angle(degrees: Double.random(in: 0...360)))
                                .offset(
                                    x: distance * CGFloat(cos(angle * .pi / 180)),
                                    y: distance * CGFloat(sin(angle * .pi / 180))
                                )
                        }

                        // カボチャ
                        ForEach(0..<pumpkinCount, id: \.self) { _ in
                            let angle = Double.random(in: 0 ..< 360)
                            let distance = CGFloat.random(in: potSize * 0.40 ... potSize * 0.45)
                            PumpkinView()
                                .rotationEffect(Angle(degrees: Double.random(in: 0...360)))
                                .offset(
                                    x: distance * CGFloat(cos(angle * .pi / 180)),
                                    y: distance * CGFloat(sin(angle * .pi / 180))
                                )
                        }
                    }
                    .frame(width: potSize, height: potSize)
                    .clipShape(Circle())

                    // --- レイヤー3: ラム肉（中央のドーム中心に重ならず配置、焼き加減ランダム） ---
                    ForEach(meatPlacements) { meat in
                        LambMeatView(cookingLevel: meat.cookingLevel)
                            .rotationEffect(Angle(degrees: meat.rotation))
                            .offset(x: meat.x, y: meat.y)
                    }

                    // --- レイヤー4: 煙エフェクト ---
                    SmokeView()
                        .allowsHitTesting(false)
                }
            }
        }
        .onAppear {
            if meatPlacements.isEmpty {
                meatPlacements = generateMeatPlacements(count: meatCount, potSize: potSize)
            }
        }
    }
}

#Preview {
    GenghisKhanPartyView()
}
