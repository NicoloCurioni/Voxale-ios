//
//  VoxaleModel.swift
//  Voxale
//
//  Created by Nicolò Curioni on 13/07/21.
//

import FirebaseFirestoreSwift

struct VoxaleModel: Identifiable, Codable {
    
    @DocumentID var id: String?
    
    var name: String
    var date: String
    var mood: String
}
