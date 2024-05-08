//
//  ResponseModel.swift
//  IosAssignmentProject
//
//  Created by Gaurav Bhatt on 04/05/24.
//

import Foundation

struct Response: Codable {
    let status : Bool?
    let statusCode : Int?
    let message : String?
    let support_whatsapp_number : String?
    let extra_income : Double?
    let total_links : Int?
    let total_clicks : Int?
    let today_clicks : Int?
    let top_source : String?
    let top_location : String?
    let startTime : String?
    let links_created_today : Int?
    let applied_campaign : Int?
    let data : Data?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case statusCode = "statusCode"
        case message = "message"
        case support_whatsapp_number = "support_whatsapp_number"
        case extra_income = "extra_income"
        case total_links = "total_links"
        case total_clicks = "total_clicks"
        case today_clicks = "today_clicks"
        case top_source = "top_source"
        case top_location = "top_location"
        case startTime = "startTime"
        case links_created_today = "links_created_today"
        case applied_campaign = "applied_campaign"
        case data = "data"
    }

    
}

struct Data: Codable {
    let recent_links : [Top_links]?
    let top_links : [Top_links]?
    let favourite_links : [String]?
    let overall_url_chart: ChartData?

    enum CodingKeys: String, CodingKey {

        case recent_links = "recent_links"
        case top_links = "top_links"
        case favourite_links = "favourite_links"
        case overall_url_chart = "overall_url_chart"
    }

}

struct Top_links : Codable, Hashable {
    let url_id : Int?
    let web_link : String?
    let smart_link : String?
    let title : String?
    let total_clicks : Int?
    let original_image : String?
    let thumbnail : String?
    let times_ago : String?
    let created_at : String?
    let domain_id : String?
    let url_prefix : String?
    let url_suffix : String?
    let app : String?
    let is_favourite : Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case url_id = "url_id"
        case web_link = "web_link"
        case smart_link = "smart_link"
        case title = "title"
        case total_clicks = "total_clicks"
        case original_image = "original_image"
        case thumbnail = "thumbnail"
        case times_ago = "times_ago"
        case created_at = "created_at"
        case domain_id = "domain_id"
        case url_prefix = "url_prefix"
        case url_suffix = "url_suffix"
        case app = "app"
        case is_favourite = "is_favourite"
    }
}

struct ChartData: Codable {
    let num1 : Int?
    let num2 : Int?
    let num3 : Int?
    let num4 : Int?
    let num5 : Int?
    let num6 : Int?
    let num7 : Int?
    let num8 : Int?
    let num9 : Int?
    let num10 : Int?
    let num11 : Int?
    let num12 : Int?
    let num13 : Int?
    let num14 : Int?
    let num15 : Int?
    let num16 : Int?
    let num17 : Int?
    let num18 : Int?
    let num19 : Int?
    let num20 : Int?
    let num21 : Int?
    let num22 : Int?
    let num23 : Int?
    let num24 : Int?

    enum CodingKeys: String, CodingKey {

        case num1 = "00:00"
        case num2 = "01:00"
        case num3 = "02:00"
        case num4 = "03:00"
        case num5 = "04:00"
        case num6 = "05:00"
        case num7 = "06:00"
        case num8 = "07:00"
        case num9 = "08:00"
        case num10 = "09:00"
        case num11 = "10:00"
        case num12 = "11:00"
        case num13 = "12:00"
        case num14 = "13:00"
        case num15 = "14:00"
        case num16 = "15:00"
        case num17 = "16:00"
        case num18 = "17:00"
        case num19 = "18:00"
        case num20 = "19:00"
        case num21 = "20:00"
        case num22 = "21:00"
        case num23 = "22:00"
        case num24 = "23:00"
    }
   
}

struct Link: Codable, Identifiable {
    let id: Int
    let title: String
    // Additional properties if any
}


struct OverallData: Identifiable {
    let id = UUID()
    let date: Date
    let coffee: Int
    
    static func mockData() -> [OverallData] {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return [
            OverallData(date: calendar.date(from: DateComponents(year: 2023, month: 8))!, coffee: 12),
            OverallData(date: calendar.date(from: DateComponents(year: 2023, month: 9))!, coffee: 15),
            OverallData(date: calendar.date(from: DateComponents(year: 2023, month: 10))!, coffee: 8),
            OverallData(date: calendar.date(from: DateComponents(year: 2023, month: 11))!, coffee: 18),
            OverallData(date: calendar.date(from: DateComponents(year: 2023, month: 12))!, coffee: 14),
            OverallData(date: calendar.date(from: DateComponents(year: 2024, month: 1))!, coffee: 22),
        ]
    }
}


