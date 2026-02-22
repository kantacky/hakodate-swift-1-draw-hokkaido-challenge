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
    let meatCount = 8
    let sproutCount = 25

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

                    // --- レイヤー2: もやし（外側の溝、1つ目と2つ目の円の中間より内側に配置） ---
                    ZStack {
                        ForEach(0..<sproutCount, id: \.self) { _ in
                            let angle = Double.random(in: 0 ..< 360)
                            // 外枠(半径150)とドーム(半径120)の中間(135)より内側: 半径120〜135
                            let distance = CGFloat.random(in: potSize * 0.40 ... potSize * 0.45)
                            BeanSproutView()
                                .rotationEffect(Angle(degrees: Double.random(in: 0...360)))
                                .offset(
                                    x: distance * CGFloat(cos(angle * .pi / 180)),
                                    y: distance * CGFloat(sin(angle * .pi / 180))
                                )
                        }
                    }
                    .frame(width: potSize, height: potSize)
                    .clipShape(Circle())

                    // --- レイヤー3: ラム肉（中央のドーム中心に配置） ---
                    ForEach(0..<meatCount, id: \.self) { _ in
                        LambMeatView()
                            .rotationEffect(Angle(degrees: Double.random(in: 0...360)))
                            // 鍋の中央付近に集中してランダム配置
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
