//
//  HomeHeaderBar.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 23/6/24.
//

import SwiftUI

struct HomeHeaderBar: View {
    var body: some View {
        HStack {
            Image("LabelLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 22)
            
            Spacer()
            
            Button(action: {
                
            }) {
                Image(systemName: "tv.badge.wifi")
                    .font(.system(size: 18))
            }
            .foregroundStyle(.black)
            .padding(.horizontal, 5)
            
            Button(action: {
                
            }) {
                Image(systemName: "bell")
                    .font(.system(size: 20))
            }
            .foregroundStyle(.black)
            .padding(.horizontal, 5)
            
            Button(action: {
                
            }) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 20))
            }
            .foregroundStyle(.black)
            .padding(.horizontal, 5)
        }
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}

#Preview {
    HomeHeaderBar()
}
