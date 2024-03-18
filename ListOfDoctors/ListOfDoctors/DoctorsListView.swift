//
//  ContentView.swift
//  ListOfDoctors
//
//  Created by Николай Чупреев on 11.03.2024.
//

import SwiftUI

struct DoctorsListView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                HStack {
                    Image(systemName: "chevron.left")
                        .padding(.leading, 10)
                    Spacer()
                    Text("Педиатры")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                Spacer()
                
                // Строка для поиска
                TextFieldView()
                
                // 3 горизонтальных кнопки выбора
                HStack {
                    SelectionButtonsView()
                }
                
                List(userResponse, id: \.id) { user in
                    Section {
                        VStack {
                            NavigationLink(destination: DoctorDetailView(user: user)) {
                                // spacing: 15 - отступ между аватаром и ФИО
                                HStack(spacing: 15) {
                                    // Ф-я загрузки аватара
                                    LoadAvatarView(user: user)
                                    // Выравниваем ФИО по левому краю
                                    VStack(alignment: .leading) {
                                        Text(user.last_name)
                                            .font(.system(size: 20))
                                        HStack {
                                            Text("\(user.first_name) \(user.patronymic)")
                                        }
                                        .font(.system(size: 20))
                                    }
                                }
                            }
                        }
                        
                        // Рейтинг
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Рейтинг")
                                RatingDisplayView(user: user)
                            }
                            // Выводим специализацию доктора
                            Text(user.specialization.map { $0.name }.joined(separator: ", "))
                            HStack {
                                Text("От 600")
                                Image(systemName: "rublesign")
                            }
                        }
                        
                        // Кнопка - Записаться
                        SignUpButtonView(user: user)
                    }
                }
            }
        }
    }
}


#Preview {
    DoctorsListView()
}
