//
//  GradientBackgroundStyle.swift
//  Test
//
//  Created by Николай Чупреев on 05.07.2024.
//

import SwiftUI

struct GradientBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View { configuration.label
//            .frame(minWidth: 0, maxWidth: .infinity)
//            .padding()
//            .foregroundColor(.white)
//            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.blue]), startPoint: .leading, endPoint: .trailing)) .cornerRadius(40)
//            .padding(.horizontal, 20)
//            .shadow(color: .gray, radius: 20.0, x: 20, y: 10)
        // Чтобы определить, нажата ли кнопка, обращаемся к свойству isPressed. Это позволит изменить стиль кнопки, когда пользователь касается ее. 
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}
