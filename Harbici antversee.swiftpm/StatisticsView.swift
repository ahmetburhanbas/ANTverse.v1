import SwiftUI

struct StatisticsView: View {
    // Example statistics - replace with your actual data source
    var eggsCount: Int = 0
    var workerAntsCount: Int = 5
    var waterLevel: Double = 75.5 // in milliliters
    
    var body: some View {
        ZStack {
            Color(.systemBackground) // Use a system background color that adapts to light/dark mode
                .edgesIgnoringSafeArea(.all)
            
            // Use a vertical stack to layout your statistics
            VStack(spacing: 20) {
                Spacer()
                
                // Displaying the number of eggs
                StatisticItemView(label: "Eggs", value: "\(eggsCount)")
                
                // Displaying the number of worker ants
                StatisticItemView(label: "Worker Ants", value: "\(workerAntsCount)")
                
                // Displaying the amount of water left
                StatisticItemView(label: "Water Left", value: "\(waterLevel) mL")
                
                Spacer()
            }
            .padding() // Add some padding around the VStack
        }
    }
}

// A reusable view for displaying each statistic
struct StatisticItemView: View {
    var label: String
    var value: String
    
    var body: some View {
        HStack {
            Text(label + ":")
                .font(.headline) // Style for the label
                .foregroundColor(.secondary) // A secondary color for the label
            Spacer()
            Text(value)
                .font(.title) // Larger font size for the value
                .foregroundColor(.primary) // Primary color for better readability
        }
        .padding() // Add padding to each HStack for better spacing
        .background(Color(.secondarySystemBackground)) // A slight background color
        .cornerRadius(10) // Rounded corners for a polished look
    }
}

// Preview provider
struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
