//
//  ViewController.swift
//  3thWeekBeforeStudyMission
//
//  Created by 김제훈 on 2023/10/06.
//

import UIKit

struct Post {
    var title: String
    var address: String
    var price: String
    var commentCount: Int
    var likeCount: Int
}

class ViewController: UIViewController {
    @IBOutlet var addPostButton: UIButton!
    
    @IBOutlet var tableView: UITableView!
    
    var postList: [Post] = [
        Post(title: "에어팟맥스실버", address: "서울특별시 양천구", price: "370,000원", commentCount: 5, likeCount: 23),
        Post(title: "에어팟 맥스 스페이스그레이 S급 판매합니다.", address: "서울특별시 양천구", price: "490,000원", commentCount: 1, likeCount: 4),
        Post(title: "[S급]에어팟 맥스 스페이스 그레이 풀박 판매합니다.", address: "서울특별시 양천구", price: "550,000원", commentCount: 1, likeCount: 7),
        Post(title: "보일러 온돌(배관)", address: "천안동", price: "370,000원", commentCount: 5, likeCount: 23)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configure()
    }

    //MARK: - helper func
    private func configure() {
        tableView.dataSource = self
//        tableView.delegate = self
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customNaviLeftBarItem())
        
        setUIBtnCornerRadius(btn: addPostButton, radius: 20)
    }
    
    //Set UIButton CornerRadius
    private func setUIBtnCornerRadius(btn: UIButton, radius: CGFloat) {
        btn.layer.cornerRadius = radius
        btn.layer.masksToBounds = radius > 0
    }
    
    //Left Bar Item 설정
    private func customNaviLeftBarItem() -> UIView {
        let leftLabel = UILabel()
        leftLabel.text = "광명동"
        let leftButton = UIButton(type: .system)
        leftButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        leftButton.tintColor = UIColor.black
        let leftStackView = UIStackView(arrangedSubviews: [leftLabel, leftButton])
        leftStackView.axis = .horizontal
        leftStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: nil))
        return leftStackView
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("⭐️ Index \(indexPath.row)")
        print("\(indexPath.section)")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PostCell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else {
            return UITableViewCell()
        }
        
        cell.titleLabel.text = postList[indexPath.row].title
        cell.addressLabel.text  = postList[indexPath.row].address
        cell.priceLabel.text = postList[indexPath.row].price
        cell.commentCountLabel.text = "\(postList[indexPath.row].commentCount)"
        cell.likeCountLabel.text = "\(postList[indexPath.row].likeCount)"
        
        return cell
        
    }
    
    
}
