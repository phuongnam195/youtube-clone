//
//  HomeCategoryBar.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 23/6/24.
//

import SwiftUI



struct HomeCategoryBar: View {
    var homeVM: HomeViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button(action: {
                    
                }) {
                    Image(systemName: "safari")
                        .frame(height: 24)
                        .foregroundStyle(.black)
                }
                .buttonStyle(.bordered)
                .padding(.horizontal, 10)
                
                
                HStack {
                    ForEach(homeVM.allCategories, id: \.self) { category in
                        TabButton(name: category.name, isSelected: category == homeVM.category) {
                            if category == homeVM.category {
                                return
                            }
                            homeVM.category = category
                            Task {
                                await homeVM.refreshVideos()
                                print("refreshVideos")
                            }
                        }
                    }
                }
                .onFirstAppear {
                    Task {
                        await homeVM.loadCategories()
                        print("loadCategories")
                    }
                }
            }
        }
    }
}

private struct TabButton: View {
    let name: String
    let isSelected: Bool
    let callback: () -> Void
    
    var body: some View {
        Button(action: {
            callback()
        }) {
            Text(name)
                .foregroundStyle(isSelected ? .white : .black)
        }
        .if(isSelected) { $0.buttonStyle(.borderedProminent) }
        .if(!isSelected) { $0.buttonStyle(.bordered) }
        .tint(isSelected ? .black : nil)
    }
}

#Preview {
    HomeCategoryBar(homeVM: HomeViewModel(VideoCategoryRepositoryImpl(), VideoRepositoryImpl(), ChannelRepositoryImpl()))
}
