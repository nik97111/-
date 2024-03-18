//
//  SelectionButtonsView.swift
//  ListOfDoctors
//
//  Created by Николай Чупреев on 13.03.2024.
//

import SwiftUI

struct SelectionButtonsView: View {
    
    @State private var textColorButtonPrice: Color = .gray
    @State private var bgColorButtonPrice: Color = .white
    
    @State private var textColorButtonExperience: Color = .gray
    @State private var bgColorButtonExperience: Color = .white
    
    @State private var textColorButtonRating: Color = .gray
    @State private var bgColorButtonRating: Color = .white
    
    var body: some View {
        
        selectionButtons()
        
    }
    
    func selectionButtons() -> some View {
        HStack {
            Button(action: {
                textColorButtonPrice = .white
                bgColorButtonPrice = .pink
                
                textColorButtonExperience = .gray
                bgColorButtonExperience = .white
                
                textColorButtonRating = .gray
                bgColorButtonRating = .white
            }) {
                Text("По цене")
                    .foregroundColor(textColorButtonPrice)
                    .padding()
                    .background(bgColorButtonPrice)
                    .cornerRadius(10)
            }
            .frame(maxWidth: .infinity)
            Button(action: {
                textColorButtonPrice = .gray
                bgColorButtonPrice = .white
                
                textColorButtonExperience = .white
                bgColorButtonExperience = .pink
                
                textColorButtonRating = .gray
                bgColorButtonRating = .white
            }) {
                Text("По стажу")
                    .foregroundColor(textColorButtonExperience)
                    .padding()
                    .background(bgColorButtonExperience)
                    .cornerRadius(10)
            }
            .frame(maxWidth: .infinity)
            Button(action: {
                textColorButtonPrice = .gray
                bgColorButtonPrice = .white
                
                textColorButtonExperience = .gray
                bgColorButtonExperience = .white
                
                textColorButtonRating = .white
                bgColorButtonRating = .pink
            }) {
                Text("По рейтингу")
                    .foregroundColor(textColorButtonRating)
                    .padding()
                    .background(bgColorButtonRating)
                    .cornerRadius(10)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: 10)
        .padding()
        .foregroundColor(.gray)
    }
}


#Preview {
    SelectionButtonsView()
}
