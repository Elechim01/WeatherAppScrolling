//
//  Forecast.swift
//  WeatherAppScrolling
//
//  Created by Michele Manniello on 17/06/21.
//

import SwiftUI

//Sample Model and then days data...
struct DayForeCast: Identifiable{
    var id = UUID().uuidString
    var day : String
    var farenheit: CGFloat
    var image : String
}

var forecast = [
    DayForeCast(day: "Today", farenheit: 94, image: "sun.min"),
    DayForeCast(day: "Wed", farenheit: 90, image: "cloud.sun"),
    DayForeCast(day: "Tue", farenheit: 98, image: "cloud.sun.bolt"),
    DayForeCast(day: "Thu", farenheit: 99, image: "sun.max"),
    DayForeCast(day: "Fri", farenheit: 92, image: "cloud.sun"),
    DayForeCast(day: "Sat", farenheit: 89, image: "cloud.sun"),
    DayForeCast(day: "Sun", farenheit: 96, image: "sun.max"),
    DayForeCast(day: "Mon", farenheit: 94, image: "sun.max"),
    DayForeCast(day: "Tue", farenheit: 93, image: "cloud.sun.bolt"),
    DayForeCast(day: "Wed", farenheit: 94, image: "sun.min"),

]
