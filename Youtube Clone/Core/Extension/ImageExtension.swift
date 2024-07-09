//
//  ImageExtension.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 30/6/24.
//

import SwiftUI

extension Image {
    func centerCropped() -> some View {
        Color.clear
        .overlay(
            self
            .resizable()
            .scaledToFill()
        )
        .clipped()
    }
}
