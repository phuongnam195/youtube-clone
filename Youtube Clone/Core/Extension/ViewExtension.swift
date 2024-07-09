//
//  ViewExtension.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 23/6/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition { transform(self) }
        else { self }
    }
    
    func onFirstAppear( perform: @escaping () -> Void ) -> some View {
        return self.modifier(OnFirstAppearModifier(perform: perform))
    }
}

struct OnFirstAppearModifier: ViewModifier {
    let perform:() -> Void
    @State private var firstTime: Bool = true
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                if firstTime {
                    firstTime = false
                    self.perform()
                }
            }
    }
}
