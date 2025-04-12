//
//  AssetDetailView.swift
//  Crypto-iOS
//
//  Created by user272757 on 4/12/25.
//

import SwiftUI

struct AssetDetailView: View {
    
    let asset: Asset
    var body: some View {
        Text(asset.name)
            .navigationTittle(asset.name)
    }
}
#Preview{
    AssetDetailView(
        asset: .init(
            id: "bitcoin",
            name: "Bitcoin",
            symbol: "BTC",
            PriceUsd: "123123.123.123",
            changePercent24Hr: "9.99292"
            
        )
    )
}

