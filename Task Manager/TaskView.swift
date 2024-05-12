//
//  TaskView.swift
//  Task Manager
//
//  Created by Gurjot Singh on 31/03/23.
//

import SwiftUI

struct TaskView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (alignment: .leading) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                        
                        Spacer()
                        
                        Image(systemName: "square.and.arrow.up")
                            .imageScale(.large)
                        
                        Image(systemName: "pencil.line")
                            .imageScale(.large)
                    }                .padding()

                    
                    Text("March")
                        .font(.custom("normal", size: 36))
                        .padding()

                    
                    HStack {
                        ProfileView(image: "person")
                        
                        VStack(alignment: .leading) {
                            Text("Author")
                                .font(.caption)
                            
                            Text("Author")
                                .font(.callout)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "calendar")
                            .imageScale(.large)
                            .padding()
                        
                        VStack (alignment: .leading) {
                            Text("Date & Time")
                                .font(.caption)
                            
                            Text("Author")
                                .font(.callout)
                        }
                        
                        Spacer()
                        
                    }
                    .padding()

                    
                    VStack {
                        Text("Overview")
                            .font(.title3)
                            .foregroundColor(.white)
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("Background"))
                    .clipShape(RoundedRectangle(cornerRadius: 16, cornerCurve: [.top, .]))
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color("CardHighBg"))
        }
        .navigationBarHidden(true)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
