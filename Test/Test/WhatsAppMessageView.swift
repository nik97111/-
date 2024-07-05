//
//  WhatsAppMessageView.swift
//  Test
//
//  Created by Николай Чупреев on 05.07.2024.
//

import SwiftUI

struct WhatsAppMessageView: View {
    
    // Инициализируем homeData. Добавляем @ObservedObject var homeData: LoadImage для доступа к LoadImage в этой структуре
    @ObservedObject var homeData: HomeViewModel
    
    //
    @State private var message: String = ""
    
    // После нажатия на кнопку Продолжить экран WhatsAppMessageView закроется (используем вместо dismiss)
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack {
            
            // Полоска вверху
            //            Color.gray
            Color("ColorTabBar")
                .frame(width: 50, height: 6)
                .cornerRadius(3)
                .padding(.top, 5)
            
            
            HStack {
                // Сдвигаем кнопку к правому краю
                Spacer()
                
                Button {
//                    dismiss()
                    withAnimation(.linear(duration: 0.2)) {
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 15)
                .padding(.top, 5)
            }
        }
        
        Spacer()
        
        VStack {
            Text("")
                .padding()
                .multilineTextAlignment(.center)
                .font(.system(size: 25, weight: .regular))
            
            
            Button(action: {
                // 30 Добавляем вибрацию при нажатии на кнопку
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                // Отправка сообщения (переход в приложение WhatsApp)
                let whatsappURL = URL(string: "https://wa.me/+79051927969?text=\(message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")!
                
                if UIApplication.shared.canOpenURL(whatsappURL) {
                    UIApplication.shared.open(whatsappURL)
                    // После нажатия на кнопку Сontinuer экран MessageView закроется
                    presentationMode.wrappedValue.dismiss()
                } else {
                    print("Не удалось открыть WhatsApp")
                }
            }) {
                Text("Продолжить")
                    .font(.system(size: 25))
                    .padding()
                    .foregroundColor(.black)
                    .background(Color("ColorTabBar"))
                    .cornerRadius(10)
            }
            // Изменяем размер кнопки и непрозрачность при нажатии
            .buttonStyle(GradientBackgroundStyle())
            // 31 Для вибрации при нажатии на кнопку
            .onLongPressGesture {_ in
                homeData.isPressed = true
            } perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    homeData.isPressed = false
                }
        }
            
        }
        
        Spacer()
        
    }
}


#Preview {
//    WhatsAppMessageView()
    WhatsAppMessageView(homeData: HomeViewModel(textStack: "", urlStack: []))
}
