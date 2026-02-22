//
//  LambMeatView.swift
//  HakodateSwiftDrawHokkaidoChallenge
//
//  Created by Kanta Oikawa on 2026/02/22.
//

import SwiftUI

/// 焼き加減
enum CookingLevel: CaseIterable {
    case raw       // 生
    case rare      // レア
    case medium    // ミディアム
    case wellDone  // ウェルダン

    /// 肉のメインカラー（明るい側→暗い側）
    var gradientColors: [Color] {
        switch self {
        case .raw:
            [Color(red: 0.85, green: 0.25, blue: 0.25), Color(red: 0.95, green: 0.45, blue: 0.45)]
        case .rare:
            [Color(red: 0.75, green: 0.28, blue: 0.28), Color(red: 0.85, green: 0.42, blue: 0.38)]
        case .medium:
            [Color(red: 0.55, green: 0.25, blue: 0.2), Color(red: 0.7, green: 0.35, blue: 0.28)]
        case .wellDone:
            [Color(red: 0.35, green: 0.18, blue: 0.12), Color(red: 0.5, green: 0.25, blue: 0.15)]
        }
    }

    /// 脂身の不透明度
    var fatOpacity: Double {
        switch self {
        case .raw: 0.5
        case .rare: 0.4
        case .medium: 0.3
        case .wellDone: 0.2
        }
    }

    /// 焦げ目の不透明度
    var charOpacity: Double {
        switch self {
        case .raw: 0.0
        case .rare: 0.05
        case .medium: 0.15
        case .wellDone: 0.35
        }
    }
}

// ラム肉：焼き加減のバリエーション付き楕円形
struct LambMeatView: View {
    var cookingLevel: CookingLevel = .rare

    var body: some View {
        Ellipse()
            .fill(
                LinearGradient(
                    colors: cookingLevel.gradientColors,
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .overlay(
                // 脂身（白い部分）
                Ellipse()
                    .fill(Color.white.opacity(cookingLevel.fatOpacity))
                    .frame(width: 15, height: 8)
                    .offset(x: 5, y: -4)
            )
            .overlay(
                // 焦げ目
                Ellipse()
                    .fill(Color.black.opacity(cookingLevel.charOpacity))
                    .frame(width: 30, height: 14)
                    .offset(x: -4, y: 6)
                    .blur(radius: 2)
            )
            .frame(width: 45, height: 28)
            .clipShape(Ellipse())
            .shadow(radius: 1)
    }
}

#Preview {
    HStack(spacing: 20) {
        ForEach(CookingLevel.allCases, id: \.self) { level in
            LambMeatView(cookingLevel: level)
        }
    }
    .padding()
}
