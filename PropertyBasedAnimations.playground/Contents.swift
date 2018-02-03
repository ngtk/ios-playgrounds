import UIKit
import PlaygroundSupport
import SnapKit


// Property-Based Animations
// UIViewPropertyAnimator
class MyViewController : UIViewController {

    lazy private var view1: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    lazy private var view2: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    lazy private var button1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Invoke animation", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(invokeAnimation(_:)), for: .touchUpInside)
        return button
    }()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view

        self.view1.alpha = 0
        self.view2.alpha = 1
        self.view.addSubview(button1)
        self.view.addSubview(view1)
        self.view.addSubview(view2)

        makeConstraints()
    }

    private func makeConstraints() {
        self.view1.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.top.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
        }

        self.view2.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.top.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
        }

        self.button1.snp.makeConstraints { make in
            make.top.equalTo(view1.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }
    }

    @objc func invokeAnimation(_ sender: UIButton) {
        let animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut) {
            self.view1.alpha = self.view1.alpha == 0 ? 1 : 0
            self.view2.alpha = self.view2.alpha == 0 ? 1 : 0
        }
        animator.startAnimation()
    }
}



// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
