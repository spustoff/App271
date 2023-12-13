//
//  CalendarView.swift
//  App271
//
//  Created by IGOR on 06/12/2023.
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject var viewModel = ProjectViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        AddProject()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("+")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 20, weight: .medium))
                    })
                    .opacity(0)
                    .disabled(true)
                }
                
                Text("Calendar")
                    .foregroundColor(.black)
                    .font(.system(size: 24, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                DatePicker(selection: .constant(Date()), label: {})
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .accentColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("g")))
                
                if viewModel.proje.isEmpty {
                    
                    VStack(spacing: 10) {
                        
                        Text("No scheduled events")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                        
                        Text("Project events will appear here")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
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
                                    
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.white)
                                        .frame(width: UIScreen.main.bounds.width / 7)
                                        .frame(height: 7)
                                    
                                }
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .semibold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                            }
                            .padding(20)
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
    CalendarView()
}
