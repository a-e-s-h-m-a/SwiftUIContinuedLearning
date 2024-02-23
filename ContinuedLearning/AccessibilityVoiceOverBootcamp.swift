//
//  AccessibilityVoiceOverBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-02-23.
//

import SwiftUI

struct AccessibilityVoiceOverBootcamp: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Toggle("Volume", isOn: $isActive)
                    
                    HStack {
                        Text("Volume")
                        Spacer()
                        Text(isActive ? "ON" : "OFF")
                    }
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        isActive.toggle()
                    }
                } header: {
                    Text("PREFERENCES")
                }
                
                Section {
                    Button("Favorites") {
                        
                    }
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "heart.fill")
                    })
                    
                    Text("Favorites")
                        .onTapGesture {
                            
                        }
                    
                } header: {
                    Text("APPLICATION")
                }
                
                VStack {
                    Text("CONTENT")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.secondary)
                        .font(.caption)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 8) {
                            ForEach(0..<10) { x in
                                VStack {
                                    Image("dog")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                    
                                    Text("item \(x)")
                                }
                                .onTapGesture {
                                    
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }


            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    AccessibilityVoiceOverBootcamp()
}
