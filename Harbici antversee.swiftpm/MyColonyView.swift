import SwiftUI
import PlaygroundSupport

struct Ant: Identifiable {
    var id = UUID()
    var position: CGPoint
    var toggleFrame: Bool = false
    var rotation: Double = 0 
}

// Ant View
struct AntView: View {
    var ant: Ant
    
    var body: some View {
        Image(ant.toggleFrame ? "antFrame1" : "antFrame2")
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .rotationEffect(Angle(degrees: ant.rotation))
            .position(ant.position)
    }
}
struct QueenAnt: Identifiable {
    var id = UUID()
    var position: CGPoint
    var toggleFrame: Bool = false
}

struct QueenAntView: View {
    @State var queenAnt: QueenAnt
    
    var body: some View {
        Image(queenAnt.toggleFrame ? "QueenAnt1" : "QueenAnt2")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .rotationEffect(Angle(degrees: 90))
            .position(queenAnt.position)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
                    queenAnt.toggleFrame.toggle()
                }
            }
    }
}
struct AntsAnimationView: View {
    @State private var ants: [Ant] = []
    let path: [CGPoint]
    let antSpeed: CGFloat = 50.0 
    @State private var timer: Timer?
    
    var body: some View {
        ZStack {
            ForEach(ants) { ant in
                AntView(ant: ant)
            }
        }
        .onAppear {
            initializeAnts(count: 5)
            moveAnts()
        }
    }
    
    func initializeAnts(count: Int) {
        for _ in 0..<count {
            let initialPosition = path.randomElement() ?? CGPoint(x: 50, y: 50)
            ants.append(Ant(position: initialPosition))
        }
    }
    
    func moveAnts() {
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            for i in 0..<ants.count {
                let nextPosition = self.path.randomElement() ?? self.ants[i].position
                let rotation = self.calculateRotation(from: self.ants[i].position, to: nextPosition)
                
                let distance = hypot(nextPosition.x - self.ants[i].position.x, nextPosition.y - self.ants[i].position.y)
                let duration = Double(distance / self.antSpeed)
                

                self.ants[i].rotation = rotation
                withAnimation(.linear(duration: duration)) {
                    self.ants[i].position = nextPosition
                }
                
                withAnimation(Animation.linear(duration: 0.25).repeatForever(autoreverses: false)) {
                    self.ants[i].toggleFrame.toggle()
                }
            }
        }
    }
    
    private func calculateRotation(from currentPoint: CGPoint, to nextPoint: CGPoint) -> Double {
        let deltaY = nextPoint.y - currentPoint.y
        let deltaX = nextPoint.x - currentPoint.x
        let angleInRadians = atan2(deltaY, deltaX)
        let angleInDegrees = (angleInRadians * 180 / .pi - 90)
        return angleInDegrees
    }

}



struct MyColonyView: View {
    @State private var ants: [Ant] = []
    @State private var queenAnt = QueenAnt(position: CGPoint(x:650, y: 410))
    
    var body: some View {
        ZStack {
            Image("Image1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .frame(width: 570, height: 570)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    VStack {
                        Text("My Colony")
                            .font(.title)
                            .padding(.top)
                        
                        Text("Day 1")
                            .font(.headline)
                            .padding(.bottom)
                        
                        ZStack {
                            Image("Image2") 
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                                .padding(.horizontal)
                            
                            
                            AntsAnimationView(path: [
                                CGPoint(x: 69, y: -6),
                                CGPoint(x: 63, y: 114),
                                CGPoint(x: 35, y: 113),
                                CGPoint(x: 37, y: 110),
                                CGPoint(x: 29, y: -40),
                                CGPoint(x: 58, y: 17),
                                CGPoint(x: 46, y: 117),
                                CGPoint(x: 30, y: 80),
                                CGPoint(x: 37, y: 29),
                                CGPoint(x: 60, y: 7),
                                CGPoint(x: 21, y: 6),
                                CGPoint(x: 41, y: 0),
                                CGPoint(x: 21, y: -33),
                                CGPoint(x: 34, y: 113),
                                CGPoint(x: 68, y: 63),
                                CGPoint(x: 33, y: 84),
                                CGPoint(x: 60, y: 115),
                                CGPoint(x: 41, y: -18),
                                CGPoint(x: 35, y: 82),
                                CGPoint(x: 61, y: 66),
                                CGPoint(x: 49, y: 91),
                                CGPoint(x: 54, y: -2),
                                CGPoint(x: 74, y: 17),
                                CGPoint(x: 54, y: -8),
                                CGPoint(x: 51, y: 103),
                                CGPoint(x: 26, y: -3),
                                CGPoint(x: 49, y: -28),
                                CGPoint(x: 61, y: 104),
                                CGPoint(x: 49, y: -24),
                                CGPoint(x: 29, y: -17),
                                CGPoint(x: 44, y: 101),
                                CGPoint(x: 32, y: -14),
                                CGPoint(x: 47, y: 114),
                                CGPoint(x: 55, y: -20),
                                CGPoint(x: 68, y: 52),
                                CGPoint(x: 34, y: 18),
                                CGPoint(x: 42, y: -41),
                                CGPoint(x: 55, y: 16),
                                CGPoint(x: 43, y: 109),
                                CGPoint(x: 70, y: 38),
                                CGPoint(x: 57, y: -6),
                                CGPoint(x: 37, y: -46),
                                CGPoint(x: 61, y: 53),
                                CGPoint(x: 46, y: 72),
                                CGPoint(x: 60, y: 97),
                                CGPoint(x: 62, y: 22),
                                CGPoint(x: 63, y: 87),
                                CGPoint(x: 40, y: 112),
                                CGPoint(x: 34, y: 83),
                                CGPoint(x: 23, y: 43),
                                CGPoint(x: 65, y: 44),
                                CGPoint(x: 68, y: -30),
                                CGPoint(x: 58, y: -46),
                                CGPoint(x: 59, y: 111),
                                CGPoint(x: 64, y: 105),
                                CGPoint(x: 43, y: 106),
                                CGPoint(x: 50, y: 114),
                                CGPoint(x: 28, y: 113),
                                CGPoint(x: 40, y: 62),
                                CGPoint(x: 39, y: 77),
                                CGPoint(x: 60, y: 108),
                                CGPoint(x: 37, y: -7),
                                CGPoint(x: 72, y: 12),
                                CGPoint(x: 43, y: 0),
                                CGPoint(x: 66, y: 78),
                                CGPoint(x: 22, y: -23),
                                CGPoint(x: 61, y: -35),
                                CGPoint(x: 45, y: -46),
                                CGPoint(x: 54, y: 83),
                                CGPoint(x: 69, y: 43),
                                CGPoint(x: 38, y: 115),
                                CGPoint(x: 66, y: 39),
                                CGPoint(x: 48, y: 34),
                                CGPoint(x: 52, y: 38),
                                CGPoint(x: 35, y: 6),
                                CGPoint(x: 45, y: -36),
                                CGPoint(x: 54, y: 29),
                                CGPoint(x: 70, y: 111),
                                CGPoint(x: 59, y: -3),
                                CGPoint(x: 44, y: 61),
                                CGPoint(x: 23, y: 48),
                                CGPoint(x: 66, y: 34),
                                CGPoint(x: 28, y: 12),
                                CGPoint(x: 47, y: 114),
                                CGPoint(x: 64, y: -24),
                                CGPoint(x: 66, y: 48),
                                CGPoint(x: 61, y: -17),
                                CGPoint(x: 41, y: -49),
                                CGPoint(x: 74, y: -31),
                                CGPoint(x: 28, y: -11),
                                CGPoint(x: 57, y: 114),
                                CGPoint(x: 32, y: 105),
                                CGPoint(x: 32, y: 71),
                                CGPoint(x: 70, y: 102),
                                CGPoint(x: 72, y: 102),
                                CGPoint(x: 26, y: 58),
                                CGPoint(x: 63, y: 5),
                                CGPoint(x: 74, y: -4),
                                CGPoint(x: 52, y: 62),
                                CGPoint(x: 68, y: 102),
                                CGPoint(x: 67, y: -11),
                                CGPoint(x: 43, y: 106),
                                CGPoint(x: 38, y: -22),
                                CGPoint(x: 26, y: -39),
                                CGPoint(x: 32, y: -11),
                                CGPoint(x: 68, y: 115),
                                CGPoint(x: 37, y: 108),
                                CGPoint(x: 39, y: 96),
                                CGPoint(x: 63, y: -32),
                                CGPoint(x: 35, y: 43),
                                CGPoint(x: 29, y: 90),
                                CGPoint(x: 26, y: -25),
                                CGPoint(x: 35, y: 102),
                                CGPoint(x: 49, y: 27),
                                CGPoint(x: 37, y: 113),
                                CGPoint(x: 69, y: 46),
                                CGPoint(x: 36, y: 117),
                                CGPoint(x: 65, y: 36),
                                CGPoint(x: 48, y: 74),
                                CGPoint(x: 32, y: 104),
                            ])
                            .frame(width: 100, height: 100)
                            
                            
                        }
                        
                        Spacer()
                        
                        Image("Image3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                            .padding(.bottom)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct MyColonyView_Previews: PreviewProvider {
    static var previews: some View {
        MyColonyView()
            .previewDevice("iPhone 12") 
            .previewLayout(.fixed(width: 390, height: 844))
    }
}
