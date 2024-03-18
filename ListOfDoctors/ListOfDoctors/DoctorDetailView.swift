//
//  DoctorDetailView.swift
//  ListOfDoctors
//
//  Created by Николай Чупреев on 11.03.2024.
//

import SwiftUI

struct DoctorDetailView: View {
    
    var user: UserResponse
    
    var body: some View {
        
        Text("Педиатр")
            .font(.system(size: 25))
            .foregroundColor(.black)
        
        // spacing: 15 - отступ между аватаром и ФИО
        HStack(alignment: .top, spacing: 15) {
            // Ф-я загрузки аватара
            LoadAvatarView(user: user)
            // Смещение к левому краю
                .alignmentGuide(.leading) { _ in 0 }
            
            // Выравниваем ФИО по левому краю
            VStack(alignment: .leading) {
                Text(user.last_name)
                Text("\(user.first_name) \(user.patronymic)")
            }
            .font(.system(size: 20))
        }
        
        VStack(alignment: .leading) {
            // Опыт работы
            HStack() {
                Image(systemName: "clock.arrow.2.circlepath")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 25, height: 25)
                
                let year = user.seniority
                switch year {
                case 1...4:
                    Text("Опыт работы: \(user.seniority) года")
                case 5...90:
                    Text("Опыт работы: \(user.seniority) лет")
                case 21, 31, 41, 51, 61, 71, 81:
                    Text("Опыт работы: \(user.seniority) год")
                default:
                    Text("Опыт работы: до одного года")
                }
            }
            
            // Категория
            HStack{
                Image(systemName: "cross.case")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 25, height: 25)
                
                let categ = user.category
                // Вариант с if
                //                                if categ == 0 {
                //                                    Text("Врач")
                //                                } else if categ == 1 {
                //                                    Text("Врач первой категории")
                //                                } else if categ == 2 {
                //                                    Text("Врач второй категории")
                //                                } else if categ == 3 {
                //                                    Text("Врач высшей категории")
                //                                }
                
                switch categ {
                case 1:
                    Text("Врач \(user.category)-й категории")
                case 2:
                    Text("Врач \(user.category)-й категории")
                case 3:
                    Text("Врач \(user.category)-й категории")
                default:
                    Text("Врач")
                }
            }
            
            // Образование. Причину того, что закомментировано, читать в UserResponse
            HStack{
                Image(systemName: "graduationcap")
                //                Text(user.education_type_label!.name)
            }
            
            // Наличие ученой степени
            HStack{
                Image(systemName: "brain")
                Text("Ученая степень: \(user.scientific_degree_label)")
            }
            .font(.system(size: 20))
        }
        .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text("Стоимость услуг от 600")
                Image(systemName: "rublesign")
            }
            Text("Текстовый чат: \(user.text_chat_price) \n Видое-чат: \(user.video_chat_price) \n Выезд на дом: \(user.home_price) \n Прием в больнице: \(user.hospital_price)")
        }
        .frame(maxWidth: .infinity, minHeight: 130)
        .font(.system(size: 20))
        .multilineTextAlignment(.center)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding()
        
        
        Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и за рубежом. Проводит консультации пациентов на английском языке.")
            .multilineTextAlignment(.center)
            .padding()
        
        Spacer()
        
        // Кнопка - Записаться
        SignUpButtonView(user: user)
    }
}


#Preview {
    DoctorsListView()
}
