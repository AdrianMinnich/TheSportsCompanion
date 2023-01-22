//
//  NetworkService.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 23/07/2022.
//

import Foundation
import RxSwift

protocol NetworkServiceProtocol {
    func getStandings(for season: String) -> Observable<FootballAPIResponse>
}

class NetworkService: NetworkServiceProtocol {

    private let baseURL = "https://v3.football.api-sports.io"

    func getStandings(for season: String) -> Observable<FootballAPIResponse> {
        let url = URL(string: baseURL + "/standings?" + "league=" + Environment.shared.leagueID + "&season=" + season)
        var request = URLRequest(url: url!)
        request.appendHttpHeaders()
        return execute(request: request)
    }

    private func execute<T: Decodable>(request: URLRequest) -> Observable<T> {
        return Observable.create { observer -> Disposable in
            let task = URLSession.shared.dataTask(with: request) { data, _, _ in
                guard let data = data else {
                    return
                }
                guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
                    return
                }
                observer.onNext(decodedData)
                observer.onCompleted()
            }
            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}
