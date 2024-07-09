//
//  CircleNetworkImage.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 23/6/24.
//

import SwiftUI

struct CircleNetworkImage: View {
    let url: String
    let size: Double
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size, height: size)
                    .cornerRadius(size / 2)
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: size, height: size)
                    .cornerRadius(size / 2)
            @unknown default:
                EmptyView()
            }
        }
    }
}


#Preview {
    CircleNetworkImage(url: "https://picsum.photos/50", size: 30)
}
