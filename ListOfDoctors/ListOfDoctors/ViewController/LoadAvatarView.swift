//
//  LoadAvatar.swift
//  ListOfDoctors
//
//  Created by Николай Чупреев on 13.03.2024.
//

import SwiftUI

struct LoadAvatarView: View {
    
    var user: UserResponse
    
    var body: some View {
        
        if let avatar = loadAvatar(user: user) {
            avatar
        } else {
            Image(systemName: "person.circle")
                .resizable()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
        }
    }
    
    func loadAvatar(user: UserResponse) -> (some View)?? {
        if let url = URL(string: user.avatar ?? "") {
            return AnyView(AsyncImage(url: url) { image in
                switch image {
                case .empty:
                    Image(systemName: "person.circle")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                case .success(let image):
                    image
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                default:
                    ProgressView()
                        .frame(width: 60, height: 60)
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                }
            })
        } else {
            return AnyView(
                Image(systemName: "person.circle")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 60, height: 60)
            )
        }
    }
}
