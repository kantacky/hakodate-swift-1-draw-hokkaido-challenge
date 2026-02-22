//
//  HandleShape.swift
//  HakodateSwiftDrawHokkaidoChallenge
//
//  Created by Kanta Oikawa on 2026/02/22.
//

import SwiftUI

// シンプルな取っ手のShape
struct HandleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRoundedRect(
            in: CGRect(x: 0, y: rect.midY - 10, width: 30, height: 20),
            cornerSize: CGSize(width: 5, height: 5)
        )
        return path
    }
}

#Preview {
    HandleShape()
}
