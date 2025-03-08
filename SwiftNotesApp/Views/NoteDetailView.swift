//
//  NoteDetailView.swift
//  SwiftNotesApp
//
//  Created by Jared Malan on 2/26/25.
//

import SwiftUI
import SwiftData

struct NoteDetailView: View {
    @Bindable var note: Note
    @Environment(\.dismiss) var dismiss  // Allows navigation back

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextField("Title", text: $note.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            ZStack(alignment: .topLeading) {
                if note.content.isEmpty {
                    Text("Write your note here...")
                        .foregroundColor(.gray)
                        .padding(.top, -28)
                        .padding(.leading, 12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .allowsHitTesting(false)
                }
                
                TextEditor(text: $note.content)
                    .frame(height: 120)
                    .padding(.horizontal, 6)
                    .padding(.top, 6)
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }

            Button(action: {
                dismiss()  // Save and go back to the main screen
            }) {
                Label("Save Changes", systemImage: "checkmark.circle.fill")
                    .font(.title3)
                    .foregroundColor(.white)
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .clipShape(RoundedRectangle(cornerRadius: 10))

            Spacer()
        }
        .padding()
        .navigationTitle("Edit Note")
    }
}

#Preview {
    NoteDetailView(note: Note(title: "Sample Note", content: "This is a test note."))
}
