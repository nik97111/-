//
//  AppointmentWithdoctor.swift
//  ListOfDoctors
//
//  Created by Николай Чупреев on 15.03.2024.
//

import SwiftUI

struct AppointmentWithDoctorView: View {
    
    // Добавляем привязку к модели UserResponse
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
        
        Text("Окно записи к врачу")
        
        Spacer()
    }
}

#Preview {
    DoctorsListView()
}
