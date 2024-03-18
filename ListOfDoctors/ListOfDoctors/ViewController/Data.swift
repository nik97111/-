//
//  Data.swift
//  ListOfDoctors
//
//  Created by Николай Чупреев on 12.03.2024.
//

import Foundation
import UIKit
import SwiftUI

let userResponse: [UserResponse] = load("userModelData.json")

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Не удалось найти \(filename) в основном комплекте.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Не удалось загрузить \(filename) из основного пакета:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Не удалось разобрать \(filename) как \(T.self):\n\(error)")
    }
}
