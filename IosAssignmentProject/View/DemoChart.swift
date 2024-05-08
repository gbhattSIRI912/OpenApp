//
//  DemoChart.swift
//  IosAssignmentProject
//
//  Created by Gaurav Bhatt on 08/05/24.
//

import SwiftUI
import Charts

struct DemoChart: View {
  @State private var overallData = OverallData.mockData()

  private var areaBackground: Gradient {
    return Gradient(colors: [Color.accentColor, Color.accentColor.opacity(0.1)])
  }

  var body: some View {
    Chart(overallData) {
      LineMark(
        x: .value("Month", $0.date, unit: .month),
        y: .value("Amount", $0.coffee)
      )
      .symbol(.circle)
      .interpolationMethod(.catmullRom)
      
      AreaMark(
        x: .value("Month", $0.date, unit: .month),
        y: .value("Amount", $0.coffee)
      )
      .interpolationMethod(.catmullRom)
      .foregroundStyle(areaBackground)
    }
    .chartXAxis {
      AxisMarks(values: .stride(by: .month, count: 1)) { _ in
        AxisValueLabel(format: .dateTime.month(.abbreviated).year(.twoDigits), centered: true)
      }
    }
    .chartYScale(domain: 0 ... 30)
    .frame(height: 300)
    .padding()
  }
}




struct WeatherData: Identifiable {
    let id = UUID()
    let date: Date
    let temperature: Double
 
    init(year: Int, month: Int, day: Int, temperature: Double) {
        self.date = Calendar.current.date(from: .init(year: year, month: month, day: day)) ?? Date()
        self.temperature = temperature
    }
}

#Preview {
    DemoChart()
}
