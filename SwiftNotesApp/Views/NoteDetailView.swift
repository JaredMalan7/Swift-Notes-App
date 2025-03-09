//
//  NoteDetailView.swift
//  SwiftNotesApp
//
//  Created by Jared Malan on 2/27/25.
//

import SwiftUI
import SwiftData

struct NoteDetailView: View {
    @Bindable var note: Note
    @State private var isEditing = false
    @State private var editedTitle: String = ""
    @State private var editedContent: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if isEditing {
                // Editing Mode
                VStack(alignment: .leading, spacing: 12) {
                    //Title editor box
                    TextField("Title", text: $editedTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    ZStack(alignment: .topLeading) {
                        if editedContent.isEmpty {
                            Text("Write your note here...")
                                .foregroundColor(.gray)
                                .padding(.top, 12)
                                .padding(.leading, 10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .allowsHitTesting(false)
                        }
                        
                        //styling of the text editor
                        TextEditor(text: $editedContent)
                            .frame(height: 120)
                            .padding(.horizontal, 6)
                            .padding(.top, 6)
                            .background(Color.white)
                            .cornerRadius(8)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    }

                    HStack {
                        //edit button
                        Button(action: {
                            withAnimation {
                                isEditing = false
                            }
                        }) {
                            Text("Cancel")
                                .foregroundColor(.red)
                                .padding()
                        }

                        Spacer()
                        //Save Button
                        Button(action: saveChanges) {
                            Text("Save Changes")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                .padding()
                .transition(.opacity.combined(with: .move(edge: .bottom)))
            } else {
                // View Mode
                VStack(alignment: .leading, spacing: 10) {
                    Text(note.title)
                        .font(.title)
                        .bold()

                    Text(note.content)
                        .font(.body)
                        .padding(.top, 10)

                    Spacer()
                    
                    //Edit Button
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                isEditing = true
                                editedTitle = note.title
                                editedContent = note.content
                            }
                        }) {
                            Label("Edit Note", systemImage: "pencil")
                                .font(.title3)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 50))
                        }
                        Spacer()
                    }
                    .padding(.top, 20) 
                }
                .padding()
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .animation(.easeInOut(duration: 0.3), value: isEditing)
        .navigationTitle("Note Details")
    }

    private func saveChanges() {
        withAnimation {
            note.title = editedTitle
            note.content = editedContent
            isEditing = false
        }
    }
}

#Preview {
    NoteDetailView(note: Note(title: "Sample Note", content: "This is a test note."))
}
