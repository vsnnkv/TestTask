//
//  OnBoardModel.swift
//  TestTaskSennikov
//
//  Created by Владимир Сенников on 02.05.2022.
//

import Foundation
struct OnBoardModel: Identifiable, Hashable {
    var id = UUID()
    var imageName: String
    var title: String
    var description: String
    
    
}

extension OnBoardModel {
    static let onBoardModel = [OnBoardModel(imageName: "walletImage", title: "Easiness", description: "Supplying the convenient transactions chains"),
                               OnBoardModel(imageName: "protectImage", title: "Security", description: "Providing crypto audience with high-tech security solutions"),
                               OnBoardModel(imageName: "rocketImage", title: "Transormation", description: "Diversifying crypto investment experience worldwide")]
}
