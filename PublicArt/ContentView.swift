// BaraLabs (c) 2019

import SwiftUI

struct ContentView: View {
    let artworks = artData
    
    var body: some View {
        NavigationView {
            List(artworks) { artwork in
                NavigationLink(
                    destination: DetailView(artwork: artwork)) {
                        Text(artwork.title)
                }
            }
            .navigationBarTitle("Artwork")
            DetailView(artwork: artworks[0])
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
