//
//  GenghisKhanPartyView.swift
//  HakodateSwiftDrawHokkaidoChallenge
//
//  Created by Kanta Oikawa on 2026/02/22.
//

import SwiftUI

struct GenghisKhanPartyView: View {
    // 鍋のサイズ定義
    let potSize: CGFloat = 300

    // 具材の数
    let meatCount = 14
    let sproutCount = 20
    let greenPepperCount = 6
    let onionCount = 5
    let pumpkinCount = 5

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

                    // --- レイヤー3: ラム肉（中央のドーム中心に配置、焼き加減ランダム） ---
                    ForEach(0..<meatCount, id: \.self) { _ in
                        let level = CookingLevel.allCases.randomElement()!
                        LambMeatView(cookingLevel: level)
                            .rotationEffect(Angle(degrees: Double.random(in: 0...360)))
                            .offset(
                                x: CGFloat.random(in: -potSize/4 ... potSize/4),
                                y: CGFloat.random(in: -potSize/4 ... potSize/4)
                            )
                    }
                }
            }
        }
    }
}

#Preview {
    GenghisKhanPartyView()
}
