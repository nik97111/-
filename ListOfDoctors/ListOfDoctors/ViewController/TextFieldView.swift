//
//  TextFieldView.swift
//  ListOfDoctors
//
//  Created by Николай Чупреев on 15.03.2024.
//

import SwiftUI

struct TextFieldView: View {
    
    @State private var textFieldInput = ""
    
    var body: some View {
        
        textField()
    }
    
    func textField() -> some View {
        
        TextField("", text: $textFieldInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .font(.headline)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 25)
                    Spacer()
                }
            )
    }
}


#Preview {
    TextFieldView()
}
