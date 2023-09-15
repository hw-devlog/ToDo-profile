//
//  randomCatController.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/09/15.
//

import UIKit


class RandomCatController: UIViewController {
    
    let imageList: [RandomImage] = []
    
    private let randomCatView: UIImageView = {
        let randomCatView = UIImageView()
        randomCatView.translatesAutoresizingMaskIntoConstraints = false
       return randomCatView
    }()
    
    let randomCatButton: UIButton = {
        let randomButton = UIButton()
        randomButton.setTitle(" 고먐미", for: .normal)
        randomButton.setTitleColor(.blue, for: .normal)
        randomButton.backgroundColor = .white
        randomButton.translatesAutoresizingMaskIntoConstraints = false
        return randomButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        getRandomCatImage()
        catSetup()
    }
}

extension RandomCatController {
    func catSetup() {
        view.addSubview(randomCatView)
        view.addSubview(randomCatButton)
        randomCatButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        //imageView와 button의 레이아웃
        NSLayoutConstraint.activate([
            randomCatView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            randomCatView.widthAnchor.constraint(equalToConstant: 300),
            randomCatView.heightAnchor.constraint(equalToConstant: 300),
                       
            randomCatView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            randomCatView.leadingAnchor.constraint(equalTo: randomCatView.leadingAnchor),
            randomCatView.trailingAnchor.constraint(equalTo: randomCatView.trailingAnchor),
            randomCatView.bottomAnchor.constraint(equalTo: randomCatView.bottomAnchor),
            
            randomCatButton.topAnchor.constraint(equalTo: randomCatView.bottomAnchor, constant: 20),
            randomCatButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    //버튼 이벤트
    @objc func    buttonPressed() {
        getRandomCatImage()
       }
       //API 랜덤 이미지 불러오기
    func getRandomCatImage() {
        //가져올 데이터를 제공하는 API의 URL을 생성
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search") else { return }
        //URLSession 인스턴스 생성
        let session = URLSession(configuration: .ephemeral)
        //URLSession 인스턴스를 사용하여 데이터를 가져오기 위한 Data Task를 생성
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
           // Data Task가 완료되면 서버로부터 받은 데이터 또는 에러 정보를 처리
            let decoder = JSONDecoder()
            guard let randomCatImage = try? decoder.decode([RandomImage].self, from: data) else { return }
            if let imageUrl = URL(string: randomCatImage.first?.url ?? "") {
                //에러 처리
                let imageTask = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                    if let error = error {
                        print("Error: \(error)")
                    }
                    if let httpResponse = response as? HTTPURLResponse {
                        print("Status Code: \(httpResponse.statusCode)")
                    }
                    if let imageData = data, let image = UIImage(data: imageData) {
                        DispatchQueue.main.async {
                            self.randomCatView.image = image
                            //URLSession을 종료하여 리소스 관리와 메모리 누수를 방지
                            session.finishTasksAndInvalidate()
                            print("세션 종료")
                        }
                    }
                }
                imageTask.resume()
            }
        }
        task.resume()
    }
    
}
