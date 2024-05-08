//
//  ContentViewModel.swift
//  IosAssignmentProject
//
//  Created by Gaurav Bhatt on 04/05/24.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var greeting: String = ""
    @Published var topLinks: [Top_links] = []
    @Published var recentLinks: [Top_links] = []
    @Published var overallUrlChart: ChartData?
    
    init() {
        fetchData()
    }
    
    func fetchData() {
            guard let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew") else {
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else { return }
                do {
                    let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
                    DispatchQueue.main.async {
                        self.greeting = self.getGreeting()
                        self.overallUrlChart = decodedResponse.data?.overall_url_chart
                        self.topLinks = decodedResponse.data?.top_links ?? []
                        self.recentLinks = decodedResponse.data?.recent_links ?? []
                    }
                } catch let error {
                    print("Error: \(error)")
                }
            }.resume()
        }
        
    
    private func getGreeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour < 12 {
            return "Good morning!"
        } else if hour < 18 {
            return "Good afternoon!"
        } else {
            return "Good evening!"
        }
    }
}
