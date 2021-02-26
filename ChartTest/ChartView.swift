import UIKit
import SnapKit

class ChartView: UIView {
  
  private let myChart = MyChart()
  private var timer: Timer?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    layout()
    setupTimer()
    setupTapGesture()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func layout() {
    addSubview(myChart)
    myChart.snp.makeConstraints({ make in
      make.bottom.equalToSuperview().inset(60)
      make.leading.trailing.equalToSuperview().inset(20)
      make.height.equalTo(100)
    })
  }
  
  private func setupTapGesture() {
    let gesture = UITapGestureRecognizer(target: self, action:  #selector(handleTap))
    myChart.addGestureRecognizer(gesture)
  }
  
  @objc
  private func handleTap(sender : UITapGestureRecognizer) {
    reload()
  }
  
  private func setupTimer() {
    timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
      self?.myChart.setNeedsDisplay()
    }
  }
  
  func reloadWithNewData(_ charts: Charts) {
    myChart.charts = charts
    myChart.setNeedsDisplay()
  }
  
  func reload() {
    timer?.invalidate()
    myChart.setNeedsDisplay()
    setupTimer()
  }
  
}
