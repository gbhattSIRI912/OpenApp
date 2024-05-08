//
//  ContentView.swift
//  IosAssignmentProject
//
//  Created by Gaurav Bhatt on 04/05/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    @State private var isTopListShow: Bool = true
    @State private var isRecentListShow: Bool = false
    let data: [Double] = [10, 20, 30, 40, 50, 60, 70, 80, 90, 80, 70, 60, 50, 40, 30, 20, 10]
    @State var index = 0
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("DASHBOARD")
                            .foregroundStyle(Color.white)
                            .font(.title)
                        Spacer()
                        Image("setting")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50, alignment: .center)
                    }
                    .padding(.horizontal, 10)
                    
                    VStack {
                        Text(viewModel.greeting)
                            .foregroundStyle(Color.gray)
                            .font(.system(size: 22, weight: .bold))
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding([.leading, .top])
                        Text("Ajay Manva 👋")
                            .foregroundStyle(Color.gray)
                            .font(.system(size: 22, weight: .bold))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                            .padding(.top, 2)
                        VStack {
                            VStack(spacing: 40) {
                            
                            HStack {
                                Text("Overview")
                                    .font(.headline)
                                Spacer()
                                Button(action: {
                                }) {
                                    Text("22 Aug - 23 Aug")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .padding(10)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .background(Color.white)
                                .border(Color.gray, width: 1)
                                .cornerRadius(2)
                            }
                            .padding(.horizontal)
                            
                                DemoChart()
                                    .frame(width: 300, height: 250)
                        }
                            VStack {
                               
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(0..<3) { index in
                                            TopLocationViewCell()
                                        }
                                    }
                                    .padding(.horizontal, 5)
                                }
                                Button(action: {}, label: {
                                    HStack {
                                        Image("analytics")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                        Text("View Analytics")
                                            .foregroundStyle(.black)
                                    }
                                    
                                })
                                .frame(width: 350, height: 48)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(UIColor.App_Colors.appPlaceholderTextColor), lineWidth: 1) // Add border with color and width
                                )
                                .padding(.top, 15)
                                
                            }
                            .frame(height: 300)
                            
                            HStack(spacing: 10) {
                                Button {
                                    isTopListShow = true
                                    isRecentListShow = false
                                } label: {
                                    Text("Top Links")
                                        .frame(width: 120, height: 48)
                                        .foregroundStyle(isTopListShow == true ? Color.white : Color.gray)
                                        .background(isTopListShow == true ? Color(UIColor.App_Colors.mainDashboardTopColor) : Color(UIColor.App_Colors.screenColor))
                                        .cornerRadius(12)
                                    
                                }
                                
                                Button {
                                    isTopListShow = false
                                    isRecentListShow = true
                                } label: {
                                    Text("Recent Links")
                                        .foregroundStyle(isRecentListShow == true ? Color.white : Color.gray)
                                        .frame(width: 120, height: 48)
                                        .background(isRecentListShow == true ? Color(UIColor.App_Colors.mainDashboardTopColor) : Color(UIColor.App_Colors.screenColor))
                                        .cornerRadius(12)
                                }
                                Spacer()
                                Button(action: {
                                    
                                }, label: {
                                    Image("Search")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 45, height: 45)
                                })
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            
                            if isTopListShow {
                                    ForEach(viewModel.topLinks,  id: \.self) { index in
                                        TopLinksAndRecentLinksCell(topLinks: index)
                                            .padding(.bottom, 20)
                                    }
                                    .listRowSeparator(.hidden, edges: .all)
                                    .selectionDisabled()
                            } else {
                                
                                    ForEach(viewModel.recentLinks,  id: \.self) { index in
                                        TopLinksAndRecentLinksCell(topLinks: index)
                                        
                                            .padding(.bottom, 20)
                                    }
                                    .listRowSeparator(.hidden, edges: .all)

                                    .selectionDisabled()
                            }
                        }
                        
                        Button(action: {}, label: {
                            HStack {
                                Image("viewLinks")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                Text("View all Links")
                                    .foregroundStyle(Color.black)
                                    .font(.system(size: 18, weight: .medium))
                                    
                            }
                        })
                        .frame(width: 340, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(UIColor.App_Colors.appPlaceholderTextColor), lineWidth: 1) // Add border with color and width
                        )
                        
                        Button(action: {}, label: {
                            HStack {
                                Image("whatsappOne")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30, alignment: .leading)
                                Text("Talk with us")
                                    .foregroundStyle(Color.black)
                                    .font(.system(size: 18, weight: .medium))
                                    
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10)
                        })
                        .frame(width: 340, height: 50)
                        .background(Color(UIColor.App_Colors.talkWithUsColor))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(UIColor.App_Colors.appPlaceholderTextColor), lineWidth: 1)
                        )
                        .padding(.top, 10)
                        
                        Button(action: {}, label: {
                            HStack {
                                Image("faqOne")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30, alignment: .leading)
                                Text("Frequently Asked Questions")
                                    .foregroundStyle(Color.black)
                                    .font(.system(size: 18, weight: .medium))
                                    
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10)
                        })
                        .frame(width: 340, height: 50)
                        .background(Color(UIColor.App_Colors.faqColor))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(UIColor.App_Colors.appPlaceholderTextColor), lineWidth: 1) // Add border with color and width
                        )
                        .padding(.top, 10)
                        .padding(.bottom, 30)
                        
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .mask(
                        RoundedCorner(radius: 20, corners: [.topLeft, .topRight])
                    )
                }
                .edgesIgnoringSafeArea(.bottom)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .background(Color(UIColor.App_Colors.mainDashboardTopColor))
        .onAppear {
            viewModel.fetchData()
        }
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel())
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

