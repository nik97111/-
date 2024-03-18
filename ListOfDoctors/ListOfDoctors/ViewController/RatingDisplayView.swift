//
//  RatingDisplay.swift
//  ListOfDoctors
//
//  Created by Николай Чупреев on 14.03.2024.
//

import SwiftUI

struct RatingDisplayView: View {
    
    var user: UserResponse
    
    var body: some View {
        
        ratingDisplay()
    }
    
    func ratingDisplay() -> some View {
        
        HStack {
            let rating = user.ratings_rating
            
            switch rating {
            case 0...0.5:
                Image(systemName: "circle")
                Image(systemName: "circle")
                Image(systemName: "circle")
                Image(systemName: "circle")
            case 0.6...1.0:
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                Image(systemName: "circle")
                Image(systemName: "circle")
                Image(systemName: "circle")
            case 1.1...1.5:
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                Image(systemName: "circle")
                Image(systemName: "circle")
                Image(systemName: "circle")
            case 1.6...2.0:
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                Image(systemName: "circle")
                Image(systemName: "circle")
                Image(systemName: "circle")
            case 2.1...2.5:
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                Image(systemName: "circle")
                Image(systemName: "circle")
            case 2.6...3.0:
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                Image(systemName: "circle")
                Image(systemName: "circle")
            case 3.1...3.5:
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                Image(systemName: "circle")
            case 3.6...4.0:
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                Image(systemName: "circle")
            case 4.0:
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                Image(systemName: "circle")
                    .foregroundColor(.blue)
                Image(systemName: "circle")
                    .foregroundColor(.blue)
            default:
                Image(systemName: "circle")
                Image(systemName: "circle")
                Image(systemName: "circle")
                Image(systemName: "circle")
            }
        }
    }
}
