import UIKit

class ChartViewController: UIViewController, ViewHolder {
  
  typealias RootViewType = ChartView
  
  override func loadView() {
    view = RootViewType()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    rootView.reloadWithNewData(ChartsFactory.getCharts())
  }
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    rootView.reload()
  }
  
}
