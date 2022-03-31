//
//  RGBullsEyeApp.swift
//  RGBullsEye
//
//  Created by Nyi Ye Han on 31/03/2022.
//

import SwiftUI

@main
struct RGBullsEyeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5,showAlert: false)
        }
    }
}
