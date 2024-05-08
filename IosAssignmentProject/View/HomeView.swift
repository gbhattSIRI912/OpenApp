//
//  HomeView.swift
//  IosAssignmentProject
//
//  Created by Gaurav Bhatt on 07/05/24.
//

import SwiftUI

struct HomeView: View {
    @State var index = 0
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                if index == 0 {
                    ContentView(viewModel: ContentViewModel())
                } else if index == 1 {
                    Color.blue
                } else if index == 2 {
                    Color.green
                } else if index == 3 {
                    Color.yellow
                } else {
                    Color.black
                }
               // Color.red
            }
            .padding(.bottom, -35)
            
            CustomTabView(index: self.$index)
        }
       // .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.top))
        
    }
}

#Preview {
    HomeView()
}

