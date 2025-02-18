
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // Title
                Text("Taylor’s Theorem")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                // Description Section
                Text("Description")
                    .font(.headline)
                Text("Taylor’s Theorem approximates a smooth function near a point by a polynomial whose coefficients are derived from the function’s derivatives at that point. It is a cornerstone of calculus and helps in understanding function behavior and error estimation.")
                    .font(.body)
                    .lineLimit(nil)

                // Formula Section
                Text("Formula")
                    .font(.headline)
                Text("""
f(x) = f(a) + f'(a)(x-a) + f''(a)/2!(x-a)^2 + ... + f⁽ⁿ⁾(a)/n!(x-a)ⁿ + Rₙ
""")
                    .font(.system(.body, design: .monospaced))
                    .padding(.vertical, 5)

                // Application Section
                Text("Application")
                    .font(.headline)
                Text("Taylor’s theorem is used to approximate complex functions with simpler polynomial forms, which is very useful in numerical analysis, physics, and engineering to estimate values and bound errors.")
                    .font(.body)
                    .lineLimit(nil)

                Spacer()

                // Navigation Button
                NavigationLink(destination: TryView()) {
                    Text("Let's Try")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationBarTitle("Taylor's Theorem", displayMode: .inline)
        }
    }
}

struct TryView: View {
    var body: some View {
        VStack {
            Text("Interactive Taylor’s Theorem")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)

            Text("Here you can add interactive components such as sliders to adjust parameters, graphs to visualize the polynomial approximation, or other experiments to see the theorem in action.")
                .font(.body)
                .padding()

            Spacer()
        }
        .padding()
        .navigationBarTitle("Try It Out", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
