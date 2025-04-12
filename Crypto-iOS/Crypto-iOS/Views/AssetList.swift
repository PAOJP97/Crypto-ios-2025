import SwiftUI


struct AssetList: View {
    
    @State var viewModel: AssetListViewModel = .init()
    
    var body:some View {
        NavigationStack{
            Text(viewModel.errorMessage ?? "")
            List{
                ForEach(viewModel.assets){ asset in
                    NavigationLink{
                        AssetDetailView(asset: asset)
                    } label: {
                        AssetView(asset: asset)
                    }
                }
            }
            .listStyle(.plain)
            //       Button("Fetch assets"){
            //          Task {
            //              await viewModel.fetchAssets()
            //         }
            //     }
            // .onAppear { //Aparece el componente
            //}
            //.onDisappear {
            //***}
            
            .task {
                await viewModel.fetchAssets()
            }
            
        }
        .navigationTitle("Home")
    }
}

#Preview{
   AssetList()
}

 
