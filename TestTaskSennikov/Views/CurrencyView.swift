//
//  CurrencyView.swift
//  TestTaskSennikov
//
//  Created by Владимир Сенников on 03.05.2022.
//

import SwiftUI

struct CurrencyView: View {
    
    var coin: Market
    
    @State private var coinToBuy: String = ""
    @State private var dollarsToBuy: String = ""
    @State private var lineLimit: Int = 6
    @State var shouldHideButton = false

    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var backButton: some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image("backButtonImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
        }
    }
        
    }
    var body: some View {
        
        ZStack {
            ScrollView {
                VStack {
                    Text(coin.price)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .font(Font.custom("SFProText-Semibold", size: 32))
                        .padding(.top, 0)
                        .padding(.bottom, 0)
                    Text(coin.priceChanging)
                        .foregroundColor(changeColor(priceChanging: coin.priceChanging))
                        .font(Font.custom("SFProText-Regular", size: 16))
                        .padding(.top, 16)
                    HStack(alignment: .center, spacing: 60) {
                        VStack(alignment: .center, spacing: 7) {
                            Text("24h Low")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.gray)
                                .font(Font.custom("SFProText-Semibold", size: 12))
                            Text("$ 45 848")
                                .fontWeight(.semibold)
                                .lineLimit(1)
                                .foregroundColor(Color.white)
                                .font(Font.custom("SFProText-Semibold", size: 16))
                        }
                        .padding(.leading, 20)
                        
                        VStack(alignment: .center, spacing: 7) {
                            Text("24h High")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.gray)
                                .font(Font.custom("SFProText-Semibold", size: 12))
                            Text("$ 49300")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .font(Font.custom("SFProText-Semibold", size: 16))
                        }
                        
                        VStack(alignment: .center, spacing: 7) {
                            Text("Volume (\(coin.coinShortName))")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.gray)
                                .font(Font.custom("SFProText-Semibold", size: 12))
                            Text("0.0387")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                                .font(Font.custom("SFProText-Semibold", size: 16))
                        }
                        .padding(.trailing, 20)
                    }
                    .frame(width: UIScreen.main.bounds.size.width)
                    .padding(.top, 26)
                    .padding(.bottom, 38)

                }
                .padding(.top, 26)
                .background(Color.tabBarColor)
                .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                
                VStack(alignment: .leading) {
                    HStack{
                    TextField(
                        "0",
                        text: $coinToBuy)
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                        Text(coin.coinShortName)
                            .padding(.trailing, 20)
                    }
                    Image("separatorImage")
                        .resizable()
                        .scaledToFit()
                        .padding([.leading, .trailing], 20)
                        .padding(.top, 6)
                    Text("Available: 0 \(coin.coinShortName)")
                        .fontWeight(.semibold)
                        .font(Font.custom("SFProText-Semibold", size: 12))
                        .foregroundColor(Color.gray)
                        .padding(.leading, 20)
                        .padding(.top, 6)
                    
                }
                .padding(.top, 42)
                
                VStack(alignment: .leading) {
                    HStack{
                    TextField(
                        "0",
                        text: $dollarsToBuy)
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                        Text("USD")
                            .padding(.trailing, 20)
                    }
                    Image("separatorImage")
                        .resizable()
                        .scaledToFit()
                        .padding([.leading, .trailing], 20)
                        .padding(.top, 6)
                    Text("Available: 0 USD")
                        .fontWeight(.semibold)
                        .font(Font.custom("SFProText-Semibold", size: 12))
                        .foregroundColor(Color.gray)
                        .padding(.leading, 20)
                        .padding(.top, 6)
                }
                .padding(.top, 32)
                
                HStack {
                    Button {
                        
                    } label: {
                        VStack{
                        Text("Buy \(coin.coinShortName)")
                                .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .font(Font.custom("SFProText-Semibold", size: 16))
                            .padding(.bottom, 2)
                            Text("\(calculateByuing(amountOfCoins:coinToBuy)) USD ≈ \(coinToBuy) \(coin.coinShortName)")
                                .font(Font.custom("SFProText-Regular", size: 12))
                        }
                        .frame(width: 162, height: 70)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(LinearGradient(gradient: Gradient(colors: [Color.firstPinkGradient, Color.secondPinkGradient]), startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: 2))
                    }
                    .frame(width: 162, height: 70)
                    .background(Color(red: 39/255, green: 43/255, blue: 64/255))
                    .cornerRadius(12)
                    
                    Spacer()
                    Button {
                        
                    } label: {
                        VStack{
                        Text("Sell \(coin.coinShortName)")
                                .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .font(Font.custom("SFProText-Semibold", size: 16))
                            .padding(.bottom, 2)
                            Text("\(calculateSelling(amountOfDollars:dollarsToBuy)) \(coin.coinShortName) ≈ \(dollarsToBuy) USD")
                                .font(Font.custom("SFProText-Regular", size: 12))
                        }
                        .frame(width: 162, height: 70)
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(LinearGradient(gradient: Gradient(colors: [Color.firstPinkGradient, Color.secondPinkGradient]), startPoint: .bottomLeading, endPoint: .topTrailing), lineWidth: 2))
                    }
                    .frame(width: 162, height: 70)
                    .background(Color(red: 39/255, green: 43/255, blue: 64/255))
                    .cornerRadius(12)
                }
                .padding(.top, 21)
                .padding([.leading, .trailing], 20)
                
                Text("💸 About \(coin.coinShortName)")
                    .fontWeight(.semibold)
                    .font(Font.custom("SFProText-Semibold", size: 20))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 44)
                    .padding(.leading, 20)
                                    
                if #available(iOS 15.0, *) {
                    Text("Bitcoin is a decentralized digital currency created in January 2009. It follows the ideas set out in a whitepaper by the mysterious and pseudonymous Satoshi Nakamoto. \n \nThe identity of the person or persons who created the technology is still a mystery. Bitcoin offers the \nBitcoin is a decentralized digital currency created in January 2009. It follows the ideas set out in a whitepaper by the mysterious and pseudonymous Satoshi Nakamoto. \nThe identity of the person or persons who created the technology is still a mystery.")
                        .mask {
                            if shouldHideButton {
                                Color.white
                            } else {
                                LinearGradient(colors: [.white, .clear], startPoint: .top, endPoint: .bottom)
                            }
                        }
                        .font(Font.custom("SFProText-Regular", size: 14))
                        .padding(.top, 18)
                        .padding([.leading, .trailing], 20)
                        .lineLimit(lineLimit)
                } else {
                    Text("Bitcoin is a decentralized digital currency created in January 2009. It follows the ideas set out in a whitepaper by the mysterious and pseudonymous Satoshi Nakamoto. \n \nThe identity of the person or persons who created the technology is still a mystery. Bitcoin offers the \nBitcoin is a decentralized digital currency created in January 2009. It follows the ideas set out in a whitepaper by the mysterious and pseudonymous Satoshi Nakamoto. \nThe identity of the person or persons who created the technology is still a mystery.")
                        .font(Font.custom("SFProText-Regular", size: 14))
                        .padding(.top, 18)
                        .padding([.leading, .trailing], 20)
                        .lineLimit(lineLimit)
                        .background(shouldHideButton ? Color.white : Color(LinearGradient(colors: [.white, .clear], startPoint: .top, endPoint: .bottom) as! CGColor))
                    
                }
                
                
                Button {
                    lineLimit = .max
                    self.shouldHideButton = true
                } label: {
                    LinearGradient(gradient: Gradient(colors: [Color.firstPinkGradient, Color.secondPinkGradient]), startPoint: .bottomLeading, endPoint: .topTrailing)
                        .mask(Text("Show more +"))
                        .font(Font.custom("SFProText-Semibold", size: 16))
                        .padding(.top, 2)
                }
                .frame(height: 20)
                .opacity(shouldHideButton ? 0:1)
                
                HStack {
                    Text ("Rank")
                        .fontWeight(.semibold)
                        .font(Font.custom("SFProText-Semibold", size: 16))
                        .foregroundColor(Color.white)
                        .padding([.top, .bottom, .leading], 14)
                    
                    Spacer()
                    
                    Text ("№1")
                        .font(Font.custom("SFProText-Regular", size: 16))
                        .foregroundColor(Color.gray)
                        .padding(.trailing, 14)
                }
                .background(Color(red: 39/255, green: 43/255, blue: 64/255))
                .cornerRadius(12)
                .padding([.leading, .trailing], 20)
                .padding(.top, 24)
                
                HStack {
                    Text ("Launch Date")
                        .fontWeight(.semibold)
                        .font(Font.custom("SFProText-Semibold", size: 16))
                        .foregroundColor(Color.white)
                        .padding([.top, .bottom, .leading], 14)
                    
                    Spacer()
                    
                    Text ("January 3, 2009")
                        .font(Font.custom("SFProText-Regular", size: 16))
                        .foregroundColor(Color.gray)
                        .padding(.trailing, 14)
                }
                .background(Color(red: 39/255, green: 43/255, blue: 64/255))
                .cornerRadius(12)
                .padding([.leading, .trailing, .bottom], 20)
                .padding(.top, 12)
                
                Spacer ()
                    .layoutPriority(1)
            }
            
        }
        .background(Color.backgroundBlack)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("\(coin.coinShortName)/USD").foregroundColor(Color.white)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .navigationBarColor(UIColor(red: 39/255, green: 43/255, blue: 64/255, alpha: 1))  
    }
    
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        
        let coinPreview = Market(coinImage: "btcImage", coinName: "", coinShortName: "", price: "", priceChanging: "")
        
        CurrencyView(coin: coinPreview)
    }
}


//MARK: extension for funcs
extension CurrencyView {
    
    func changeColor(priceChanging: String) -> Color {
        if priceChanging.contains("+") {
            return Color.green
        } else {
            return Color.red
        }
    }
    

    
    
    func calculateByuing (amountOfCoins: String) -> String {
        
        var coinPrice = coin.price
        coinPrice = coinPrice.replacingOccurrences(of: "$", with: "")
        coinPrice = coinPrice.replacingOccurrences(of: ",", with: "")
        
        let priceInUSD = (Double(coinPrice) ?? 100.0) * (Double(amountOfCoins) ?? 0)
        
        return String(format: "%.2f", priceInUSD)
    }
    
    func calculateSelling (amountOfDollars: String) -> String {
        
        var coinPrice = coin.price
        coinPrice = coinPrice.replacingOccurrences(of: "$", with: "")
        coinPrice = coinPrice.replacingOccurrences(of: ",", with: "")
        
        let priceInCoin = (Double(amountOfDollars) ?? 0) / (Double (coinPrice) ?? 0)
        
        return String(format: "%.2f", priceInCoin)

    }
}
