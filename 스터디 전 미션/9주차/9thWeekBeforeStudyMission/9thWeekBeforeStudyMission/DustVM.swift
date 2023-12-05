//
//  WeatherVM.swift
//  9thWeekBeforeStudyMission
//
//  Created by 김제훈 on 12/5/23.
//

import Foundation
import Alamofire

// MARK: - Dust
struct Dust: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let body: Body
    let header: Header
}

// MARK: - Body
struct Body: Codable {
    let totalCount: Int
    let items: [Item]
    let pageNo, numOfRows: Int
}

// MARK: - Item
struct Item: Codable {
    let clearVal, sn, districtName, dataDate: String
    let issueVal, issueTime, clearDate, issueDate: String
    let moveName, clearTime: String
    let issueGbn: IssueGbn
    let itemCode: ItemCode
}

enum IssueGbn: String, Codable {
    case 주의보 = "주의보"
}

enum ItemCode: String, Codable {
    case pm10 = "PM10"
    case pm25 = "PM25"
}

// MARK: - Header
struct Header: Codable {
    let resultMsg, resultCode: String
}


class DustVM {
    func fetchData(_ vc: ViewController) {
        let url = "http://apis.data.go.kr/B552584/UlfptcaAlarmInqireSvc/getUlfptcaAlarmInfo?year=2020&pageNo=1&numOfRows=100&returnType=json&serviceKey=iONMv7wCLpHGo/OfjT/zAEoxIg62CzB9zyxbH0QMS8hwbBG22Z6vUQjAM4FvMr1j4vEGqwEjPR5I/6gwVnMEfw=="
        let params: Parameters = [
//            "year" : 2023,
//            "pageNo" : 1,
            "numOfRows" : 100,
            "returnType" : "json",
            "serviceKey" : "iONMv7wCLpHGo/OfjT/zAEoxIg62CzB9zyxbH0QMS8hwbBG22Z6vUQjAM4FvMr1j4vEGqwEjPR5I/6gwVnMEfw=="
        ]
        
        //HTTP Method GET
        AF.request(url, method: .get, parameters: params, headers: nil)
            .responseDecodable(of: Dust.self) {response in
            
            switch response.result{
            case .success(let response):
                vc.didSuccess(response)
            case .failure(let error):
                print("DEBUG>> OpenWeather Get Error : \(error.localizedDescription)")
            }
        }
    }
}
