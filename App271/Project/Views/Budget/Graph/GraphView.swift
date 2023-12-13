//
//  GraphView.swift
//  App271
//
//  Created by IGOR on 11/12/2023.
//

import SwiftUI

struct GraphView: View {
    
    @StateObject var viewModel = BudgetViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Menu(content: {
                    
                    ForEach(viewModel.currency_fc, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.current_currency = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .regular))
                            
                        })
                    }
                    
                }, label: {
                    
                    HStack {
                        
                        Text(viewModel.current_currency)
                            .foregroundColor(.black)
                            .font(.system(size: 22, weight: .bold))
                     
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .medium))
                    }
                })
                .padding()
                
                HStack {
                    
                    Text("0.\(String(format: "%.f", Double(.random(in: 10000...90000))))")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                    
                    Text("+\(String(format: "%.f", Double(.random(in: 1...5)))).\(String(format: "%.f", Double(.random(in: 10...90))))")
                        .foregroundColor(.black)
                        .font(.system(size: 10, weight: .regular))
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                    
                    Spacer()
                    
                    Text("+0.00\(String(format: "%.f", Double(.random(in: 100...900))))")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                }
                .padding(.horizontal)
                
                Image("biggraph")
                    .resizable()
            }
        }
    }
}

#Preview {
    GraphView()
}
