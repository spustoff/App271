//
//  Not.swift
//  App271
//
//  Created by IGOR on 06/12/2023.
//

import SwiftUI
import OneSignalFramework

struct Not: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image("Not")
                    .resizable()
                
                VStack {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Text("Don't miss anything important")
                            .foregroundColor(.black)
                            .font(.system(size: 25, weight: .bold))
                            .multilineTextAlignment(.center)
                        
                        Text("Get the most up-to-date information")
                            .foregroundColor(.black.opacity(0.6))
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    
                    Spacer()
                    
                    Button(action: {
                        
                        OneSignal.Notifications.requestPermission({ accepted in
                          print("User accepted notifications: \(accepted)")
                        }, fallbackToSettings: true)
                        
                    }, label: {
                        
                        Text("Enable notifications")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                            .padding()
                    })
                }
                .padding()
                .frame(height: UIScreen.main.bounds.height / 2.7)
                .background(Color(.white).ignoresSafeArea())
            }
            .ignoresSafeArea(.all, edges: .top)
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .bold))
                            .padding(7)
                            .background(Circle().fill(Color.white.opacity(0.2)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Not()
}
