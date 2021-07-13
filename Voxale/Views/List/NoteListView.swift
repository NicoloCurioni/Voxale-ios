//
//  NoteListView.swift
//  Voxale
//
//  Created by Nicolò Curioni on 13/07/21.
//

import SwiftUI

struct NoteListView: View {
    
    @ObservedObject var cardListViewModel: VoxaleListViewModel
    @State var presentingModal = false
    
    var body: some View {
        
        ZStack {
            
                VStack {
                    
                    List(cardListViewModel.notes) { note in
                        
                        VStack(alignment: .leading) {
                            
                            Text(note.name)
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            Text(note.date)
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }
                    
                }.sheet(isPresented: self.$presentingModal) {
                    
                    addView
                }
                
                
                VStack {
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            
                            self.presentingModal.toggle()
                            
                        }, label: {
                            
                            Text("+")
                                .font(.system(.largeTitle))
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white)
                                .padding(.bottom, 7)
                        })
                            .background(Color.blue)
                            .frame(width: 60, height: 60)
                            .cornerRadius(20)
                            .padding()
                            .shadow(color: Color.black.opacity(0.4), radius: 3, x: 3, y: 3)
                    }
                }
            }
        
    }
    
    var addView: some View {
        
        return AddNoteView(presentedAsModal: self.$presentingModal, cardListViewModel: cardListViewModel, noteName: "", noteMood: "", noteDate: "")
    }
}

struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NoteListView(cardListViewModel: VoxaleListViewModel())
    }
}
