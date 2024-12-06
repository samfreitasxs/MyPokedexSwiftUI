//
//  ContentView.swift
//  MyPokedexSwiftUI
//
//  Created by Samuel Freitas on 04/12/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    var body: some View {
        ZStack {
            if viewModel.showSplash {
                SplashView()
            } else {
                TabView(selection: $viewModel.currentStep) {
                    ForEach(0..<viewModel.onboardingSteps.count, id: \.self) {
                        index in
                        VStack {
                            trainersImages
                            Spacer().frame(height: 45)
                            titleAndDescription(title: viewModel.onboardingSteps[index].title, description: viewModel.onboardingSteps[index].description)
                            Spacer().frame(height: 24)
                            onboardingProgressView
                            Spacer().frame(height: 24)
                            continueButton(buttonText: viewModel.onboardingSteps[index].buttonText)
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                               maxHeight: .infinity,
                               alignment: .bottom)
                    .padding()
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
        } .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation{
                    self.viewModel.showSplash = false
                }
            }
        }
    }
    
    @ViewBuilder
    var trainersImages: some View {
        if viewModel.currentStep == 0 {
            // Utilizando a ZSstack para sobrepor as imagens.
            ZStack {
                Image("trainer1")
                // Com o (.offset) pode se mudar os eixos com x e y.
                    .offset(x: -50)
                //Background pode se colocar imagens atras.
                    .background {
                        Image("shadowTrainer1")
                            .offset(x: -70, y: 120)
                    }
                Image("trainer2")
                    .offset(x: 50, y: -10)
                    .background{
                        Image("shadowTrainer2")
                            .offset(x: 50, y: 115)
                    }
                // Eixo X e o orizontal e o Y e vertical.
            }
        } else {
            Image("trainer3")
                .background{
                    Image("shadowTrainer3")
                        .offset(x: -10,y: 128)
                }
        }

    }
    
    func titleAndDescription(title: String, description: String) -> some View {
        VStack (spacing: 16) {
            Text(title)
                .font(Font.custom("Poppins-Medium", size: 26))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Primary"))
            // (.multilineTextAlignment)Alinhar textos com mais de uma linha
            Text(description)
                .font(Font.custom("Poppins-Regular", size: 14))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Secondary"))
        }
    }
    
    @ViewBuilder
    var onboardingProgressView: some View {
        if viewModel.currentStep == 0 {
            HStack {
                Rectangle()
                    .frame(width: 28, height: 9)
                    .clipShape(.capsule)
                    .foregroundColor(Color("DarkBlue"))
                Circle()
                    .frame(width: 9, height: 9)
                    .foregroundStyle(Color(.lightGray))
            }
        } else {
            HStack {
                Circle()
                    .frame(width: 9, height: 9)
                    .foregroundStyle(Color(.lightGray))
                Rectangle()
                    .frame(width: 28, height: 9)
                    .clipShape(.capsule)
                    .foregroundColor(Color("DarkBlue"))
            }
        }
        
    }
    
    func continueButton(buttonText: String) -> some View {
        Button(action: {
            viewModel.currentStep = 1
        }, label: {
            Rectangle()
                .frame(height: 58)
                .clipShape(.capsule)
                .foregroundColor(Color("DarkBlue"))
                .overlay {
                    //overlay e sendo usado para colocar encima ou na frente
                    Text(buttonText)
                        .foregroundStyle(.white)
                        .font(Font.custom("Poppins-SemiBold", size: 18))
                }
        })
    }
}

#Preview {
    ContentView(viewModel: OnboardingViewModel())
}
