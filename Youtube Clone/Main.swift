//
//  Main.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 23/6/24.
//

import SwiftUI

@main
struct Youtube_CloneApp: App {
    @State private var inited = false
    
    var body: some Scene {
        WindowGroup {
            if inited {
                MainScreen()
            }
            else {
                ProgressView()
                    .onAppear() {
                        ServiceRegistry.registerAllServices()
                        inited = true
                    }
            }
        }
    }
}
