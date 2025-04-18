import SwiftUI

struct AssetView: View{
    
    let asset: Asset
    
    var body: some View{
        Grid{
            GridRow{
                AsyncImage(
                    url: asset.iconUrl){
                        image in image
                            .resizable()
                    } placeholder: {
                        Image(systemName: "dollarsign.gauge.chart.lefthalf.righthalf")
                    }
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading){
                    Text(asset.symbol)
                        .font(.headline)
                    Text(asset.name)
                        .font(.headline)
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Spacer()
                
                Text(asset.formattedPercentage)
                    .foregroundStyle(asset.percentage >= 0 ? .green : .red)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text(asset.formattedPrice)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            //.padding(.horizontal)
        }
    }
    
}
#Preview{
    AssetView(
        asset: .init(
            id: "bitcoin",
            name: "Bitcoin",
            symbol: "BTC",
            priceUsd: "82447.1019674762194254",
            changePercent24Hr: "7.7201185550538720"
        )
    )
}
