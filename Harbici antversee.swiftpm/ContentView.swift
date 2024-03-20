import SwiftUI

struct ContentView: View {
    var body: some View {
        /*#-code-walkthrough(ContentView.tabView)*/
        TabView {
            MyColonyView()

                .tabItem {
                    Label("My Colony", systemImage:  "testtube.2")
                }
  
            StatisticsView()
                .tabItem {
                    Label("Statistics", systemImage: "plus.forwardslash.minus")
                }

        }
        
        
    }
}

// Preview provider for StatisticsView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Render the StatisticsView in the preview
        ContentView()
            .previewDevice("iPhone 13") // Specify the preview device here
    }
}
