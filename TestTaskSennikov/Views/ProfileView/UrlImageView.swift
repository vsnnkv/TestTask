//
//  UrlImageView.swift
//  TestTaskSennikov
//
//  Created by Владимир Сенников on 05.05.2022.
//

import SwiftUI

    struct UrlImageView: View {
        @ObservedObject var urlImageModel: UrlImageModel
        
        init(urlString: String?) {
            urlImageModel = UrlImageModel(urlString: urlString)
        }
        
        var body: some View {
            Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
        }
        
        static var defaultImage = UIImage(named: "IMG_4138 2")
    }
