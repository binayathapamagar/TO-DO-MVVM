//
//  ContentView.swift
//  To-Do-MVVM
//
//  Created by Binaya on 26/09/2021.
//

import SwiftUI

struct ToDoListView: View {
    
    @ObservedObject var toDoItemsViewModel: ToDoItemsViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                List{
                    ForEach (toDoItemsViewModel.items) { item in
                        NavigationLink(
                            destination: Text("Destination \(item.name)"),
                            label: {
                                Text(item.name)
                            })
                    }
                    .onDelete(perform: { indexSet in
                        toDoItemsViewModel.deleteItem(in: indexSet)
                    })
                    .onMove(perform: { indices, newOffset in
                        toDoItemsViewModel.moveItem(with: indices, to: newOffset)
                    })
                }
                if toDoItemsViewModel.items.count == 0 {
                    Text("Add items by clicking on the add '+' button on the top right")
                        .foregroundColor(.gray)
                        .padding(50)
                        .multilineTextAlignment(.center)
                }
            }
            .navigationBarTitle(Text("To-Do"), displayMode: .large)
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()
                    Button(action: {
                        toDoItemsViewModel.addItem()
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ToDoListView(toDoItemsViewModel: ToDoItemsViewModel.emptyState())
        
        ToDoListView(toDoItemsViewModel: ToDoItemsViewModel.fullState())
        
    }
}
