//
//  ContentView.swift
//  Task Manager
//
//  Created by Gurjot Singh on 31/03/23.
//

import SwiftUI
import CoreData

struct dates: Hashable {
    var day: String
    var date: Int
}

struct CardModel: Hashable {
    var id: Int
    var type: String
    var title: String
    var date: String
    var comment: Int
    var share: Int
}

struct ContentView: View {
    
    @State var selectedDate = 16
        
    @State var dateList = [
        dates(day: "Sun", date: 12),
        dates(day: "Mon", date: 13),
        dates(day: "Tue", date: 14),
        dates(day: "Wed", date: 15),
        dates(day: "Thu", date: 16),
        dates(day: "Fri", date: 17),
        dates(day: "Sat", date: 18)
    ]
    
    @State var cardList = [
        CardModel(id: 1, type: "High", title: "March Dribbble Shots design. Plan for the month", date: "02 Apr", comment: 4, share: 16),
        CardModel(id: 2, type: "Medium", title: "Create a series of UI/UX designs for a travel app, showcasing different screens and features", date: "02 Apr", comment: 4, share: 16),
        CardModel(id: 3, type: "Low", title: "Design a set of icons for a weather app, using a consistent style and color palette", date: "02 Apr", comment: 4, share: 16),
        CardModel(id: 4, type: "High", title: "Experiment with typography and layout to create a series of inspirational quote graphics", date: "02 Apr", comment: 4, share: 16),
        CardModel(id: 5, type: "Medium", title: "Design a set of animated stickers for messaging apps, featuring cute and playful characters", date: "02 Apr", comment: 4, share: 16),
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "line.3.horizontal")
                                .imageScale(.large)
                                .frame(width: 40, height: 40)
                            
                            Spacer()
                            
                            ProfileView(image: "person")
                        }
                        
                        Text("Manage\nyour tasks ✏️")
                            .font(.custom("normal", size: 45))

                        HStack {
                            ForEach(dateList, id: \.self) { list in
                                Spacer()
                                if list.date == selectedDate {
                                    VStack (spacing: 15) {
                                        Text(list.day)
                                            .opacity(0.5)
                                        Text("\(list.date)")
                                            .font(.system(size: 18))
                                    }
                                    .frame(width: 50, height: 90)
                                    .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .foregroundColor(.black)
                                } else {
                                    VStack (spacing: 15) {
                                        Text(list.day)
                                            .opacity(0.5)
                                        Text("\(list.date)")
                                            .font(.system(size: 18))
                                    }
                                }
                                Spacer()
                            }
                        }
                        .padding(.top)
                    }
                    .padding(.horizontal)
                    
                    ForEach(cardList, id:\.self) { list in
                        CardView(item: list)
                    }
                    
                }
                
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "house.fill")
                            .imageScale(.large)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "folder")
                            .imageScale(.large)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .bold()
                            .frame(width: 60, height: 60)
                            .background(.white)
                            .foregroundColor(Color("Background"))
                            .clipShape(Circle())
                            
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis.message")
                            .imageScale(.large)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "person")
                            .imageScale(.large)
                    }
                }
                .padding(.horizontal, 35)
            }
            .foregroundColor(.white)
            .background(Color("Background"))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ProfileView: View {
    var image: String
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

struct SmallIconTextView: View {
    var image: String
    var title: String
    var body: some View {
        HStack (alignment: .center){
            Image(systemName: image)
                .imageScale(.medium)
            
            Text(title)
                .font(.caption)
        }
    }
}

struct CardView: View {
    var item: CardModel
    var body: some View {
        if item.type == "High" {
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    
                    Text(item.type)
                        .font(.caption)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(.white.opacity(0.1))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    Image(systemName: "square.and.arrow.up")
                        .imageScale(.small)
                        .padding(8)
                        .background(.white.opacity(0.1))
                        .clipShape(Circle())
                }
                
                Text(item.title)
                    .font(.title3)
                
                SmallIconTextView(image: "calendar", title: item.date)
                    .opacity(0.7)
                
                HStack {
                    Image("person")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    
                    Spacer()
                    
                    SmallIconTextView(image: "ellipsis.message", title: "\(item.comment)")
                        .opacity(0.7)
                    
                    SmallIconTextView(image: "link", title: "\(item.share)")
                        .opacity(0.7)
                }
            }
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("CardHighBg"))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
            .padding(.vertical, 5)
        } else {
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Text(item.type)
                        .font(.caption)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(.white.opacity(0.1))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.white)
                        .imageScale(.small)
                        .padding(8)
                        .background(.white.opacity(0.1))
                        .clipShape(Circle())
                }
                
                Text(item.title)
                    .font(.title3)
                
                SmallIconTextView(image: "calendar", title: item.date)
                    .opacity(0.7)
                
                HStack {
                    Image("person")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    
                    Spacer()
                    
                    SmallIconTextView(image: "ellipsis.message", title: "\(item.comment)")
                        .opacity(0.7)
                    
                    SmallIconTextView(image: "link", title: "\(item.share)")
                        .opacity(0.7)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("CardBg"))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
            .padding(.vertical, 5)
        }
    }
}
