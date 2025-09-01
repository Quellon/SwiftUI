//
//  ContentView.swift
//  Challenge2
//
//  Created by Quellon Naicker on 8/14/24.
//

import SwiftUI

struct ContentView: View {
    
    var options = ["rock", "paper", "scissors"]
    @State private var currentChoice: String = " "
    @State private var winOrLose: Bool = false
    //@State private var rock: Bool = false
    //@State private var paper: Bool = false
    //@State private var scissors: Bool = false
    @State private var outcome: Bool = false
    @State private var message: String = ""
    
    
    
    var appPick: String{
        return options[.random(in: 0...2)]
    }
    var result: Bool{
        let shouldWin = true
        return shouldWin
    }
    
    var h: Bool{
            
        if(appPick == "rock"){
            if(result){
                if(message == "paper"){
                   return outcome == true
                }else{
                    outcome.toggle()
            }//else{
                //if(message == "rock" || message == "scissors"){
                 //   return outcome == true
               // }
                
            }
       }
        
            
        if(appPick == "paper"){
            if(result){
                if(message == "scissors"){
                    outcome.toggle()
                }else{
                     outcome.toggle()
                }
            }else {
                if(message == "rock" || message == "paper"){
                    outcome.toggle()
            }
            }
            }
        
            
        if(appPick == "scissors"){
            if(result){
                if(message == "rock"){
                    outcome.toggle()
                }else{
                    outcome.toggle()
                }
            }else{ 
                if(message == "paper" || message == "scissors"){
                    outcome.toggle()
            }
            }
            }
        
        return outcome
            }
        
    
    var body: some View {
        VStack {
            Form{
                Section{
                    Picker("AppPick", selection: $message){
                        ForEach(options, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Apps choice"){
                    Text(appPick)
                }
                Section("Did"){
                    Text(h.description)
                    
                     switch h{
                     case true:
                        Text("You did well")
                     case false:
                         Text("you did not do well")
                }
                    
                    }
                Section("Required result"){
                    Text(result.description)
                }
            
                }
               
            }
        }
       
    }


#Preview {
    ContentView()
}


/// have to create 3 buttons
/// refer to flag - the flags are 3 buttons - scoring system should work the same
/// --> instead of matching the apps choice, there are outcomes dependent on apps choice
