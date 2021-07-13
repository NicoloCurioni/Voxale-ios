//
//  VoxaleApp.swift
//  Voxale
//
//  Created by Nicolò Curioni on 12/07/21.
//

import SwiftUI
import Firebase

@main
struct VoxaleApp: App {
    
    init() {
        
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NoteListView(cardListViewModel: VoxaleListViewModel())
        }
    }
}
