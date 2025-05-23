//
//  AssetViewTests.swift
//  Crypto-iOS
//
//  Created by user272757 on 4/24/25.
//

import Testing

@testable import Crypto_iOS

struct AssetViewStateTests {
    
    @Test func percentagePositive() async throws {
        let viewState = AssetViewState(
            .init(
                id: "a",
                name: "a",
                symbol: "a",
                priceUsd: "1",
                changePercent24Hr: "8"
            )
        )
        
        #expect(viewState.percentageColor == .green)
    }
    
    @Test func percentageNegative() async throws {
        let viewState = AssetViewState(
            .init(
                id: "a",
                name: "a",
                symbol: "a",
                priceUsd: "1",
                changePercent24Hr: "-8"
            )
        )
        
        #expect(viewState.percentageColor == .red)

    }
}
