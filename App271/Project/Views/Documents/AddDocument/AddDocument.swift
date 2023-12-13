//
//  AddDocument.swift
//  App271
//
//  Created by IGOR on 07/12/2023.
//

import SwiftUI

struct AddDocument: View {
    
    @StateObject var viewModel: DocumentsViewModel
    @Environment(\.presentationMode) var router
        
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                        
                        Spacer()
                    }
                })

                Text("New folder")
                    .foregroundColor(.black)
                    .font(.system(size: 22, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                
                Text("Select the project and add documents")
                    .foregroundColor(.black.opacity(0.8))
                    .font(.system(size: 16, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                VStack(spacing: 30) {
                    
                    ForEach(viewModel.proje, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentProje = index
                            
                        }, label: {
                            
                            ZStack {
                                
                                Circle()
                                    .stroke(Color("prim"))
                                    .frame(width: 20, height: 20)
                                
                                Circle()
                                    .fill(Color("prim"))
                                    .frame(width: 20, height: 20)
                                    .opacity(viewModel.currentProje == index ? 1 : 0)
                            }
                            
                            HStack {
                                
                                Text(index)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Spacer()
                            }
                        })
                    }
                }
                .padding(.vertical)
                
                Button(action: {
                    
                    viewModel.isAdd2 = true
                    
                }, label: {
                    
                    ZStack {
                        
                        Text("Add documents")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                        
                        HStack {
                            
                            Image(systemName: "doc")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                            
                            Spacer()
                        }
                    }
                })
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.15)))
                .padding(.vertical)
                
                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAdd2, content: {
            
            AddDocument2(viewModel: viewModel, selectedProje: viewModel.currentProje)
                .navigationBarBackButtonHidden()
        })
    }
}

#Preview {
    AddDocument(viewModel: DocumentsViewModel())
}
