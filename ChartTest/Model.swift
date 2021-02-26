import UIKit

typealias Chart = [ChartBar]
typealias Charts = [Chart]

struct ChartBar {
  
  let value: CGFloat
  let color: UIColor
  
  static func getChartBars() -> [ChartBar] {
    var items = [ChartBar]()
    let rndNumber = Int.random(in: 3...15)
    for _ in 0...rndNumber {
      let rndValue = CGFloat.random(in: 0...100)
      let item = ChartBar(value: rndValue, color: .randomColor)
      items.append(item)
    }
    return items
  }
  
}


class ChartsFactory {
  static func getCharts() -> Charts {
    var charts = Charts()
    for _ in 0...9 {
      let chart = ChartBar.getChartBars()
      charts.append(chart)
    }
    return charts
  }
}
