import UIKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
  
  static let identifier: String = "HourlyForecastCollectionViewCell"
  
  private lazy var hourLabel: UILabel = {
    let label = UILabel()
    
    label.translatesAutoresizingMaskIntoConstraints = false
    
    label.textColor = UIColor(named: "contrastColor")
    label.textAlignment = .center
    
    label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
    
    return label
  }()
  
  private lazy var temperatureLabel: UILabel = {
    let label = UILabel()
    
    label.translatesAutoresizingMaskIntoConstraints = false
    
    label.textColor = .contrastColor
    label.textAlignment = .center
    
    label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    
    return label
  }()
  
  private lazy var weatherIconImageView: UIImageView = {
    let imageView = UIImageView()
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    imageView.contentMode = .scaleAspectFit
    
    return imageView
  }()
  
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [hourLabel, weatherIconImageView, temperatureLabel])
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    stackView.axis = .vertical
    stackView.spacing = 4
    
    stackView.isLayoutMarginsRelativeArrangement = true
    
    stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
    
    stackView.layer.borderWidth = 1
    stackView.layer.borderColor = UIColor.contrastColor?.cgColor
    stackView.layer.cornerRadius = 20
    
    return stackView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func loadWeatherData(time: String?, icon: UIImage?, temperature: String?) {
    hourLabel.text = time
    weatherIconImageView.image = icon
    temperatureLabel.text = temperature
  }
  
  private func setupView() {
    setHierarchy()
    setContraints()
  }
  
  private func setHierarchy() {
    contentView.addSubview(stackView)
  }
  
  private func setContraints() {
    weatherIconImageViewConstraints()
    stackViewConstraints()
  }
  
  private func weatherIconImageViewConstraints() {
    NSLayoutConstraint.activate([
      weatherIconImageView.heightAnchor.constraint(equalToConstant: 32),
      weatherIconImageView.widthAnchor.constraint(equalToConstant: 32),
      weatherIconImageView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
    ])
  }
  
  private func stackViewConstraints() {
    stackView.setConstraintsToParent(contentView)
  }
  
}
