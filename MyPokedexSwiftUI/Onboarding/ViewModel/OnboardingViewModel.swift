//
//  OnboardingViewModel.swift
//  MyPokedexSwiftUI
//
//  Created by Samuel Freitas on 05/12/24.
//

import Foundation


class OnboardingViewModel: ObservableObject {
    @Published var showSplash: Bool = true
    @Published var currentStep: Int = 0
    @Published var onboardingSteps: [OnboardingStep] = [
        OnboardingStep(
            title: "Todos os Pokémons em um só Lugar",
            description: "Acesse uma vasta lista de Pokémon de todas as gerações já feitas pela Nintendo",
            buttonText: "Continuar"),
        
        OnboardingStep(
            title: "Mantenha sua Pokédex atualizada",
            description: "Cadastre-se e mantenha seu perfil, pokémon favoritos, configurações e muito mais, salvos no aplicativo, mesmo sem conexão com a internet.",
            buttonText: "Vamos começar!")
    ]
}
