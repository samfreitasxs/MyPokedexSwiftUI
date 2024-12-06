//
//  OnboardingView.swift
//  MyPokedexSwiftUI
//
//  Created by Samuel Freitas on 04/12/24.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    var body: some View {
        ZStack {
            if viewModel.showSplash {
                SplashView()
            } else {
                TabView(selection: $viewModel.currentStep) {
                    ForEach(Array(viewModel.onboardingSteps.enumerated()), id: \.offset) {index,step in
                        //Retorno do ixdex e o step em si, o conteudo do meu array que estou retornando.
                        //Passadno o id o forEach sabe como inteirar.
                        //O index vai me retornar um inteiro e o step me passa o elemento.
                        VStack {
                            trainersImages(stepIndex: index)
                            Spacer().frame(height: 45)
                            titleAndDescription(title: step.title, description: step.description)
                            //Passando o step do titulo e o o step do description.
                            Spacer().frame(height: 50)
                            //onboardingProgressView
                            continueButton(buttonText: step.buttonText)
                        }
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                               maxHeight: .infinity,
                               alignment: .bottom)
                    .padding()
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .overlay {
                    HStack {
                        ForEach(viewModel.onboardingSteps.indices, id: \.self) {
                            index in
                            Capsule()
                                .foregroundStyle(viewModel.currentStep == index ? Color(PokedexColors.blue) : Color(PokedexColors.seconday))
                                .frame(width: viewModel.currentStep == index ? 28 : 9, height: 9)
                                .animation(.bouncy, value: viewModel.currentStep)
                        }
                    }
                    .frame(maxWidth: .infinity ,
                           maxHeight: .infinity,
                           alignment: .bottom)
                    .padding(.bottom, 95)
                }
            }
        } .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation{
                    self.viewModel.showSplash = false
                }
            }
        }
    }
    
    @ViewBuilder
    func trainersImages(stepIndex: Int) -> some View {
        if stepIndex == 0 {
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
                .font(FontMaker.makeFont(.poppinsMedium, 26))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color(PokedexColors.primary))
            // (.multilineTextAlignment)Alinhar textos com mais de uma linha
            Text(description)
                .font(FontMaker.makeFont(.poppinsRegular, 14))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color(PokedexColors.seconday))
        }
    }
    
    @ViewBuilder
    var onboardingProgressView: some View {
        if viewModel.currentStep == 0 {
            HStack {
                Rectangle()
                    .frame(width: 28, height: 9)
                    .clipShape(.capsule)
                    .foregroundColor(Color(PokedexColors.blue))
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
                    .foregroundColor(Color(PokedexColors.blue))
            }
        }
        
    }
    
    @ViewBuilder
    func continueButton(buttonText: String) -> some View {
        if viewModel.currentStep == 0 {
            Button(action: {
                withAnimation {
                    viewModel.currentStep = 1
                }
            }, label: {
                Rectangle()
                    .frame(height: 58)
                    .clipShape(.capsule)
                    .foregroundStyle(PokedexColors.blue)
                    .overlay {
                        Text(buttonText)
                            .foregroundStyle(.white)
                            .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                    }
            })
        } else {
            NavigationLink {
                LoginOrSingUpView()
            } label: {
                Rectangle()
                    .frame(height: 58)
                    .clipShape(.capsule)
                    .foregroundStyle(PokedexColors.blue)
                    .overlay {
                        Text(buttonText)
                            .foregroundStyle(.white)
                            .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                    }
            }
        }
    }
    
    var onboardingIndicator: some View {
        HStack {
            ForEach(viewModel.onboardingSteps.indices, id: \.self) { index in
                    Capsule()
                    .foregroundStyle(viewModel.currentStep == index ? PokedexColors.blue : PokedexColors.seconday)
                    .frame(width: viewModel.currentStep == index ? 28 : 9, height: 9)
                    .animation(.bouncy, value: viewModel.currentStep)
            }
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .bottom)
        .padding(.bottom, 95)
    }
    
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
