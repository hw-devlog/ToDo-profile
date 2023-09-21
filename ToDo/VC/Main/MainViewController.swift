//
//  ViewController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/08/30.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainImage: UIImageView = {
        let mainImage = UIImageView()
        mainImage.contentMode = .scaleAspectFit
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        return mainImage
    }()
    
    private var btn1: UIButton = {
        let btn1 = UIButton()
        btn1.setTitle("할일 확인하기", for: .normal)
        btn1.setTitleColor(.blue, for: .normal)
        btn1.backgroundColor = .white
        btn1.addTarget(self, action: #selector(pushbtn1), for: .touchUpInside)
        btn1.translatesAutoresizingMaskIntoConstraints = false
        return btn1
    }()
    
    private var btn2: UIButton = {
        let btn2 = UIButton()
        btn2.setTitle("완료한일 보기", for: .normal)
        btn2.setTitleColor(.blue, for: .normal)
        btn2.backgroundColor = .white
        btn2.addTarget(self, action: #selector(pushbtn2), for: .touchUpInside)
        btn2.translatesAutoresizingMaskIntoConstraints = false
        return btn2
    }()
    
    private var btn3: UIButton = {
        let btn3 = UIButton()
        btn3.setTitle("랜덤 고양이", for: .normal)
        btn3.setTitleColor(.blue, for: .normal)
        btn3.backgroundColor = .white
        btn3.addTarget(self, action: #selector(pushbtn3), for: .touchUpInside)
        btn3.translatesAutoresizingMaskIntoConstraints = false
        return btn3
    }()
    
    private var btn4: UIButton = {
        let btn4 = UIButton()
        btn4.setTitle("ProfileDesignViewController", for: .normal)
        btn4.setTitleColor(.blue, for: .normal)
        btn4.backgroundColor = .white
        btn4.translatesAutoresizingMaskIntoConstraints = false
        btn4.addTarget(self, action: #selector(pushbtn4), for: .touchUpInside)
        return btn4
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        mainConfigureUI()
    }
}

//main화면 로고 이미지
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let img = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = img
                    }
                }
            }
        }
    }
}

extension MainViewController {
    func mainConfigureUI() {
        NSLayoutConstraint.activate([
            mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImage.widthAnchor.constraint(equalToConstant: 300),
            mainImage.heightAnchor.constraint(equalToConstant: 150),
                       
            mainImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            mainImage.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor),
            mainImage.bottomAnchor.constraint(equalTo: mainImage.bottomAnchor),
            
            btn1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn1.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 20),
            
            btn2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn2.topAnchor.constraint(equalTo: btn1.bottomAnchor, constant: 20),
            
            btn3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn3.topAnchor.constraint(equalTo: btn2.bottomAnchor, constant: 20),
            
            btn4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn4.topAnchor.constraint(equalTo: btn3.bottomAnchor, constant: 20)
            
        ])
    }
    
    func setup() {
        view.backgroundColor = .white
        
        let url = URL(string: "https://spartacodingclub.kr/css/images/scc-og.jpg")
        mainImage.load(url: url!)

        self.view.addSubview(mainImage)
        self.view.addSubview(btn1)
        self.view.addSubview(btn2)
        self.view.addSubview(btn3)
        self.view.addSubview(btn4)
    }
    
    //TodoList 페이지로 이동
    @objc func pushbtn1() {
        let tdlView = TodoTableViewController()
        navigationController?.pushViewController(tdlView, animated: true)
    }
    @objc func pushbtn2() {
        let doneView = DoneViewController()
        navigationController?.pushViewController(doneView, animated: true)
    }
    @objc func pushbtn3() {
        let randomView = RandomCatController()
        navigationController?.pushViewController(randomView, animated: true)
    }
    @objc func pushbtn4() {
        let presentView = ProfileDesignViewController()
        presentView.modalPresentationStyle = UIModalPresentationStyle.fullScreen
         self.present(presentView, animated: true, completion: nil)
    }
}




////전처리기 (컴파일 되기 전에 처리되는 프로그램, 디버깅을 위해)
//#if DEBUG
//
//import SwiftUI
//struct ViewControllerRepresentable: UIViewControllerRepresentable {
//
//  //update
//  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//  }
//
//  //makeUI
//  @available(iOS 13.0,*)
//  func makeUIViewController(context: Context) -> UIViewController {
//      MainViewController()
//
//  }
//}
//
//struct ViewController_Previews: PreviewProvider {
//  static var previews: some View {
//    Group {
//      ViewControllerRepresentable()
//        .previewDisplayName("ViewController")
//    }
//  }
//
//}
//// 커맨드옵션엔터로 프리뷰창 띄움
//// 커맨드옵션p 로 빌드
//#endif

