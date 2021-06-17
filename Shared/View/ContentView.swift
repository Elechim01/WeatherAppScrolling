//
//  ContentView.swift
//  Shared
//
//  Created by Michele Manniello on 16/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if #available(iOS 15.0, *){
//            Since Window is Decrepted in IOS 15...
//            Getting Safe Area using Geometry Reader
            GeometryReader{proxy in
                let topEdge = proxy.safeAreaInsets.top
                Home(topEge: topEdge)
                    .ignoresSafeArea(.all,edges: .top)
            }
            
            
        }else{
        Text("Hello, world!")
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
