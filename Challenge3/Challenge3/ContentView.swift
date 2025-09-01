//
//  ContentView.swift
//  Challenge3
//
//  Created by Quellon Naicker on 8/20/24.
//

import SwiftUI

struct Question:View{
    @State private var answers = [Int]()
    @State private var questions: [Int] = []
    @State private var correctAnswers: [Int] = []
    @State private var enteredAnswer = ""
   // @State private var numberForQuestions = Int.random(in: 0...20)
    @State private var numberChosen = 0
    //let n =
    var body: some View{
        ForEach(0...20, id: \.self){ num in
            let numberForQuestions = Int.random(in: 0...20)
            TextField("\(numberChosen) x \(numberForQuestions): ", text: $answers[num])
            //answers.insert(Int(enteredAnswer))
            correctAnswers.insert(numberChosen * numberForQuestions)
            //add something to generate questions and then store the questions in the array created.
        //let n = numberChosen * numberForQuestions
            //answers.insert(n, at: 0)
        }
        //Store the corresponding answers as well... maybe another array for the answers -- the index should match the question index
        //or check the each answer as they are entered??
    }
}


struct ContentView: View {
    
    @State private var difficulty = ""
    //@State private var numberForQuestions = Int.random(in: 0...20)
    @State private var numberChosen = 0
    @State private var enteredAnswer = ""
    //@State private var answer = nu
    @State private var score = 0
    
    
    var body: some View {
        VStack{
            Stepper("Choose your timestable: ", value: $numberChosen, in: 2...12)
            Section("Answer the questions: "){
                ForEach(0...20, id: \.self){ num in
                    let numberForQuestions = Int.random(in: 0...20)     //it wasnt generating a new number everytime until this
                    TextField("\(numberChosen) x \(numberForQuestions): ", text: $enteredAnswer)
                   // let n = numberChosen * numberForQuestions
                    //calc(num)
                    //calc(number: numberForQuestions)
                }
            }   //this is creating all 20 textfeilds and if you answer one you answer all
        }
    }
    func calc(number:Int) -> Bool{
        if(number * numberChosen == Int(enteredAnswer)){
            score = score + 1
            return true
        }else{
            return false
        }
        
    }
}

#Preview {
    ContentView()
}
