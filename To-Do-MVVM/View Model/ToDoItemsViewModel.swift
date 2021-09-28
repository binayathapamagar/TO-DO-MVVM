//
//  ToDoItemsViewModel.swift
//  To-Do-MVVM
//
//  Created by Binaya on 28/09/2021.
//

import UIKit

class ToDoItemsViewModel: ObservableObject {
    
    @Published var items = [
        Item(id: UUID(), name: "Item 1"),
        Item(id: UUID(), name: "Item 2"),
        Item(id: UUID(), name: "Item 3")
    ]
    
    func addItem () {
        items.append(Item(id: UUID(), name: "Newly added Item"))
    }
    
    func moveItem(with indices: IndexSet, to newOffset: Int) {
        items.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func deleteItem (in indexSet: IndexSet) {
        for index in indexSet {
            items.remove(at: index)
        }
    }
    
}
