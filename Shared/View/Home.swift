//
//  Home.swift
//  WeatherAppScrolling
//
//  Created by Michele Manniello on 16/06/21.
//

import SwiftUI

struct Home: View {
    @State var offset : CGFloat = 0
    var topEge : CGFloat
    var body: some View {
        if #available(iOS 15.0, *){
        ZStack{
//            Geomtery Reader for getting height and width...
            GeometryReader{proxy in
                Image("sky")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            .ignoresSafeArea()
//            Blur material..
            .overlay(.ultraThinMaterial)
//            Main View...
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
//                    Weather Data...
                    VStack(alignment: .center, spacing: 5) {
                        Text("San Jose")
                            .font(.system(size: 35))
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                        Text("98°")
                            .font(.system(size: 35))
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())
                        Text("Cloudy")
                            .foregroundStyle(.secondary)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())
                        Text("H:103° L:105")
                            .foregroundStyle(.primary)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())
                    }
                    .offset(y: -offset)
//                    For Botom Drag Effect...
                    .offset(y : offset > 0 ? (offset / UIScreen.main.bounds.width) * 100 : 0)
                    .offset(y: getTitleOffset())
//                    Custom Data View...
                    VStack(spacing:8){
//                        Custom Stack....
//                        Per testing...
                        CustomStackView {
//                            label here
                            Label {
                                Text("Hourly Forecast")
                            } icon: {
                                Image(systemName: "clock")
                            }

                        } contentView: {
//                            content
                            ScrollView(.horizontal,showsIndicators: false){
                                HStack(spacing: 15){
                                    ForecastView(time: "12 PM", celsius: 94, image: "sun.min")
                                    ForecastView(time: "1 PM", celsius: 95, image: "sun.haze")
                                    ForecastView(time: "2 PM", celsius: 96, image: "sun.min")
                                    ForecastView(time: "3 PM", celsius: 97, image: "cloud.sun")
                                    ForecastView(time: "4 PM", celsius: 99, image: "sun.haze")
                                }
                            }
                        }
                        WeatherDataView()

                    }
                }
                .padding(.top,45)
                .padding([.horizontal,.bottom])
//                Getting offset..
                .overlay(
//                    Using Geomtry Reader...
                    GeometryReader{ proxy -> Color in
                    let miny = proxy.frame(in: .global).minY
                    DispatchQueue.main.async {
                        self.offset = miny
                    }
                    return Color.clear
                    }
                )
            }
        }
        }else{
            Text("Hola")
        }
    }
    func getTitleOpacity()->CGFloat{
        let titleOffset = -getTitleOffset()
        let progress = titleOffset / 20
        let opacity = 1-progress
        return opacity
    }
    func getTitleOffset() -> CGFloat{
//        settings one max height for whole title...
//        consider max as 120....
        if offset < 0{
            let progress = -offset / 120
    //        since top padding is 25...
            let newOffset = (progress <= 1.0 ? progress: 1) * 20
            return -newOffset
        }
        return 0

    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ForecastView: View {
    var time : String
    var celsius : CGFloat
    var image : String
    var body: some View {
        if #available(iOS 15.0, *){
            VStack(spacing: 15){
                Text(time)
                    .font(.callout.bold())
                    .foregroundColor(.white)
                Image(systemName: image)
                    .font(.title2)
                //                                        multicolor..
                    .symbolVariant(.fill)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.yellow,.white)
                //                                        max frame..
                    .frame(height: 30)
                Text("\(Int(celsius))°")
                    .font(.callout.bold())
                    .foregroundColor(.white)
            }
            .padding(.horizontal,10)
        }
    }
}
