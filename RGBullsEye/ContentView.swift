//
//  ContentView.swift
//  RGBullsEye
//
//  Created by Стас Жингель on 17.01.2021.
//

import SwiftUI

struct ContentView: View {
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    @State var showAlert = false
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Color(red: rTarget, green: gTarget, blue: bTarget)
                    Text("Match this color")
                        
                }
                VStack {
                    Color(red: rGuess, green: gGuess, blue: bGuess)
                    Text("R: \(Int(rGuess*255.0)) G:  \(Int(gGuess*255.0)) B:  \(Int(bGuess*255.0))")
                        
                }
            }
            Button(action: {
                self.showAlert = true
            }, label: {
                Text("Hit me")
                    .padding()
            })
            .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Your score:"), message: Text(String(score())))
            })
            ColorSlider(value: $rGuess, textColor: .red)
            ColorSlider(value: $gGuess, textColor: .green)
            ColorSlider(value: $bGuess, textColor: .blue)
            
            
        }
    }
    func score() -> Int {
          let rDiff = rGuess - rTarget
          let gDiff = gGuess - gTarget
          let bDiff = bGuess - bTarget
          let diff = sqrt((rDiff * rDiff + gDiff * gDiff
            + bDiff * bDiff) / 3.0)
          return lround((1.0 - diff) * 100.0)
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
        .previewLayout(.fixed(width: 568, height: 320))
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
            Text("255")
        }
        .foregroundColor(textColor)
        .padding(.horizontal)
    }
}


