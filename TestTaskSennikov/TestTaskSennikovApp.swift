//
//  TestTaskSennikovApp.swift
//  TestTaskSennikov
//
//  Created by Владимир Сенников on 02.05.2022.
//

import SwiftUI

@main
struct TestTaskSennikovApp: App {
    
    @AppStorage("didLaunchBefore") var didLaunchBefore: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if didLaunchBefore {
                ContentView()
            } else {
            OnBoardView()
            }
        }
    }
}


