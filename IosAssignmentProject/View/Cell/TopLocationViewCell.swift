//
//  TopLocationViewCell.swift
//  IosAssignmentProject
//
//  Created by Gaurav Bhatt on 04/05/24.
//

import SwiftUI

struct TopLocationViewCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("location")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(.top, 0)
            
            Text("123")
                .padding(.top, 8)
            Text("Todays clicks")
                .foregroundStyle(Color(UIColor.App_Colors.appPlaceholderTextColor))
                .padding([.bottom, .leading, .trailing], 0)
        }
        .frame(width: 150, height: 150)
        .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(UIColor.App_Colors.screenColor))
            )
    }
}

#Preview {
    TopLocationViewCell()
}
