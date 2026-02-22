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

                    // --- レイヤー2: もやし（外側の溝中心に配置） ---
                    ZStack {
                        ForEach(0..<sproutCount, id: \.self) { _ in
                            BeanSproutView()
                                // ランダムな角度で回転
                                .rotationEffect(Angle(degrees: Double.random(in: 0...360)))
                                // 鍋の中心から少し離れた位置（溝付近）にランダム配置
                                .offset(
                                    x: CGFloat.random(in: -potSize/2.2 ... potSize/2.2),
                                    y: CGFloat.random(in: -potSize/2.2 ... potSize/2.2)
                                )
                        }
                    }
                    .frame(width: potSize, height: potSize)
                    // 鍋の外にはみ出さないようリング状マスクで制限（中心ドームも除外）
                    .mask(
                        Circle()
                            .stroke(lineWidth: potSize * 0.3)
                            .frame(width: potSize * 0.7, height: potSize * 0.7)
                    )

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
