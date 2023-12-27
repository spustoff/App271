//
//  U1.swift
//  App271
//
//  Created by IGOR on 06/12/2023.
//

import SwiftUI

struct U1: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("U1")
                    .resizable()
                
                VStack {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Text("Unlock your inner trader")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .bold))
                            .multilineTextAlignment(.center)
                        
                        Text("Explore the forex with us")
                            .foregroundColor(.black.opacity(0.6))
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    
                    Spacer()
                    
                    HStack {
                        
                        Circle()
                            .fill(.black)
                            .frame(width: 10, height: 10)
                        
                        Circle()
                            .fill(.black.opacity(0.4))
                            .frame(width: 10, height: 10)

                    }
                    
                    NavigationLink(destination: {
                        
                        Reviews(telegram: telegram, isTelegram: isTelegram)
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color(.black)))
                            .padding()
                    })
                }
                .padding()
                .frame(height: UIScreen.main.bounds.height / 2.7)
                .background(Color(.white).ignoresSafeArea())
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    U1(telegram: URL(string: "h")!, isTelegram: false)
}
