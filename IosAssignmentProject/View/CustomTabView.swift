//
//  CustomTabView.swift
//  IosAssignmentProject
//
//  Created by Gaurav Bhatt on 07/05/24.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var index: Int
    var body: some View {
        HStack {
            Button {
                self.index = 0
            } label: {
                VStack {
                    Image("Mail")
                    Text("links")
                        .foregroundStyle(Color.black)
                        .font(.caption)
                }
            }
            
            .foregroundColor(Color.black.opacity(self.index == 0 ? 1 : 0.2))
            .offset(x: 10)
            Spacer(minLength: 0)
            Button {
                self.index = 1
            } label: {
                VStack {
                    Image("Files")
                    Text("course")
                        .foregroundStyle(Color.black)
                        .font(.caption)
                }
            }
            .foregroundColor(Color.black.opacity(self.index == 1 ? 1 : 0.2))
            Spacer(minLength: 0)
            
            Button {
                self.index = 2
            } label: {
                Image("QR").renderingMode(.original)
            }
            .offset(y: -18)
            
            Spacer(minLength: 0)
            Button {
                self.index = 3
            } label: {
                VStack {
                    Image("Media")
                    Text("campaign")
                        .foregroundStyle(Color.black)
                        .font(.caption)
                }
            }
            .foregroundColor(Color.black.opacity(self.index == 3 ? 1 : 0.2))
            Spacer(minLength: 0)
            Button {
                self.index = 4
            } label: {
                VStack {
                    Image("Generic")
                    Text("profile")
                        .foregroundStyle(Color.black)
                        .font(.caption)
                }
            }
            .foregroundColor(Color.black.opacity(self.index == 4 ? 1 : 0.2))
        }
        .padding(.horizontal, 25)
        .padding(.top, 25)
        .background(Color(Color.white))
        //.clipShape(CShape())
    }
}

#Preview {
    CustomTabView(index: .constant(0))
}
