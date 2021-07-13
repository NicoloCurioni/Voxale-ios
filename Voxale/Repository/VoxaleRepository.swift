//
//  VoxaleRepository.swift
//  Voxale
//
//  Created by Nicolò Curioni on 13/07/21.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

final class VoxaleRepository: ObservableObject {
    private let path = "notes"
    private let store = Firestore.firestore()
    
    @Published var notes: [VoxaleModel] = []
    
    init() {
        
        getAudioFiles()
    }
    
    func getAudioFiles() {
        
        store.collection(path).addSnapshotListener { snapshot, error in
            
            if let error = error {
                
                print(error.localizedDescription)
                
                return
            }
            
            self.notes = snapshot?.documents.compactMap {
                
                try? $0.data(as: VoxaleModel.self)
                
            } ?? []
        }
    }
    
    func add(_ note: VoxaleModel) {
        
        do {
            
            _ = try store.collection(path).addDocument(from: note)
            
        } catch {
            
//            print(error.localizedDescription)
            fatalError("Failed adding note")
        }
    }
}
