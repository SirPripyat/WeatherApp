import UIKit

class DailyForecastTableViewCell: UITableViewCell {
  
  static let identifier: String = "DailyForecastTableViewCell"
  
  private lazy var weekDayLabel: UILabel = {
    let label = UILabel()
    
    label.translatesAutoresizingMaskIntoConstraints = false
    
    label.text = "ter".uppercased()
    label.textColor = .contrastColor
    
    label.font = .systemFont(ofSize: 12, weight: .bold)
    
    return label
  }()
  
  private lazy var iconImageView: UIImageView = {
    let imageView = UIImageView()
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    imageView.contentMode = .scaleAspectFit
    imageView.image = UIImage(named: "cloudIcon")
    
    return imageView
  }()
  
  private lazy var minTemperatureLabel: UILabel = {
    let label = UILabel()
    
    label.translatesAutoresizingMaskIntoConstraints = false
    
    label.text = "min 25°C"
    label.textColor = .contrastColor
    
    label.font = .systemFont(ofSize: 12, weight: .bold)
    
    return label
  }()
  
  private lazy var maxTemperatureLabel: UILabel = {
    let label = UILabel()
    
    label.translatesAutoresizingMaskIntoConstraints = false
    
    label.text = "máx 25°C"
    label.textColor = .contrastColor
    
    label.font = .systemFont(ofSize: 12, weight: .bold)
    
    return label
  }()
  
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [weekDayLabel, iconImageView, minTemperatureLabel, maxTemperatureLabel])
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    stackView.axis = .horizontal
    
    stackView.isLayoutMarginsRelativeArrangement = true
    stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
      top: 16, leading: 16, bottom: 16, trailing: 16
    )
    stackView.spacing = 16
    stackView.distribution = .equalSpacing
    
    return stackView
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupView() {
    backgroundColor = .clear
    selectionStyle = .none
    
    setHierarchy()
    setConstraints()
  }
  
  private func setHierarchy() {
    contentView.addSubview(stackView)
  }
  
  private func setConstraints() {
    stackViewConstraints()
  }
  
  private func stackViewConstraints() {
    stackView.setConstraintsToParent(contentView)
  }

}
