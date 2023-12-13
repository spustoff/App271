//
//  ProjectsView.swift
//  App271
//
//  Created by IGOR on 06/12/2023.
//

import SwiftUI

struct ProjectsView: View {
    
    @StateObject var viewModel = ProjectViewModel()
    @State var progress: Int = 36
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        AddProject()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 20, weight: .medium))
                    })
                }
                
                Text("Projects")
                    .foregroundColor(.black)
                    .font(.system(size: 24, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                if viewModel.proje.isEmpty {
                    
                    VStack {
                        
                        HStack {
                            
                            VStack(alignment: .leading) {
                                
                                Text("Done")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .semibold))
                                
                                Text("Completed projects will appear here")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color("green")))
                            
                            VStack(alignment: .leading) {
                                
                                Text("Archive")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                                
                                Text("Remote projects will be stored here")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.black))
                        }
                        
                        VStack(spacing: 16) {
                            
                            HStack {
                                
                                Spacer()
                                
                                Text("Base")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Spacer()
                                
                                Text("Walls")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Spacer()
                                
                                Text("Roof")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Spacer()
                                
                                Text("Decor")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Spacer()
                            }
                            
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.white.opacity(0.1))
                                .frame(maxWidth: .infinity)
                                .frame(height: 7)
                            
                            Text("Add a new object and organize the stages of building")
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            NavigationLink(destination: {
                                
                                AddProject()
                                    .navigationBarBackButtonHidden()
                                
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
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                        
                        Spacer()
                    }
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            HStack {
                                
                                HStack {
                                    
                                    Text("Done")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    if progress == Int(2) {
                                        
                                        Text("1")
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .semibold))
                                        
                                    } else {
                                        
                                    Text("0")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18, weight: .semibold))
                                    }
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("green")))
                                
                                HStack {
                                    
                                    Text("Archive")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    Text("0")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .semibold))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color.black))
                            }
                            
                            ForEach(viewModel.proje, id: \.self) { index in
                                
                                VStack(spacing: 16) {
                                    
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Text("Base")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text("Walls")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text("Roof")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text("Decor")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Spacer()
                                    }
                                    
                                    ZStack(alignment: .leading) {
                                        
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(.white.opacity(0.1))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 7)
                                        
                                        if progress <= 2 {
                                            
                                            RoundedRectangle(cornerRadius: 5)
                                                .fill(.white)
                                                .frame(width: UIScreen.main.bounds.width / 1.2)
                                                .frame(height: 7)
                                            
                                        } else {
                                            RoundedRectangle(cornerRadius: 5)
                                                .fill(.white)
                                                .frame(width: UIScreen.main.bounds.width / CGFloat(Int(progress)))
                                                .frame(height: 7)
                                            
                                        }
                                    }
                                    
                                    Text(index)
                                        .foregroundColor(.white)
                                        .font(.system(size: 14, weight: .semibold))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Button(action: {
                                        
                                        if progress <= 2 {
                                            
                                            progress -= Int(0.1)
                                            
                                        } else {
                                            
                                            progress -= 1
                                            
                                        }
                                        
                                    }, label: {
                                        
                                        if progress == Int(2) {
                                            
                                            Text("Done")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .regular))
                                                .frame(width: 150, height: 50)
                                                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                                            
                                        } else {
                                            
                                            Text("On next stage")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .regular))
                                                .frame(width: 150, height: 50)
                                                .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                                        }
                                    })
                                    .disabled(progress == Int(2) ? true : false)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ProjectsView()
}
