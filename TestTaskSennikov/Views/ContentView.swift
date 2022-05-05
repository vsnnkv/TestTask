//
//  ContentView.swift
//  TestTaskSennikov
//
//  Created by Владимир Сенников on 02.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection = 0
    
//    @State var selectedIndex: Int = 0

    
    var body: some View {
//        CustomTabView(tabs: TabType.allCases.map({ $0.tabItem }), selectedIndex: $selectedIndex) { index in
//                    let type = TabType(rawValue: index) ?? .profile
//                    getTabView(type: type)
//                }
//    }
//    @ViewBuilder
//      func getTabView(type: TabType) -> some View {
//          switch type {
//          case .profile:
//              ProfileView()
//          case .market:
//              MarketView()
//          }
//      }
//  }
        
        TabView(selection: $selection) {
            
            ProfileView()
                .preferredColorScheme(.dark)
                .tabItem {
                    
                    if selection == 0 {
                        
                        VStack(spacing: 20){
                            
                            Spacer()
                            
                            Image("profileIconSelected")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }

                    } else {
                        
                        VStack {
                            
                            Spacer()
                            
                            Image("profileIcon")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                    }
                }
                .tag(0)

            MarketView()
                .preferredColorScheme(.dark)
                .tabItem {
                    if selection == 1 {
                        
                        Image("marketIconSelected")
                            .resizable()
                            .frame(width: 24, height: 24)
                    } else {
                        
                        Image("marketIcon")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
                .tag(1)
        }
        .onAppear{
            let appearance = UITabBarAppearance()

            appearance.backgroundColor = UIColor(Color.tabBarColor)
            
            UITabBar.appearance().standardAppearance = appearance
             

                UITabBar.appearance().scrollEdgeAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
