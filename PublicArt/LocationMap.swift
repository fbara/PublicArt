
import SwiftUI

struct LocationMap: View {
    @Binding var showModal: Bool
    var artwork: Artwork
    
    var body: some View {
        VStack {
            MapView(coordinate: artwork.coordinate)
            HStack {
                Text(self.artwork.locationName)
                    .padding(.leading)
                Spacer()
                Button("Done") {
                    self.showModal = false
                }
                .padding(.all)
                
            }
        }
    }
}

struct LocationMap_Previews: PreviewProvider {
    static var previews: some View {
        LocationMap(showModal: .constant(true), artwork: artData[0])
    }
}
