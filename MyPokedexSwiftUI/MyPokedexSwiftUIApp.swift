//
//  MyPokedexSwiftUIApp.swift
//  MyPokedexSwiftUI
//
//  Created by Samuel Freitas on 04/12/24.
//

import SwiftUI

@main
struct MyPokedexSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            //Mudando a chamada do WindowGroup para chamar a view.
            OnboardingView()
        }
    }
}
