//
//  AddView.swift
//  Todo
//
//  Created by carrizane on 2/1/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type Something here...",text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                    .cornerRadius(15)
                Button(
                    action: saveButtonPressed,
                    label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(15)
                            .font(.headline)
                    }
                )
            }
            .padding(15)
        }
        .navigationTitle("Add an Item ✍️")
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
    
    func saveButtonPressed() {
        if textIsValid() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        } else {
            alertTitle = "Your new Item must be at least 4 characters long!! 😱😨😰"
            showAlert.toggle()
        }
    }
    
    func textIsValid() -> Bool {
        return textFieldText.count > 3
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
