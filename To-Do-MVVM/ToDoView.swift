//
//  ContentView.swift
//  To-Do-MVVM
//
//  Created by Binaya on 26/09/2021.
//

import SwiftUI

struct Item: Identifiable {
    var id: UUID
    var name: String
}

struct ToDoView: View {
    @State var items = [
        Item(id: UUID(), name: "Item 1"),
        Item(id: UUID(), name: "Item 2"),
        Item(id: UUID(), name: "Item 3")
    ]
    
    var body: some View {
        NavigationView {
            List{
                ForEach (items) { item in
                    NavigationLink(
                        destination: Text("Destination \(item.name)"),
                        label: {
                            Text(item.name)
                        })
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        items.remove(at: index)
                    }
                })
                .onMove(perform: { indices, newOffset in
                    items.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            .navigationBarTitle(Text("To-Do"), displayMode: .large)
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()
                    Button(action: {
                        items.append(Item(id: UUID(), name: "Newly added Item"))
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
        ToDoView()
    }
}
