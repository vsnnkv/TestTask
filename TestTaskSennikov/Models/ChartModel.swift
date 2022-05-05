//
//  chartModel.swift
//  TestTaskSennikov
//
//  Created by Владимир Сенников on 05.05.2022.
//

import Foundation

struct ChartModel: Identifiable, Hashable {
    var id = UUID()
    var coinImageName: String
    var coinName: String
    var coinShortName: String
    var chartImageName: String
    var price: String
    var priceChanging: String
}

extension ChartModel {
    static let demoChart = [
    ChartModel(coinImageName: "bnbImage", coinName: "Binance Coin", coinShortName: "BNB", chartImageName: "bnbChart", price: "$352,20", priceChanging: "▾ 0.27%"),
    ChartModel(coinImageName: "adaImage", coinName: "Cardano", coinShortName: "ADA", chartImageName: "adaChart", price: "$2,936,136.20", priceChanging: "▴ 4.11%")]
}
