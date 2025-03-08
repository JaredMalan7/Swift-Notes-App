//
//  ContentView.swift
//  SwiftNotesApp
//
//  Created by Jared Malan on 2/26/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var notes: [Note] 

    @State private var newNoteTitle: String = ""
    @State private var newNoteContent: String = ""

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(notes) { note in
                        NavigationLink(destination: NoteDetailView(note: note)) {
                            VStack(alignment: .leading) {
                                Text(note.title)
                                    .font(.headline)
                                Text(note.timestamp, style: .date)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .onDelete(perform: deleteNotes) // Enables Swipe-to-Delete
                }
                .navigationTitle("Swift Notes")
                .toolbar {
                    EditButton() //Adds an "Edit" Button to delete multiple notes
                }

                // Add new note UI
                VStack {
                    TextField("Title", text: $newNoteTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    TextEditor(text: $newNoteContent)
                        .frame(height: 100)
                        .border(Color.gray, width: 1)
                        .padding()
                    
                    Button(action: addNote) {
                        Label("Add Note", systemImage: "plus")
                    }
                    .padding()
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
        }
    }

    private func addNote() {
        guard !newNoteTitle.isEmpty, !newNoteContent.isEmpty else { return }

        withAnimation {
            let newNote = Note(title: newNoteTitle, content: newNoteContent)
            modelContext.insert(newNote)
            
            // Clear text fields after adding
            newNoteTitle = ""
            newNoteContent = ""
        }
    }

    private func deleteNotes(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(notes[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Note.self, inMemory: true)
}
