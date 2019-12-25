
import SwiftUI

struct ArtTabView: View {
    @State var artworks = artData
    
    var body: some View {
        TabView {
            NavigationView {
                ArtList(artworks: $artworks, tabTitle: "All Artworks", hideVisited: false)
                DetailView(artwork: artworks[0])
            }
            .tabItem({
                Text("Artworks 💕 🙏 🌟")
            })
            
           NavigationView {
               ArtList(artworks: $artworks, tabTitle: "Unvisited Artworks", hideVisited: true)
               DetailView(artwork: artworks[0])
           }
           .tabItem({
               Text("Unvisited Artworks") })
        }
    }
}

struct ArtTabView_Previews: PreviewProvider {
    static var previews: some View {
        ArtTabView()
    }
}

struct ArtList: View {
    @Binding var artworks: [Artwork]
    let tabTitle: String
    let hideVisited: Bool
    
    var showArt: [Artwork] {
        hideVisited ? artworks.filter { $0.reaction == "" } : artworks
    }
    
    private func setReaction(_ reaction: String, for item: Artwork) {
        if let index = self.artworks.firstIndex(
            where: { $0.id == item.id }) {
            artworks[index].reaction = reaction
        }
    }
    
    var body: some View {
        
        List(showArt) { artwork in
            NavigationLink(
            destination: DetailView(artwork: artwork)) {
                Text("\(artwork.reaction) \(artwork.title)")
                    .contextMenu {
                        Button("Love it: 💕") {
                            self.setReaction("💕", for: artwork)
                        }
                        Button("Thoughtful: 🙏") {
                            self.setReaction("🙏", for: artwork)
                        }
                        Button("Wow!: 🌟") {
                            self.setReaction("🌟", for: artwork)
                        }
                }
            }
        }
        .navigationBarTitle(tabTitle)
    }
}
