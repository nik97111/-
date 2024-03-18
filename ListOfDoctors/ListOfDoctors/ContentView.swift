//
//  ContentView.swift
//  ListOfDoctors
//
//  Created by Николай Чупреев on 12.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isChoice = false
    
    var body: some View {
        if isChoice {
            DoctorsListView()
        } else {
            Text("Для выбора услуг и врачей нажмите на кнопку")
                .padding()
                .multilineTextAlignment(.center)
                .font(.system(size: 25))
            Text("Мы не только лечим - мы возвращаем ЖИЗНЬ! \n Мы - Ваш лучший выбор!")
                .font(.system(size: 25))
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(15)
                .onTapGesture {
                    // переключение состояния
                    isChoice = true
                }
        }
    }
}


#Preview {
    ContentView()
}
