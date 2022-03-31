//
//  ContentView.swift
//  RGBullsEye
//
//  Created by Nyi Ye Han on 31/03/2022.
//

import SwiftUI

struct ContentView: View {
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    
    @State var rGuess : Double
    @State var gGuess : Double
    @State var bGuess : Double
    @State var showAlert : Bool
    
    func computeScore() -> Int{
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        return Int((1.0 - diff) * 100.0 + 0.5)
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Color(red: rTarget, green: gTarget, blue: bTarget)
                    Text("Match this color")
                    
                }
                VStack {
                    Color(red: rGuess, green: gGuess, blue: bGuess)
                    Text("R: \(Int(rGuess * 255.0)) G: \(Int(gGuess * 255.0)) B: \(Int(bGuess * 255.0))")
                }
            }
            
            Button {
                showAlert = true
            } label: {
                Text("Hit Me !")
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Your Score "), message: Text(String(computeScore())))
            }
            ColorSlider(value: $rGuess, textColor: .red)
            ColorSlider(value: $gGuess, textColor: .green)
            ColorSlider(value: $bGuess, textColor: .blue)

        }
        .padding(.vertical)
    }
   
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.7, gGuess: 0.3, bGuess: 0.6, showAlert: false)
.previewInterfaceOrientation(.portraitUpsideDown)
//            .previewLayout(.sizeThatFits)
    }
}

struct ColorSlider: View {
    @Binding var value : Double
    var textColor : Color
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            Slider(value: $value)
            Text("255").foregroundColor(textColor)
        }
        .padding(.horizontal)
    }
}
