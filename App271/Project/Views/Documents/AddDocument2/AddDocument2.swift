//
//  AddDocument2.swift
//  App271
//
//  Created by IGOR on 07/12/2023.
//

import SwiftUI

struct AddDocument2: View {
    
    @StateObject var viewModel: DocumentsViewModel
    
    @Environment(\.presentationMode) var router
    var selectedProje: String
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                    })
                    
                    Text(selectedProje)
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .bold))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Title")
                            .foregroundColor(viewModel.docTitle.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.docTitle.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.docTitle)
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .medium))
                            .keyboardType(.decimalPad)
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 30).stroke(Color("prim")))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Description")
                            .foregroundColor(viewModel.docDescription.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.docDescription.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.docDescription)
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .medium))
                            .keyboardType(.decimalPad)
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 30).stroke(Color("prim")))
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addDoc(selectedProje: selectedProje, completion: {
                        
                        viewModel.currentProje = ""
                        
                        viewModel.fetchDoc()
                    })
                    
                    UIApplication.shared.endEditing()
                    
                    viewModel.isAdd2 = false
                    viewModel.isAdd = false
                        
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                })
            }
            .padding()
        }
    }
}

#Preview {
    AddDocument2(viewModel: DocumentsViewModel(), selectedProje: "ec")
}
