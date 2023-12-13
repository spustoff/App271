//
//  AddBudget.swift
//  App271
//
//  Created by IGOR on 11/12/2023.
//

import SwiftUI
import CoreData

struct AddBudget: View {
    
    @StateObject var viewModel: ProjectViewModel
    @Environment(\.presentationMode) var router
    var selectedProje: String
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                            
                            Text("Back")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                        }
                    })
                    
                    Text(selectedProje)
                        .foregroundColor(.black)
                        .font(.system(size: 22, weight: .bold))
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    Text("Total budget")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                    
                    Spacer()
                    
                    Text("$ \(viewModel.totalBudget).00")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("red")))
                
                HStack(content: {
                    
                    Text("Project budget")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                                            
                        Spacer()
                        
                    TextField("", text: $viewModel.projBudget)
                        .foregroundColor(.black)
                        .font(.system(size: 13, weight: .medium))
                        .keyboardType(.numberPad)
                    
                })
                .padding()
                .background(RoundedRectangle(cornerRadius: 30).stroke(Color("prim")))
                
                HStack {
                    
                    ForEach(viewModel.percents, id: \.self) {index in
                        
                        Button(action: {
                            
                            viewModel.currentPercent = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(viewModel.currentPercent == index ? .white : .black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(viewModel.currentPercent == index ? Color("prim") : .gray.opacity(0.2)))
                    }
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addBuilding(selectedProje: selectedProje, completion: {
                                                
                        viewModel.fetchBuildings()
                    })
                    
                    UIApplication.shared.endEditing()
                    
                    router.wrappedValue.dismiss()
             
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
    AddBudget(viewModel: ProjectViewModel(), selectedProje: "fs")
}
