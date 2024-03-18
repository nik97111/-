//
//  UserResponse.swift
//  ListOfDoctors
//
//  Created by Николай Чупреев on 12.03.2024.
//


import Foundation
import UIKit
import SwiftUI

// Для кодирования и декодирования JSON-объектов используем проокол Codable
struct UserResponse: Hashable, Codable, Identifiable {
    let id: String
    let first_name: String
    let patronymic: String
    let last_name: String
    // Чтобы поле avatar было nullable, делаем его опциональным
    let avatar: String?
    let seniority: Int
    let category: Int
    let scientific_degree_label: String
    let ratings_rating: Double
    let specialization: [Specialization]
    
    let text_chat_price: Int
    let video_chat_price: Int
    let home_price: Int
    let hospital_price: Int
    
    
    // Обязательно к прочтению
    // Предполагаю, что диплом об образовании будет у всех врачей и данные о нем будут внесены в json-file и в нем в поле "education_type_label" не будет значение "null". Если значение не "null", то при нажатии на ячейку доктора осуществится переход на экран доктора. Если значение "null", то будет ошибка и перехода на экран доктора не будет.
    // Так как в данный момент у многих полей "education_type_label" установлено значение "null", то во избежании ошибок я закомментил здесь строку ниже и struct EducationLabel, а также в структуре DoctorDetailView в стеке // Образование HStack{Image(systemName: "graduationcap")Text(user.education_type_label!.name)} строку Text(user.education_type_label!.name)
    
    
//    let education_type_label: EducationLabel?
//    let work_expirience: workExpirience?
//    let ratings: [Ratings]
    
}

struct Specialization: Codable, Equatable, Hashable {
    let id: Int
    let name: String
    let is_moderated: Bool
    }

//struct Ratings: Codable, Equatable, Hashable {
//    let id: Int
//    let name: String
//    let value: Double
//}

//struct EducationLabel: Codable, Equatable, Hashable {
//    let id: Int
//    let name: String
//}

//struct workExpirience: Codable, Equatable, Hashable {
//    let id: Int
//    let organization: String
//    let position: String
//    let start_date: Int
//    let end_date: Int
//    let until_now: Bool
//    let is_moderated: Bool
//}
