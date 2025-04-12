
import Dependencies
import Foundation

struct AssetsApiClient{
    
    var fetchAllAssets: () async throws ->[Asset]
}
enum NetworkingError: Error {
    case invalidURL
}

extension AssetsApiClient: DependencyKey {
    
    static var liveValue: AssetsApiClient {
        .init(
          fetchAllAssets: {
            let urlSession = URLSession.shared
            guard let url = URL(string: "http://4ff399d1-53e9-4a28-bc99-b7735bad26bd.mockpstmn.io/v3/assets") else{
                throw NetworkingError.invalidURL
            }
            let(data, _) = try await urlSession.data(for: URLRequest(url: url))
            let assetsResponse = try JSONDecoder().decode(AssetsResponse.self, from: data)
            
            return assetsResponse.data
           }
        )
    }
    static var previewValue: AssetsApiClient{
        .init(
            fetchAllAssets: {[
                .init(
                    id:"Bitcoin",
                    name: "Bitcoin",
                    symbol: "BTC",
                    priceUsd: "23782359.2442",
                    changePercent24Hr: "21414.242"
                ),
                .init(
                    
                    id:"ETHE",
                    name: "Ethereum",
                    symbol: "ETH",
                    priceUsd: "23782359.2442",
                    changePercent24Hr: "21414.242"
                ),
                .init (
                    id:"Solana",
                    name: "Solana",
                    symbol: "SOL",
                    priceUsd: "23782359.2442",
                    changePercent24Hr: "21414.242"
                )
            ]})
        }
            static var testValue: AssetsApiClient{
                .init(fetchAllAssets: {
                    reportIssue("AssetsApiClient.fetchAllAssets is unimplemented")
                    return[]
                })
            }
        
}
            extension DependencyValues{
                var assetsApiClient: AssetsApiClient{
                    get { self[AssetsApiClient.self] }
                    set { self[AssetsApiClient.self] = newValue}
}
}

