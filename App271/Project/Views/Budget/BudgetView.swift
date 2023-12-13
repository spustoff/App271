//
//  BudgetView.swift
//  App271
//
//  Created by IGOR on 06/12/2023.
//

import SwiftUI

struct BudgetView: View {
    
    @StateObject var viewModel = ProjectViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isGraph = true
                        }
                        
                    }, label: {
                        
                        Image("budgraph")
                    })
                }
                
                Text("Budget")
                    .foregroundColor(.black)
                    .font(.system(size: 24, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                if viewModel.totalBudget == 0 {
                    
                    VStack(spacing: 16) {
                        
                        Text("Total budget")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Create a budget and allocate it to projects")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddBudget = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("+")
                                    .foregroundColor(.black)
                                    .font(.system(size: 26, weight: .regular))
                                
                                Text("Add")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                                
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                            
                        })
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("red")))
                    
                } else {
                    
                    VStack(spacing: 16) {
                        
                        Text("Total budget")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("$ \(viewModel.totalBudget).00")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .bold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("red")))
                    
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(alignment: .leading, spacing: 30) {
                        
                        ForEach(viewModel.proje, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentProje = index
                                viewModel.isDetailBudget = true
                                
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .regular))
                                }
                            })
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.2)))
                }
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.isDetailBudget, content: {
            
            AddBudget(viewModel: viewModel, selectedProje: viewModel.currentProje)
            
        })
        .overlay(
            
            ZStack {
                
                Color.gray.opacity(viewModel.isAddBudget ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddBudget = false
                        }
                    }
                
                VStack(spacing: 19) {
                    
                    Text("Total budget")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .regular))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("")
                            .foregroundColor(viewModel.addBudget.isEmpty ? .gray : .white)
                            .font(.system(size: 13, weight: .medium))
                            .opacity(viewModel.addBudget.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.addBudget)
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .medium))
                            .keyboardType(.numberPad)
                        
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 30).stroke(Color("prim")))
                    
                    Button(action: {
                        
                        viewModel.totalBudget = Int(viewModel.addBudget) ?? 0
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAddBudget = false
                        }
                        
                        UIApplication.shared.endEditing()
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                    })
                    .opacity(viewModel.addBudget.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.addBudget.isEmpty ? true : false)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.white.ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAddBudget ? 0 : UIScreen.main.bounds.height)
            }
        )
        .sheet(isPresented: $viewModel.isGraph, content: {
            
            GraphView()
        })
    }
}

#Preview {
    BudgetView()
}
