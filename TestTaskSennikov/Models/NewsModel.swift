//
//  NewsModel.swift
//  TestTaskSennikov
//
//  Created by Владимир Сенников on 02.05.2022.
//

import Foundation

struct News: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var imageName: String
    var coinNews: String
    var time: String
}

//extension News: Equatable {
//    static func == (lhs: News, rhs: News) -> Bool {
//        return lhs.id == rhs.id
//    }
//}

extension News {
    static let demoNews = [
        News(title: "Six XRP Token Holders to Speak in Ripple-SEC Case as Circle Gets Subpoena", imageName: "demoNews1", coinNews: "Altcoin news", time: "6 min ago" ),
        News(title: "Bitcoin Eyes Key Upside Break, Outperforms Ethereum, DOGE Rallies", imageName: "demoNews2", coinNews: "Bitcoin news", time: "6 min ago")
    ]
}
