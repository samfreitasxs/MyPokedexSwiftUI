//
//  ContentView.swift
//  MyPokedexSwiftUI
//
//  Created by Samuel Freitas on 04/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            trainersImages
            Spacer().frame(height: 45)
            
            titleAndDescription
            Spacer().frame(height: 24)
            
            onboardingProgressView
            Spacer().frame(height: 24)
            
            continueButton
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               maxHeight: .infinity,
               alignment: .bottom)
        .padding()
    }
    
    var trainersImages: some View {
        // Utilizando a ZSstack para sobrepor as imagens.
        ZStack {
            Image("trainer1 1")
            // Com o (.offset) pode se mudar os eixos com x e y.
                .offset(x: -50)
            //Background pode se colocar imagens atras.
                .background {
                    Image("shadowTrainer1")
                        .offset(x: -70, y: 120)
                }
            Image("trainer2 1")
                .offset(x: 50, y: -10)
                .background{
                    Image("shadowTrainer2")
                        .offset(x: 50, y: 115)
                }
            // Eixo X e o orizontal e o Y e vertical.
        }
    }
    
    var titleAndDescription: some View {
        VStack (spacing: 16) {
            Text("Todos os Pokémons em um só Lugar")
                .font(Font.custom("Poppins-Medium", size: 26))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Primary"))
            // (.multilineTextAlignment)Alinhar textos com mais de uma linha
            Text("Acesse uma vasta lista de Pokémon de todas as gerações já feitas pela Nintendo")
                .font(Font.custom("Poppins-Regular", size: 14))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color("Secondary"))
        }
    }
    
    var onboardingProgressView: some View {
        HStack {
            Rectangle()
                .frame(width: 28, height: 9)
                .clipShape(.capsule)
                .foregroundColor(Color("DarkBlue"))
            Circle()
                .frame(width: 9, height: 9)
                .foregroundStyle(Color(.lightGray))
        }
    }
    
    var continueButton: some View {
        Button(action: {
            
        }, label: {
            Rectangle()
                .frame(height: 58)
                .clipShape(.capsule)
                .foregroundColor(Color("DarkBlue"))
                .overlay {
                    //overlay e sendo usado para colocar encima ou na frente
                    Text("Continuar")
                        .foregroundStyle(.white)
                        .font(Font.custom("Poppins-SemiBold", size: 18))
                }
        })
    }
}

#Preview {
    ContentView()
}
