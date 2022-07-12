![Swift](https://img.shields.io/badge/Swift-5.0-brightgreen)
![Swift](https://img.shields.io/badge/iOS-13.0-brightgreen)
![Swift](https://img.shields.io/badge/SwiftUI-2.0-brightgreen)

# SwiftUI - ShimmerEffect
<br />
<p align="center">
  <a>
    <img src="/Screenshot/ExampleScreen.gif" alt="action" width="300">
    <img src="/Screenshot/ImplementationScreen.gif" alt="action" width="300">
  </a>
</p>


Usage
```swift
struct ExampleView: View {
    @State private var isRedacted = true

    var body: some View {
        ScrollView {
            DummyRowView()
                // Passing the boolean value indicate whether should it be redacted or not. 
                .redacted(if: isRedacted)
            Button {
                isRedacted.toggle()
            } label: {
                Text("Toggle redacted...")
            }

        }
    }
}
 ```

## Acknowledgements
This project was inspired by following project and website

- [Five Stars - Conditional view modifiers](https://www.fivestars.blog/articles/conditional-modifiers/) 
- [Markiv - SwiftUI-Shimmer](https://github.com/markiv/SwiftUI-Shimmer)

