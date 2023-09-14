//
//  ViewController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/08/30.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainImage: UIImageView = {
        let mainImage = UIImageView()
        mainImage.contentMode = .scaleAspectFit
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        return mainImage
    }()
    
    lazy var btn1: UIButton = {
        let btn1 = UIButton()
        btn1.setTitle("할일 확인하기", for: .normal)
        btn1.setTitleColor(.blue, for: .normal)
        btn1.backgroundColor = .white
        btn1.addTarget(self, action: #selector(pushbtn1), for: .touchUpInside)
        btn1.translatesAutoresizingMaskIntoConstraints = false
        return btn1
    }()
    
    lazy var btn2: UIButton = {
        let btn2 = UIButton()
        btn2.setTitle("완료한일 보기", for: .normal)
        btn2.setTitleColor(.blue, for: .normal)
        btn2.backgroundColor = .white
        btn2.translatesAutoresizingMaskIntoConstraints = false
        return btn2
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
            btn2.topAnchor.constraint(equalTo: btn1.bottomAnchor, constant: 30),
        ])
    }
    
    func setup() {
        view.backgroundColor = .white
        
        let url = URL(string: "https://spartacodingclub.kr/css/images/scc-og.jpg")
        mainImage.load(url: url!)

        self.view.addSubview(mainImage)
        self.view.addSubview(btn1)
        self.view.addSubview(btn2)
    }
    
    //TodoList 페이지로 이동
    @objc func pushbtn1() {
        let tdlView = TodoTableViewController()
        navigationController?.pushViewController(tdlView, animated: true)
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

