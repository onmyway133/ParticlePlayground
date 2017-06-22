import PlaygroundSupport
import UIKit

class EmitterView: UIView {
  let emitterLayer = CAEmitterLayer()

  override init(frame: CGRect) {
    super.init(frame: frame)

    let cell = CAEmitterCell()
    cell.birthRate = 2
    cell.lifetime = 5.0
    cell.velocity = 100
    cell.velocityRange = 50
    cell.emissionLongitude = CGFloat.pi
    cell.spinRange = 5
    cell.scale = 0.5
    cell.scaleRange = 0.25
    cell.color = UIColor(white: 1, alpha: 0.9).cgColor
    cell.alphaSpeed = -0.025
    cell.contents = UIImage(named: "heart")?.cgImage

    emitterLayer.emitterCells = [cell]
    layer.addSublayer(emitterLayer)

    backgroundColor = .white
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    emitterLayer.emitterPosition = CGPoint(x: frame.width / 2.0, y: -50)
    emitterLayer.emitterShape = kCAEmitterLayerLine
    emitterLayer.emitterSize = CGSize(width: frame.width, height: 1)
    emitterLayer.renderMode = kCAEmitterLayerAdditive
  }
}

let frame = CGRect(x: 0, y: 0, width: 320, height: 568)
PlaygroundPage.current.liveView = EmitterView(frame: frame)
PlaygroundPage.current.needsIndefiniteExecution = true

