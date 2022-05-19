//
//  CardModifier.swift
//  JJUbot-iOS
//
//  Created by 이정현 on 2022/05/19.
//

import Foundation
import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 0)
    }
}
