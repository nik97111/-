//
//  TelegramMessageView.swift
//  Test
//
//  Created by Николай Чупреев on 05.07.2024.
//

import SwiftUI
import AVFoundation

struct TelegramMessageView: View {

    // Инициализируем homeData. Добавляем @ObservedObject var homeData: LoadImage для доступа к LoadImage в этой структуре
    @ObservedObject var homeData: HomeViewModel

    // После нажатия на кнопку Отправить экран TelegramMessageView закроется (используем вместо dismiss)
    @Environment(\.presentationMode) var presentationMode
    
    // 33 Звуковое сопровождение отправки сообщения после нажатия на кнопку
    @State private var player: AVAudioPlayer?

    // 39 Добавляем свойство showAlert. Если в TextEditor введенных символов меньше 1, то при нажатии на кнопку Отправить появляется alert
    @State var showAlert = false
    
    var body: some View {
        
        // 3
        ZStack {
            
            // 4 Полоска вверху
            Color("ColorTabBar")
                .frame(width: 50, height: 6)
                .cornerRadius(3)
                .padding(.top, 5)
            
            // 5
            HStack {
                // 6 Сдвигаем кнопку к правому краю
                Spacer()
                // 7 Кнопка закрытия окна TelegramMessageView. Устанавливаем действие при нажатии
                Button {
                    //                    dismiss()
                    // 13 Используем withAnimation
                    withAnimation(.linear(duration: 0.2)) {
                        // После нажатия на кнопку Envoyer экран TelegramMessageView закроется автоматически
                        presentationMode.wrappedValue.dismiss()
                    }
                    // 8
                } label: {
                    // 9 Добавляем иконку "xmark" с определенными настройками
                    Image(systemName: "xmark")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                }
                // 10 Устанавливаем отступы для кнопки закрытия
                .padding(.trailing, 15)
                .padding(.top, 5)
            }
        }

        Spacer()
        
        // 14
        VStack {
            // 15 Добавляем текст с инструкциями для пользователя
            Text("")
            // 16 Устанавливаем шрифт, выравнивание текста и отступы
                .font(.system(size: 25, weight: .regular))
                .multilineTextAlignment(.center)
                .padding()
            
            // 17 Добавляем TextEditor (поле для ввода текста сообщения) и связываем его с переменной text
            TextEditor(text: $homeData.text)
            // Устанавливаем шрифт для поля ввода текста сообщения
                .font(.system(size: 25))
            // 28 Устанавливаем динамическую высоту поля ввода текста (TextEditor) в зависимости от текста
                .frame(height: max(40, homeData.getTextHeight()))
            // Делаем рамку
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                    // Цвет рамки - серый
                        .stroke(.gray)
                }
            // 18 Устанавливаем отступ для поля ввода текста сообщения
                .padding()
            // 37 Добавляем проверку количества символов в поле TextEditor
                            .onChange(of: homeData.text) { _ in
                                homeData.checkCharacterCount()
                            }
            
            // 19 Кнопка отправки сообщения. Устанавливаем действия при нажатии
            Button(action: {
                // 22 Вызываем функцию sendMessage для отправки сообщения
                homeData.sendMessage()
                // 23 После нажатия на кнопку Envoyer экран TelegramMessageView закроется
//                presentationMode.wrappedValue.dismiss()
                // 24 Чтобы поле ввода текста после отправки сообщения всегда было пустым
                homeData.text = ""
                // 30 Добавляем вибрацию при нажатии на кнопку
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                // 41 Если в TextEditor введенных символов >= 1, то отправка сообщения сопровождается звуком после нажатия на кнопку Отправить
                if homeData.characterCount >= 1 {
                    let url = Bundle.main.url(forResource: "sentmessage", withExtension: "mp3")!
                    player = try! AVAudioPlayer(contentsOf: url)
                    player?.play()
                }
                // Если нет введенных символов в поле, то появляется alert
                if homeData.characterCount < 1 {
                    showAlert = true
                }
            }) {
                // 20 Добавляем текст "Отправить" с определенными настройками
                Text("Отправить")
                    .font(.system(size: 25, weight: .bold, design: .serif))
                    .padding()
                    .foregroundColor(.black)
                    .background(Color("ColorTabBar"))
                    .cornerRadius(10)
            }
            // 21 Используем GradientBackgroundStyle для изменения размера и непрозрачности кнопки при нажатии
            .buttonStyle(GradientBackgroundStyle())
            // 38 Делаем кнопку неактивной, если количество символов меньше одного
//            .disabled(homeData.characterCount < 1)
            // 31 Для вибрации при нажатии на кнопку
            .onLongPressGesture {_ in
                homeData.isPressed = true
            } perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    homeData.isPressed = false
                }
            }
            .alert(isPresented: $showAlert,
                   content: {
                Alert(title: Text("N'oubliez pas d'écrire un message"))
            })
        }

        Spacer()
        
    }
}
#Preview {
    TelegramMessageView(homeData: HomeViewModel(textStack: "", urlStack: []))
}
