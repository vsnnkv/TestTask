//
//  MarketModel.swift
//  TestTaskSennikov
//
//  Created by Владимир Сенников on 02.05.2022.
//

import Foundation

struct Market: Identifiable {
    var id = UUID()
    var coinImage: String
    var coinName: String
    var coinShortName: String
    var price: String
    var priceChanging: String
}

extension Market {
    static let demoMarket = [Market(coinImage: "ethImage", coinName: "Etherium", coinShortName: "ETH", price: "$2678.95", priceChanging: "+4.95%"),
                             Market(coinImage: "eth2Image", coinName: "Ethereum 2", coinShortName: "ETH2", price: "$2,383.65", priceChanging: "+4.91%"),
                             Market(coinImage: "usdtImage", coinName: "Tether", coinShortName: "USDT", price: "$2.00", priceChanging: "-0.05%"),
                             Market(coinImage: "bnbImage", coinName: "Binance Coin", coinShortName: "BNB", price: "$352.50", priceChanging: "-0.27%"),
                             Market(coinImage: "adaImage", coinName: "Cardano", coinShortName: "ADA", price: "$2,836,137.20", priceChanging: "+4.11%"),
                             Market(coinImage: "linkImage", coinName: "Chain link", coinShortName: "LINK", price: "$2,836,137.20", priceChanging: "+2.23%"),
                             Market(coinImage: "btcImage", coinName: "Bitcoin", coinShortName: "BTC", price: "$36,751.20", priceChanging: "+2.23%")
    ]
    
    
}
