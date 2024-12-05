//
//  SplashView.swift
//  MyPokedexSwiftUI
//
//  Created by Samuel Freitas on 05/12/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color("AzulBackground")
            Image("PokedexLogo")
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
