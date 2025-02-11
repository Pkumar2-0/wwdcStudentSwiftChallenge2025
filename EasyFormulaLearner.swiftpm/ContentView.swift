import SwiftUI
import AVFoundation

// Function to calculate factorial
func factorial(_ n: Int) -> Double {
    return (n == 0) ? 1 : Double(n) * factorial(n - 1)
}

// Taylor Theorem Function
func taylorTheoremApproximation(f: (Double) -> Double, df: [(Double) -> Double], x: Double, a: Double, terms: Int) -> [(Double, Double)] {
    var approximations: [(Double, Double)] = []
    var sum: Double = 0
    
    for n in 0..<terms {
//        let term = (df[n](a) / factorial(n)) * pow(x - a, Double(n))
//        sum += term
//        approximations.append((term, sum))
    }
    return approximations
}



struct LandingPageView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("📚 Taylor's Theorem Game")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                    .padding()
                    .shadow(radius: 5)
                
                Image(systemName: "function")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding()
                    
                Text("Learn how Taylor's Theorem approximates functions step by step with interactive challenges!")
                    .multilineTextAlignment(.center)
                    .padding()
                
                NavigationLink(destination: ContentView()) {
                    Text("🎮 Start Learning!")
                        .font(.title2)
                        .bold()
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                }
            }
            .padding()
        }
    }
}

struct ContentView: View {
    @State private var inputX: String = "1.0"
    @State private var a: String = "0.0"
    @State private var terms: Int = 5
    @State private var results: [(Double, Double)] = []
    @State private var navigate = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("🎮 Taylor's Theorem Mission")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
                .padding()
            
            Text("Mission: Approximate f(x) using Taylor's Theorem!")
                .font(.headline)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
            TextField("Enter x value", text: $inputX)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.decimalPad)
            
            TextField("Enter a (expansion point)", text: $a)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.decimalPad)
            
            Stepper("Number of Terms: \(terms)", value: $terms, in: 1...10)
                .padding()
            
            NavigationLink(destination: StepDetailView(results: results), isActive: $navigate) {
                Button("Start Mission") {
                    if let xValue = Double(inputX), let aValue = Double(a) {
                        let function: (Double) -> Double = { x in exp(x) }
                        let derivatives: [(Double) -> Double] = [{ _ in exp(aValue) }, { _ in exp(aValue) }, { _ in exp(aValue) }, { _ in exp(aValue) }]
                        results = taylorTheoremApproximation(f: function, df: derivatives, x: xValue, a: aValue, terms: terms)
                        navigate = true
                    }
                }
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.teal]), startPoint: .leading, endPoint: .trailing))
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(radius: 5)
            }
        }
        .padding()
    }
}

struct StepDetailView: View {
    let results: [(Double, Double)]
    @State private var currentIndex = 0
    @State private var showAchievement = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step \(currentIndex + 1): Compute This!")
                .font(.title)
                .bold()
                .foregroundColor(.blue)
                .padding()
                
            VStack {
                Text("Find the next term in Taylor's Theorem:")
                Text("f(a) + f'(a)(x-a) + f''(a)(x-a)^2/2! + ...")
                    .font(.title2)
                    .bold()
                    .padding()
            }
            .padding()
            .background(Color.yellow.opacity(0.3))
            .cornerRadius(10)
            
//            DragTargetView(correctValue: results[currentIndex].0) {
//                if currentIndex < results.count - 1 {
//                    currentIndex += 1
//                    if currentIndex % 2 == 0 {
//                        showAchievement = true
//
//                    }
//                }
//            }
            
            if showAchievement {
                Text("🏆 Achievement Unlocked: Great Job! 🏆")
                    .font(.headline)
                    .foregroundColor(.orange)
                    .padding()
                    .transition(.opacity)
            }
        }
        .padding()
    }
}

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading, spacing: 20) {
//                // Title
//                Text("Taylor’s Theorem")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding(.top)
//
//                // Description Section
//                Text("Description")
//                    .font(.headline)
//                Text("Taylor’s Theorem approximates a smooth function near a point by a polynomial whose coefficients are derived from the function’s derivatives at that point. It is a cornerstone of calculus and helps in understanding function behavior and error estimation.")
//                    .font(.body)
//                    .lineLimit(nil)
//                
//                // Formula Section
//                Text("Formula")
//                    .font(.headline)
//                Text("""
//f(x) = f(a) + f'(a)(x-a) + f''(a)/2!(x-a)^2 + ... + f⁽ⁿ⁾(a)/n!(x-a)ⁿ + Rₙ
//""")
//                    .font(.system(.body, design: .monospaced))
//                    .padding(.vertical, 5)
//                
//                // Application Section
//                Text("Application")
//                    .font(.headline)
//                Text("Taylor’s theorem is used to approximate complex functions with simpler polynomial forms, which is very useful in numerical analysis, physics, and engineering to estimate values and bound errors.")
//                    .font(.body)
//                    .lineLimit(nil)
//                
//                Spacer()
//                
//                // Navigation Button
//                NavigationLink(destination: TryView()) {
//                    Text("Let's Try")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//            }
//            .padding()
//            .navigationBarTitle("Taylor's Theorem", displayMode: .inline)
//        }
//    }
//}
//
//struct TryView: View {
//    var body: some View {
//        VStack {
//            Text("Interactive Taylor’s Theorem")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .padding(.top)
//            
//            Text("Here you can add interactive components such as sliders to adjust parameters, graphs to visualize the polynomial approximation, or other experiments to see the theorem in action.")
//                .font(.body)
//                .padding()
//            
//            Spacer()
//        }
//        .padding()
//        .navigationBarTitle("Try It Out", displayMode: .inline)
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
