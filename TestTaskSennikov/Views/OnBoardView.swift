//
//  OnBoardView.swift
//  TestTaskSennikov
//
//  Created by Владимир Сенников on 02.05.2022.
//

import SwiftUI

struct OnBoardView: View {
    
    let onBoard = OnBoardModel.onBoardModel
    
    @State private var index = 0
    
    @State private var willMoveToNextScreen = false
    
    
    var body: some View {
        ZStack{
            
            VStack(alignment: .center) {
                
                Image(onBoard[index].imageName)
                
                VStack {
                    
                    Text(onBoard[index].title)
                        .foregroundColor(Color.white)
                        .fontWeight(.semibold)
                        .font(Font.custom("SFProText-Semibold", size: 32))
                        .padding(.top, 40)
                    
                    Text(onBoard[index].description)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .lineSpacing(1.26)
                        .foregroundColor(Color.gray)
                        .font(Font.custom("SFProText-Semibold", size: 16))
                        .padding(.top, 16)
                        .padding([.leading, .trailing], 47)
                    
                    Button {
                        index += 1
                        if index >= 3 {
                            willMoveToNextScreen = true
                            index = 2
                            UserDefaults.standard.set(true, forKey: "didLaunchBefore")
                        }
                        
                    } label: {
                        
                        Text("Continue")
                            .fontWeight(.semibold)
                            .frame(width:295, height: 56)
                            .foregroundColor(.white)
                            .font(Font.custom("SFProText-Semibold", size: 16))
                            .background(RoundedRectangle(cornerRadius: 12).stroke(LinearGradient(gradient: Gradient(colors: [Color.firstPinkGradient, Color.secondPinkGradient]), startPoint: .bottomLeading, endPoint: .topTrailing)))
                            
                            
                    }
                    .background(LinearGradient(gradient: Gradient(colors: [Color.firstPinkGradient, Color.secondPinkGradient]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .cornerRadius(30)
                    .padding(.top, 24)
                    .padding(.bottom, 30)
                    .padding([.leading, .trailing], 20)
                    
                    
                    
                }
                .background(Color.tabBarColor)
                .cornerRadius(30)
                .padding([.leading, .trailing], 20)
                .padding(.top, 72)
                
            }
            
            Spacer()
                .layoutPriority(1)
        }
        .background(Color.backgroundBlack)
        .edgesIgnoringSafeArea(.all)
        .navigate(to: ContentView(), when: $willMoveToNextScreen)
        
        
    }
}

struct OnBoardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardView()
    }
}
