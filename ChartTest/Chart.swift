import UIKit

class MyChart: UIView, CAAnimationDelegate {
  
  var charts = Charts()
  var turn = 0
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    draw()
  }
  
  private func draw() {
    if charts.count <= turn {
      turn = 0
    }
    
    let currentChart = charts[turn]
    layer.sublayers?.forEach { $0.removeFromSuperlayer() }
    
    guard currentChart.count > 0 else {
      return
    }
    let numberOfItems = CGFloat(currentChart.count)
    let screenWidth = UIScreen.main.bounds.width
    let itemWidth = (screenWidth - (numberOfItems * 10) - 40) / numberOfItems
    
    var multiplier: CGFloat = 0
    if UIDevice.current.orientation.isLandscape {
      multiplier = 2.5
    } else {
      multiplier = 5
    }
    
    var offset: CGFloat = 0
    for (index, item) in currentChart.enumerated() {
      let multipliedValue =  item.value * multiplier
      
      if index == 0 {
        offset = CGFloat(itemWidth / 2)
      } else {
        offset = offset + CGFloat(itemWidth) + 10
      }
      
      let shapeLayer = CAShapeLayer()
      let path = UIBezierPath()
      
      path.move(to: CGPoint(x: offset, y: bounds.maxY))
      path.addLine(to: CGPoint(x: offset, y: bounds.maxY - multipliedValue))
      
      shapeLayer.strokeColor = item.color.cgColor
      shapeLayer.lineWidth = CGFloat(itemWidth)
      shapeLayer.path = path.cgPath
      
      layer.addSublayer(shapeLayer)
      let animation = CABasicAnimation(keyPath: "strokeEnd")
      animation.fromValue = 0
      animation.duration = 1.5
      shapeLayer.add(animation, forKey: "animation")
      
    }
    
    turn += 1
  }
  
}
