//
//  ViewController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/08/30.
//

import UIKit

class MainViewController: UIViewController {
    
    //    let img: UIImageView = {
    //        let img = UIImageView(image: UIImage(systemName: "person.circle.fill"))
    //        img.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
    //        img.translatesAutoresizingMaskIntoConstraints = false
    //        return img
    //    }()
    //
    let btn1: UIButton = {
        let btn1 = UIButton()
        btn1.setTitle("할일 확인하기", for: .normal)
        btn1.setTitleColor(.white, for: .normal)
        btn1.backgroundColor = .darkGray
        btn1.addTarget(self, action: #selector(pushbtn1), for: .touchUpInside)
        btn1.translatesAutoresizingMaskIntoConstraints = false
        return btn1
    }()
    
    let btn2: UIButton = {
        let btn2 = UIButton()
        btn2.setTitle("완료한일 보기", for: .normal)
        btn2.backgroundColor = .darkGray
        btn2.translatesAutoresizingMaskIntoConstraints = false
        return btn2
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let img = UIImageView(image: UIImage(systemName: "person.circle.fill"))
        img.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        img.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(img)
        
        img.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        img.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        
        self.view.addSubview(btn1)
        self.view.addSubview(btn2)
        
        NSLayoutConstraint.activate([
            btn1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn1.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 20),
            
            btn2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn2.topAnchor.constraint(equalTo: btn1.bottomAnchor, constant: 30),
        ])
        
    }
    
    @objc func pushbtn1() {
        let tdlView = tdlViewController()
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

