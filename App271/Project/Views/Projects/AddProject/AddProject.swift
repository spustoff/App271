//
//  AddProject.swift
//  App271
//
//  Created by IGOR on 06/12/2023.
//

import SwiftUI

struct AddProject: View {
    
    @StateObject var viewModel = ProjectViewModel()
    
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                                        
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image("cl")
                    })
                    .padding(.bottom)
                    
                    Spacer()

                }
                
                Text("New project")
                    .foregroundColor(.black)
                    .font(.system(size: 24, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.vertical, showsIndicators:  false) {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("Title")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("")
                                .foregroundColor(viewModel.projTitle.isEmpty ? .gray : .white)
                                .font(.system(size: 13, weight: .medium))
                                .opacity(viewModel.projTitle.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.projTitle)
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                                .keyboardType(.decimalPad)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 30).stroke(Color("prim")))
                        
                        Text("Stage")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Select the stage the project is currently")
                            .foregroundColor(.black.opacity(0.6))
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ForEach(viewModel.stages, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.currentStage = index
                                
                            }, label: {
                                
                                ZStack {
                                    
                                    Circle()
                                        .stroke(Color("prim"))
                                        .frame(width: 20, height: 20)
                                    
                                    Circle()
                                        .fill(Color("prim"))
                                        .frame(width: 20, height: 20)
                                        .opacity(viewModel.currentStage == index ? 1 : 0)
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
                }
                
                Button(action: {
                    
                    viewModel.proje.append(viewModel.projTitle)
                    router.wrappedValue.dismiss()
                    
                    UIApplication.shared.endEditing()
                    
                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                })
                .opacity(viewModel.projTitle.isEmpty ? 0.5 : 1)
                .disabled(viewModel.projTitle.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddProject()
}
