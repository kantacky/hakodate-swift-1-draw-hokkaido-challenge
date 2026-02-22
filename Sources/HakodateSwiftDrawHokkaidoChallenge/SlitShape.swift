//
//  File.swift
//  HakodateSwiftDrawHokkaidoChallenge
//
//  Created by Kanta Oikawa on 2026/02/22.
//

import SwiftUI

// 放射状の溝を描くShape
struct SlitShape: Shape {
    let count: Int

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.width / 2

        for i in 0..<count {
            let angle = Angle(degrees: Double(i) * (360.0 / Double(count)))
            let start = center
            let end = CGPoint(
                x: center.x + CGFloat(cos(angle.radians)) * radius,
                y: center.y + CGFloat(sin(angle.radians)) * radius
            )
            path.move(to: start)
            path.addLine(to: end)
        }
        return path
    }
}

#Preview {
    SlitShape(count: 10)
}
