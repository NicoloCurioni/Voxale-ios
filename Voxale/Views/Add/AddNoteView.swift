//
//  SheetView.swift
//  Voxale
//
//  Created by Nicolò Curioni on 13/07/21.
//

import SwiftUI

struct AddNoteView: View {
    
    @Binding var presentedAsModal: Bool
    
    @ObservedObject var cardListViewModel: VoxaleListViewModel
    
    @State var noteName: String
    @State var noteMood: String
    @State var noteDate: String
    
    @State var currentMood = 0
    @State var moods: [String] = ["😓", "😊", "😎", "😡"]
    
    var today = Date()

    var body: some View {
       
        NavigationView {
            
            Form {
                
                Section(header: Text("Nome nota")) {
                               TextField("", text: $noteName)
                        .keyboardType(.default)
                }
                
                Section(header: Text("Umore")) {
                    Picker(selection: $currentMood, label: Text("Umore di oggi")) {
                        ForEach(0 ..< moods.count) {
                            Text(self.moods[$0])
                        }
                    }
                }
                
                Section {
                    Button(action: {
                        
                        noteDate = DateFormatter.localizedString(from: today, dateStyle: .medium, timeStyle: .short)
                        
                        let userMood = moods[currentMood]
                        
                        let note = VoxaleModel(name: noteName, date: noteDate, mood: userMood)
                        
                        cardListViewModel.add(note)
                        
                        self.presentedAsModal = false
                        
//                        print("salvato ..")
                    }) {
                        Text("Salva")
                    }
                }
            }
            .navigationBarTitle("Add Note")
            .navigationBarItems(trailing: buttonDismiss)
        }
    }
    
    var buttonDismiss: some View {
        
        return Button {
            
            self.presentedAsModal = false
            
        } label: {
            
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.gray)
        }
    }
}

//struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddView(presentedAsModal: .constant(false), cardListViewModel: VoxaleListViewModel())
//    }
//}
