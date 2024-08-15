//
//  BubbleChatTail.swift
//  HXD
//
//  Created by Ferdinand Jacques on 14/08/24.
//

import SwiftUI

struct BubbleChatTail: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX - 100, y: rect.minY + 20))
        path.addLine(to: CGPoint(x: rect.midX - 120, y: rect.maxY - 20))
        path.addLine(to: CGPoint(x: rect.midX - 80, y: rect.maxY - 20))
        path.closeSubpath()
        
        return path
    }
}