//
//  HomeViewModel.swift
//  Test
//
//  Created by Николай Чупреев on 05.07.2024.
//


import SwiftUI
import Combine
import Kingfisher

class HomeViewModel: ObservableObject {
    // Объявляем свойства:
    
    // showImageViewer - флаг для отображения окна с изображением
    @Published var showImageViewer = false
    // selectedImageID - идентификатор выбранного изображения
    @Published var selectedImageID: String = ""
    // imageViewerOffset - смещение изображения
    @Published var imageViewerOffset: CGSize = .zero
    // cancellables - набор подписок на результаты Combine операций
    @Published var cancellables: Set<AnyCancellable> = []
    // bgOpacity - непрозрачность фона
    @Published var bgOpacity: Double = 1
    // imageScale - масштабирование
    @Published var imageScale: CGFloat = 1
    // imageCache - кеш для изображений
    @Published var imageCache: [URL: UIImage] = [:]
    // isPressed - отслеживаем, нажата кнопка или нет (для вибрации при нажатии на кнопку)
    @Published var isPressed = false
    
    // 11 Свойство для модального окна showDescriptionView
    @Published var showDescriptionView = false
 
    // textStack - стек текстов
    var textStack: String
    // urlStack - стек URL адресов
    var urlStack: [URL] = []
    
    // Создаем инициализатор init, который принимает текстовый стек и стек URL адресов, и загружает изображения по переданным URL
    init(textStack: String, urlStack: [URL]) {
        self.textStack = textStack
        self.urlStack = urlStack
        let urls = urlStack
        loadImage(from: urls)
    }
    
    // Создаем метод onChange, который устанавливает новое смещение для изображения и изменяет непрозрачность фона в зависимости от положения
    func onChange(value: CGSize) {
        DispatchQueue.main.async {
            self.imageViewerOffset = value
            let halgHeight = UIScreen.main.bounds.height / 2
            let progress = self.imageViewerOffset.height / halgHeight
            withAnimation(.default) {
                self.bgOpacity = Double(1 - (progress < 0 ? -progress : progress))
                // или
                //                self.bgOpacity = Double(1 - abs(progress))
            }
        }
    }
    
    
    
    // Создаем метод onEnd, который обрабатывает окончание жеста перетаскивания изображения, скрывает или закрывает окно с изображением
    func onEnd(value: DragGesture.Value) {
        DispatchQueue.main.async {
            withAnimation(.easeInOut) {
                //                var translation = value.translation.height
                //                if translation < 0 {
                //                    translation = -translation
                //                }
                // или
                let translation = value.translation.height < 0 ? -value.translation.height : value.translation.height
                
                if translation < 250 {
                    self.imageViewerOffset = .zero
                    self.bgOpacity = 1
                } else {
                    self.showImageViewer.toggle()
                    self.imageViewerOffset = .zero
                    self.bgOpacity = 1
                }
            }
        }
    }
    
    // Для загрузки и кеширования изображений (вместо использования URLSession для загрузки изображений) используем Kingfisher: загружаем изображения с помощью метода retrieveImage(with:), который автоматически кеширует изображения для повторного использования. В случае успешной загрузки изображения, оно добавляется в кеш imageCache
    func loadImage(from urls: [URL]) {
        urls.forEach { url in
            //            let resource = ImageResource(downloadURL: url)
            let resource = KF.ImageResource(downloadURL: url)
            
            KingfisherManager.shared.retrieveImage(with: resource) { result in
                switch result {
                case .success(let value):
                    // Изображение было загружено успешно, кешируем его
                    self.imageCache[url] = value.image
                case .failure(let error):
                    // Произошла ошибка загрузки изображения
                    print("Ошибка загрузки изображения: \(error)")
                }
            }
        }
    }
    
                                    // Блок кода для TelegramMessageView
    
    // 1. Объявляем переменную text для хранения текста сообщения для TelegramMessageView
    @Published var text = ""
    
    // 2 Функция для отправки сообщения в чат Telegram
    func sendMessage() {
        let chatId = "769059040"
        let token = "847454390:KDFJGDFG"
        
        let urlString = "https://api.telegram.org/bot\(token)/sendMessage?chat_id=\(chatId)&text=\(text)"
        
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let response = String(data: data, encoding: .utf8) {
                        print(response)
                    }
                }
            }.resume()
        }
    }
    
    // 3 Функцию getTextHeight для расчета высоты текста в зависимости от ширины экрана и размера шрифта
    func getTextHeight() -> CGFloat {
        let textHeight = text.height(withConstrainedWidth: UIScreen.main.bounds.width - 10, font: UIFont.systemFont(ofSize: 27))
        // Рассчитываем высоту текста в зависимости от ширины экрана и размера шрифта
        return textHeight
    }
    
    // 5 Добавляем переменную для отслеживания количества символов в поле TextEditor
    @Published var characterCount: Int = 0
    // 6 Функция для проверки количества символов в поле TextEditor
    func checkCharacterCount() {
        characterCount = text.count
    }
    
}

// 4 Создаем расширение String для расчета высоты текста с учетом ширины и шрифта
extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height }
}

