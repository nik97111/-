//
//  signUpButton.swift
//  ListOfDoctors
//
//  Created by Николай Чупреев on 15.03.2024.
//

import SwiftUI

struct SignUpButtonView: View {
    
    var user: UserResponse
    
    var body: some View {
        signUpButton()
    }
    
    func signUpButton() -> some View {
        NavigationLink(destination: AppointmentWithDoctorView(user: user)) {
            Text("Записаться")
                .frame(maxWidth: .infinity, minHeight: 60)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .background(Color.pink)
                .cornerRadius(10)
                .padding()
        }
    }
}


#Preview {
    DoctorsListView()
}
