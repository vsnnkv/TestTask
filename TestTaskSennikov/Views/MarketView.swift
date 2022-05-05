//
//  MarketView.swift
//  TestTaskSennikov
//
//  Created by Владимир Сенников on 02.05.2022.
//

import SwiftUI

struct MarketView: View {
    
    let demoMarket = Market.demoMarket
    
    @State var color = 0
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List(demoMarket, id: \.id) { demoMarket in
                    HStack(spacing: 0) {
                        HStack{
                            
                            Image(demoMarket.coinImage)
                                .frame(width: 46, height: 46)
                                                            
                            VStack(alignment: .leading, spacing: 7) {
                                
                                Text(demoMarket.coinName)
                                    .foregroundColor(Color.white)
                                    .fontWeight(.semibold)
                                
                                Text(demoMarket.coinShortName)
                                    .foregroundColor(Color.textGray)
                            }
                            
                            Spacer ()
                            
                            VStack (alignment: .trailing, spacing: 7) {
                                
                                Text(demoMarket.price)
                                    .foregroundColor(Color.textGray)
                                    .fontWeight(.semibold)
                                
                                Text(demoMarket.priceChanging)
                                    .foregroundColor(changeColor(priceChanging: demoMarket.priceChanging))
                            }
                        }
                        
                        NavigationLink {
                            
                            CurrencyView(coin: demoMarket)
                        } label: {            
                        }
                        .frame(width: 0)
                        .opacity(0)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .listRowBackground(Color.backgroundBlack)
//                    .listStyle(SidebarListStyle())
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                }
                .navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                .background(Color.backgroundBlack.ignoresSafeArea())
                .onAppear{
                    UITableView.appearance().backgroundColor = UIColor(Color.backgroundBlack)
                }
            }
            
            Spacer ()
                .layoutPriority(1)
        }
        .background(Color.backgroundBlack)
    }
}

struct MarketView_Previews: PreviewProvider {
    static var previews: some View {
        MarketView()
    }
}

extension MarketView {
    func changeColor(priceChanging: String) -> Color {
        if priceChanging.contains("+") {
            return Color.textGreen
        } else {
            return Color.textRed
        }
    }
}
