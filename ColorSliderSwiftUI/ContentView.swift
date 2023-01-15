//
//  ContentView.swift
//  ColorSliderSwiftUI
//
//  Created by Валерия Гилева on 15.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(red: 0.7, green: 0.4, blue: 0.9)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                ColorView(red: red, green: green, blue: blue)
                
                VStack{
                    ColorSliderView(sliderValue: $red, color: .red)
                    ColorSliderView(sliderValue: $green, color: .green)
                    ColorSliderView(sliderValue: $blue, color: .blue)
                }
                Spacer()
            }
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View{
        Color(
            red: red / 255,
            green: green / 255,
            blue: blue / 255
        )
        .cornerRadius(15)
        .frame(height: 150)
        .shadow(radius: 10)
       
    }
}

struct ColorSliderView: View {
    @Binding var sliderValue: Double
    var color: Color
    
    var body: some View{
        HStack{
            SliderValueLabel(value: sliderValue)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .accentColor(color)
        }
    }
}

struct SliderValueLabel: View {
    
    let value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .frame(width: 40, alignment: .leading)
            .foregroundColor(.white)
    }
}



