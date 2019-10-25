//
//  ContentView.swift
//  SwiftUI-Charts-Example
//
//  Created by Dante Solorio on 24/10/19.
//  Copyright © 2019 Dante Solorio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var picketSelectedItem = 0
    
    @State var dataPoints: [[CGFloat]] = [
        [50, 100, 150, 30, 40],
        [150, 100, 50, 200, 10],
        [10, 20, 30, 100, 50]
    ]
    
    var body: some View {
        ZStack {
            
            Color("appBackground").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Calory Intake")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                
                
                Picker(selection: $picketSelectedItem, label: Text("")) {
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                HStack (spacing: 16) {
                    BarView(value: dataPoints[picketSelectedItem][0])
                    BarView(value: dataPoints[picketSelectedItem][1])
                    BarView(value: dataPoints[picketSelectedItem][2])
                    BarView(value: dataPoints[picketSelectedItem][3])
                    BarView(value: dataPoints[picketSelectedItem][4])
                }.padding(.top, 24)
                    .animation(.default)
            }
        }
    }
}


struct BarView: View {
    
    var value: CGFloat = 0
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottom){
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.2837431729, green: 0.9006481767, blue: 0.719407618, alpha: 1)))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
                
            }
            Text("D").padding(.top, 8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
