//
//  DocDetail.swift
//  App271
//
//  Created by IGOR on 09/12/2023.
//

import SwiftUI

struct DocDetail: View {
    
    @StateObject var viewModel: DocumentsViewModel
    
    @Environment(\.presentationMode) var router
    
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
                    
                    Text(viewModel.currentProje)
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .bold))
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                        
                        ForEach(viewModel.documents, id: \.self) { index in
                            
                            VStack(alignment: .leading, spacing: 6, content: {
                                
                                Text(index.docTitle ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .medium))
                                
                                Text(index.docDescription ?? "")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        }
                    })
                }
            }
            .padding()
        }
    }
}

#Preview {
    DocDetail(viewModel: DocumentsViewModel())
}
