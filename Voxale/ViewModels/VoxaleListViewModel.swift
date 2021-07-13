//
//  VoxaleListViewModel.swift
//  Voxale
//
//  Created by Nicolò Curioni on 13/07/21.
//

import Combine

final class VoxaleListViewModel: ObservableObject {
    @Published var voxaleRepository = VoxaleRepository()
    @Published var notes: [VoxaleModel] = []
    
    private var cacellables: Set<AnyCancellable> = []
    
    init() {
        voxaleRepository.$notes
            .assign(to: \.notes, on: self)
            .store(in: &cacellables)
    }
    
    func add(_ note: VoxaleModel) {
        voxaleRepository.add(note)
        
    }
}
