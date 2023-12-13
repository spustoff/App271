//
//  DocumentsView.swift
//  App271
//
//  Created by IGOR on 06/12/2023.
//

import SwiftUI

struct DocumentsView: View {
    
    @StateObject var viewModel = DocumentsViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.isAdd = true
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 20, weight: .medium))
                    })
                }
                
                Text("Documents")
                    .foregroundColor(.black)
                    .font(.system(size: 24, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                if viewModel.proje.isEmpty {
                    
                    VStack {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("No documents")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                            
                            Text("Select and add documents for your projects")
                                .foregroundColor(.black.opacity(0.8))
                                .font(.system(size: 16, weight: .regular))
                                .padding(.bottom)
                            
                            Button(action: {
                                
                                viewModel.isAdd = true
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .regular))
                                    
                                    Text("Add")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                }
                            })
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.15)))
                        
                        Spacer()
                    }
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.proje, id: \.self) { index in
                                
                                NavigationLink(destination: {
                                    
                                    DocDetail(viewModel: viewModel)
                                        .navigationBarBackButtonHidden()
                                        .onAppear {
                                            
                                            viewModel.currentProje = index
                                            viewModel.fetchDoc()
                                        }
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        HStack {
                                            
                                            Image(systemName: "doc")
                                                .foregroundColor(Color("prim"))
                                                .font(.system(size: 20))
                                            
                                            Text("1")
                                                .foregroundColor(Color("prim"))
                                                .font(.system(size: 17, weight: .medium))
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Spacer()
                                        
                                        Text(index)
                                            .foregroundColor(.black)
                                            .font(.system(size: 20))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .frame(height: 160)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(.gray.opacity(0.15)))
                                })
                            }
                        })
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddDocument(viewModel: viewModel)
        })
    }
}

#Preview {
    DocumentsView()
}
