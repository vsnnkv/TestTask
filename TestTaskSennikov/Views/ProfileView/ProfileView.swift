//
//  ProfileView.swift
//  TestTaskSennikov
//
//  Created by Владимир Сенников on 02.05.2022.
//

import SwiftUI

struct ProfileView: View {
    
    let demoNews = News.demoNews
    
    let demoChart = ChartModel.demoChart
    
    var body: some View {
        
        ZStack {
            Spacer ()
                .layoutPriority(1)
            
            ScrollView {
                
                VStack {
                    
                    HStack(alignment: .center) {
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("Welcome back,")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.textGray)
                                .font(Font.custom("SFProText-Semibold", size: 16))
                            
                            Text("Matthew 👋🏻")
                                .foregroundColor(Color.white)
                                .fontWeight(.semibold)
                                .font(Font.custom("SFProText-Semibold", size: 24))
                        }
                        
                        Spacer()
                        
                        UrlImageView(urlString: "https://thispersondoesnotexist.com/image")
                    }
                    .padding([.leading, .trailing], 20)
                    .padding(.top, 30)
                    
                    ZStack {
                        
                        Image ("firstCircle")
                            .resizable()
                            .frame(width: 180, height: 180)
                        
                        Image("secondCircle")
                            .resizable()
                            .frame(width: 180, height: 180)
                        
                        Text("$246.00")
                            .fontWeight(.semibold)
                            .font(Font.custom("SFProText-Semibold", size: 20))
                            .foregroundColor(Color.white)
                            .frame(width: 180, height: 180)
                            .clipShape(Circle())
                    }
                    
                    HStack {
                        
                        Button  {
                            
                        } label: {
                            Text("Deposit")
                                .fontWeight(.semibold)
                                .frame(width: 162, height: 48)
                                .foregroundColor(.white)
                                .font(Font.custom("SFProText-Semibold", size: 16))
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke(LinearGradient(gradient: Gradient(colors: [Color.firstPinkGradient, Color.secondPinkGradient]), startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: 2))
                        }
                        .frame(width: 162, height: 48)
                        .background(Color(red: 39/255, green: 43/255, blue: 64/255))
                        .cornerRadius(12)
                        
                        Spacer ()
                        
                        Button  {
                            
                        } label: {
                            Text("Withdraw")
                                .fontWeight(.semibold)
                                .frame(width: 162, height: 48)
                                .foregroundColor(.white)
                                .font(Font.custom("SFProText-Semibold", size: 16))
                                .overlay(RoundedRectangle(cornerRadius: 12).stroke(LinearGradient(gradient: Gradient(colors: [Color.firstPinkGradient, Color.secondPinkGradient]), startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: 2))
                        }
                        .frame(width: 162, height: 48)
                        .background(Color(red: 39/255, green: 43/255, blue: 64/255))
                        .cornerRadius(12)
                    }
                    .padding([.leading, .trailing], 20)
                    .padding(.top, 30)
                    
                    Text("🔥 Trending")
                        .fontWeight(.semibold)
                        .font(Font.custom("SFProText-Semibold", size: 20))
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                        .padding(.top, 44)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(demoChart, id: \.id) { chart in
                                VStack(alignment: .leading, spacing: 17){
                                    
                                    HStack {
                                        
                                        Image(chart.coinImageName)
                                            .resizable()
                                            .frame(width: 36, height: 36, alignment: .center)
                                            .clipShape(Circle())
                                            .padding(.leading, 15)
                                            .padding(.trailing, 10)
                                        
                                        VStack(alignment: .leading) {
                                            
                                            Text(chart.coinName)
                                                .fontWeight(.semibold)
                                                .font(Font.custom("SFProText-Semibold", size: 16))
                                                .foregroundColor(.white)
                                            
                                            Text(chart.coinShortName)
                                                .font(Font.custom("SFProDisplay-Regular", size: 12))
                                                .foregroundColor(.gray)
                                        }
                                        
                                    }
                                    .padding( .top, 15)
                                    
                                    Image (chart.chartImageName)
                                        .padding(15)
                                    
                                    HStack {
                                        
                                        Text (chart.price)
                                            .fontWeight(.semibold)
                                            .font(Font.custom("SFProDisplay-Semibold", size: 14))
                                            .foregroundColor(.white)
                                        
                                        Spacer ()
                                        
                                        Text (chart.priceChanging)
                                            .fontWeight(.medium)
                                            .font(Font.custom("SFProDisplay-Medium", size: 10))
                                            .foregroundColor(changeColor(priceChanging: chart.priceChanging))
                                    }
                                    .padding([.leading, .trailing, .bottom], 15)
                                }
                                .frame(width: 195)
                                .background(Color(red: 1/1, green: 1/1, blue: 1/1, opacity: 0.12/1))
                                .cornerRadius(18)
                                .padding(.leading, 20)
                            }
                        }
                    }
                    
                    
                    HStack(alignment: .center) {
                        
                        Text("🪙 News")
                            .fontWeight(.semibold)
                            .font(Font.custom("SFProText-Semibold", size: 20))
                            .foregroundColor(.white)
                            .padding(.leading, 20)
                        
                        Spacer ()
                        
                        Button {
                            
                        } label: {
                            LinearGradient(gradient: Gradient(colors: [Color.firstPinkGradient, Color.secondPinkGradient]), startPoint: .bottomLeading, endPoint: .topTrailing)
                                .mask(Text("Show all")
                                    .fontWeight(.semibold))
                                .font(Font.custom("SFProText-Semibold", size: 16))
                                .frame(width: 66, height: 19)
                                .padding(.trailing, 20)
                        }
                    }
                    .padding(.top, 45)
                    
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        ForEach(demoNews, id: \.id) {news in
                            HStack(spacing: 23){
                                
                                Image(news.imageName)
                                    .frame(width: 80, height: 80, alignment: .leading)
                                    .padding(.leading, 0)
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    HStack{
                                        Text(news.coinNews)
                                            .fontWeight(.semibold)
                                        
                                        Text("•")
                                            .fontWeight(.semibold)
                                        
                                        Text(news.time)
                                            .fontWeight(.semibold)
                                    }
                                    .font(Font.custom("SFProText-Semibold", size: 12))
                                    .foregroundColor(Color.textGray)
                                    
                                    Text(news.title)
                                        .fontWeight(.semibold)
                                        .font(Font.custom("SFProText-Semibold", size: 14))
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                        .padding(.trailing, 25)
                                }
                            }
                            .padding(.leading, 17)
                        }
                    }
                    .padding(.leading, 0)
                    .padding(.bottom, 20)
                }
            }
            Spacer()
                .layoutPriority(1)
            
            

        }
        .background(Color.backgroundBlack)
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


extension ProfileView {
    func changeColor(priceChanging: String) -> Color {
        if priceChanging.contains("▴") {
            return Color.green
        } else {
            return Color.red
        }
    }
}
