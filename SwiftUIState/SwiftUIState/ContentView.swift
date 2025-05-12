import SwiftUI
import SwiftData
struct ContentView: View {
    
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var bmi: Double?
    @State private var showResult = false
    @State private var showAlert = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.3), .white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("BMI 計算器")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)

                if !showResult {
                    VStack(alignment: .leading, spacing: 16) {
                        TextField("請輸入身高 (cm)", text: $height)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)

                        TextField("請輸入體重 (kg)", text: $weight)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.decimalPad)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .padding(.horizontal)

                    Button(action: {
                        if let h = Double(height), let w = Double(weight), h > 0 {
                            bmi = w / (h/100.0 * h/100.0)
                            showResult = true
                        } else {
                            showAlert = true
                        }
                    }) {
                        Text("計算 BMI")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                } else {
                    if let result = bmi {
                        Text(String(format: "你的 BMI 是：%.2f", result))
                            .font(.title)
                            .foregroundColor(.green)
                            .padding()
                    }

                    Button("回到上一頁") {
                        showResult = false
                        height = ""
                        weight = ""
                        bmi = nil
                    }
                    .font(.headline)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                }

                Spacer()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("輸入錯誤"), message: Text("請正確輸入數值格式"), dismissButton: .default(Text("好")))
            }
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
