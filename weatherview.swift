import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: isNight ? [.black, .gray] : [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 10) {
                    Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Text("76")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                Spacer()
    
                HStack(spacing: 20){
                        
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 72, isNight: isNight)
                        .foregroundColor(.white)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 74, isNight: isNight)
                        .foregroundColor(.white)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind", temperature: 74, isNight: isNight)
                        .foregroundColor(.white)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "snow", temperature: 74, isNight: isNight)
                        .foregroundColor(.white)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.fill", temperature: 74, isNight: isNight)
                        .foregroundColor(.white)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    Text("Change day time")
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var isNight: Bool
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
            
            Image(systemName: isNight ? "moon.stars.fill" : imageName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 40, height: 40)
            Text("\(temperature)")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
            
        }
    }
}

