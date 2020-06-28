//
//  ContentView.swift
//  CatalogDataCore
//
//  Created by Ivan Dosev Dimitrov on 28.03.20.
//  Copyright © 2020 Ivan Dosev Dimitrov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
          Catalog()
                .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Catalog")
                         }
                         .tag(1)
          Firms()
            .tabItem { VStack {
                              Image(systemName: "magnifyingglass")
                              Text("Firms")
                              }
                         }
                        .tag(2)
            Rissk()
              .tabItem { VStack {
                                Image(systemName: "magnifyingglass")
                                Text("Rissk")
                                }
                           }
                          .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
