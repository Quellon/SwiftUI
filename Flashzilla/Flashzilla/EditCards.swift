//
//  EditCards.swift
//  Flashzilla
//
//  Created by Quellon Naicker on 1/30/25.
//

import SwiftUI

func textFieldShouldClear(T){

}

struct EditCards: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var cards = [Card]()
    @State private var newPrompt = ""
    @State private var newAnswer = ""
    

    
    var body: some View {
        NavigationStack{
            List{
                Section("Add new card"){
                    TextField("Prompt", text: $newPrompt).textFieldStyle(textFieldShouldClear)
                    TextField("Answer", text: $newAnswer)
                    Button("Add Card", action: addCard)
                    
                    Button{
                        textFieldShouldClear(UITextField())
                    } label: {
                        Text("hello")
                    }
                }
                
                Section{
                    ForEach(0..<cards.count, id: \.self){ index in
                        VStack(alignment: .leading){
                            Text(cards[index].prompt)
                                .font(.headline)
                            Text(cards[index].answer)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
            .onAppear(perform: loadData)
        }
    }
    
    func done(){
        dismiss()
    }
    
    func loadData(){
        if let data = UserDefaults.standard.data(forKey: "Cards"){
            if let decoded = try? JSONDecoder().decode([Card].self, from: data){
                cards = decoded
            }
        }
    }
    func saveData(){
        if let data = try? JSONEncoder().encode(cards){
            UserDefaults.standard.set(data, forKey: "Cards")
        }
    }
    func addCard(){
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }
        
        let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        saveData()
    }
    func removeCards(at offset: IndexSet){
        cards.remove(atOffsets: offset)
        saveData()
    }
}

#Preview {
    EditCards()
}
