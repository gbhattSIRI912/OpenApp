//
//  TopLinksAndRecentLinksCell.swift
//  IosAssignmentProject
//
//  Created by Gaurav Bhatt on 04/05/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct TopLinksAndRecentLinksCell: View {
    var topLinks: Top_links
    var body: some View {
        VStack {
            HStack {
               
                    WebImage(url: URL(string: "\(topLinks.original_image ?? "amazon"))"))
                        .frame(width: 60, height: 60)
                        .background(Color(UIColor.App_Colors.faqColor))
                        .cornerRadius(4)
                
                VStack(spacing: 0) {
                    HStack {
                        Text("\(topLinks.smart_link ?? "")")
                            .lineLimit(1)
                        Spacer()
                        Text("\(topLinks.total_clicks ?? 0)")
                        
                    }
                    .padding([.trailing], 10)
                    HStack {
                        Text("\(topLinks.times_ago!)")
                        Spacer()
                        Text("Clicks")
                        
                    }
                    .padding([.trailing], 10)
                }
            }
            .padding([.leading, .trailing, .bottom], 10)
            
            VStack {
                //Spacer()
                HStack {
                    Text("\(topLinks.web_link ?? "")")
                        .lineLimit(1)
                    Spacer()
                    Button(action: {}, label: {
                        Image("copy")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    })
                }
                .padding([.leading, .trailing, .bottom, .top], 10)
                .background(Color(UIColor.App_Colors.sampleLinkBgColor))
                .frame(maxWidth: .infinity, alignment: .bottom)
            }
            .frame(maxWidth: .infinity, alignment: .bottom)
            .background(Color.gray)
        }
        .frame(width: UIScreen.main.bounds.width - 32, height: 140, alignment: .bottom)
        .background(Color(uiColor: UIColor.App_Colors.screenColor))
        .cornerRadius(10)
    }
}

//#Preview {
//    TopLinksAndRecentLinksCell(topLinks: Top_links(from: <#any Decoder#>))
//}
