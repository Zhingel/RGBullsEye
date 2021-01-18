//
//  RGBullsEyeApp.swift
//  RGBullsEye
//
//  Created by Стас Жингель on 17.01.2021.
//

import SwiftUI

@main
struct RGBullsEyeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
        }
    }
}
