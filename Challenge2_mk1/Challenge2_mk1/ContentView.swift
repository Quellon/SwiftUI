//
//  ContentView.swift
//  Challenge2_mk1
//
//  Created by Quellon Naicker on 8/15/24.
//

import SwiftUI




struct ContentView: View {
    
    @State private var options = ["rock", "paper", "scissors"]
    @State private var generate = Int.random(in: 0...2)
    @State private var win = Bool.random()
    @State private var winOptions = ["paper", "scissors", "rock"]
    @State private var message = ""
   
   @State private var score = 0
   @State private var showingScore = false
   @State private var playerPick = ""
    var appPick: String{
        return options[generate]
    }
    var body: some View {
        ZStack{
            VStack(spacing: 15){
                VStack{
                    Text("The apps choice")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                    Text(appPick)
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                }
                HStack{
                    Button{
                        playerPick = "rock"
                        buttonTapped(playerPick)
                    }label:{
                        Text("rock")
                    }
                    Button{
                        playerPick = "paper"
                        buttonTapped(playerPick)
                    }label:{
                        Text("paper")
                    }
                    Button{
                        playerPick = "scissors"
                        buttonTapped(playerPick)
                    }label:{
                        Text("scissors")
                    }
                }
                Section("---required outcome---"){
                    Text(win.description)
                }
                Section("---Result---"){
                    Text(message)
                }
            }
        }.alert("score", isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        }message: {
            Text("Your score is \(score)")
        }
    }
    func buttonTapped(_ player:String){
        //var appPick = options[generate]
        if(win == true){
            if(player == winOptions[generate]){
                message = "You won as intended"
                score = score + 1
            }else{
                message = "You have not won as intended"
            }
        }else{
            if(player != winOptions[generate]){
                message = "You won as intended"
                score = score + 1
            }else{
                message = "You have not won as intended"
            }
        }
        showingScore = true
    }
    func askQuestion(){
        win = Bool.random()
        generate = Int.random(in: 0...2)
        
    }
}

#Preview {
    ContentView()
}
