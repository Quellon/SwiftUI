//
//  ContentView.swift
//  Challenge1
//
//  Created by Quellon Naicker on 8/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enteredValue = 0.0
    @State private var defaultOption = "Celsius"
    @State private var newOption = "Celsius"
    
    let options = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var v: Double{              //converts all values to celsius
        var value: Double = enteredValue
        if(defaultOption != options[0]){
            if(defaultOption == options[1]){
                value = ((enteredValue - 32) * (5/9))
            }else{
                value = (enteredValue - 273.15)
            }
        }
        return value
    }
    
    var conversion:Double{          //takes the celsius conversion number and does the required conversion
        var value: Double = 0.0
            if(newOption == options[0]){
                value = v * 1.0
            }else if (newOption == options[1]){
                value = v * (9/5) + 32
            }else if(newOption == options[2]){
                value =  v + 273.15
            }
        return value
    }
    var body: some View {
        NavigationStack{
            Form{
                Section("Enter your amount"){
                    TextField("AmountEntered", value: $enteredValue, format: .number)
                    
                    Picker("ChooseTheUnit", selection: $defaultOption){
                        ForEach(options, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Select your conversion"){
                    Picker("ChooseTheUnitConversion", selection: $newOption){
                        ForEach(options, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("The converted amount to celsius"){
                    Text(v, format: .number)
                }
                Section("Final conversion"){
                    Text(conversion, format: .number)
                }
            }
            .navigationTitle("Conversions")
        }
        
    }
}
#Preview {
    ContentView()
}



/*
 NOTES:
    - convertted all values to celsius
    - then converted to other units or back to celsius
 
 Probems:
 My while loop wasnt working
 
 
 */
