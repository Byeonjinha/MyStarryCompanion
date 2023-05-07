# MyStarryCompanionApp (퀴즈를 통해 별자리를 학습할 수 있는 앱)

------------------------
<img src="https://user-images.githubusercontent.com/87685946/233023159-3f8e70aa-8c7b-45f2-be0c-525086ea2f4c.png" width="100%" height="100%"/>

## 📽️시연 영상(Youtube)

------------------------
<p align="center">
  <a href="https://www.youtube.com/watch?v=9WZQ4pwnIjo">
    <img src="https://img.youtube.com/vi/9WZQ4pwnIjo/0.jpg" alt="유튜브 동영상">
  </a>
</p>


## 🔗App Store : [MyStarryCompnaion](https://apps.apple.com/app/mystarrycompanion/id6448020400)

------------------------
## ✨ Skills & Tech Stack
SwiftUI

## 🛠 Development Environment
------------------------
iOS: 15.0+,  Xcode: 14.1

## 기술적 도전
------------------------
 UIBezierPath를 활용해 커스텀 뷰 사용

 <img src="https://user-images.githubusercontent.com/87685946/236684371-1a671543-cb5c-4d84-bb8e-e544ed4761ab.png" width="30%" height="30%"/>

```Swift
 import SwiftUI

struct CustomShapeView: View {
    var locationX: Double
    var locationY: Double
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                
                let radius = min(width, height) / 2.0
                let center = CGPoint(x: width / locationX, y: height / locationY)
                let holeRadius = radius * 0.2
                
                path.addRect(CGRect(x: 0, y: 0, width: width, height: height))
                let holeRect = CGRect(x: center.x - holeRadius, y: center.y - holeRadius, width: holeRadius * 2, height: holeRadius * 2)
                let holePath = UIBezierPath(ovalIn: holeRect)
                let holeCGPath = holePath.cgPath
                path.addPath(Path(holeCGPath))
            }
            .fill(style: .init(eoFill: true, antialiased: true))
            .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.7))
        }
    }
}
```

GeometryReader, ScaleEffect를 활용해 다이나믹한 애니메이션 구현

 <img src="https://user-images.githubusercontent.com/87685946/236684434-8ff7cf0b-f903-4222-8a0a-46c0fa9a5e69.gif" width="30%" height="30%"/>

```Swift
Image("constellations")
    .resizable()
    .foregroundColor(.accentColor)
    .scaleEffect(vm.scale)
    .ignoresSafeArea()
    .animation(.easeInOut, value: 0.5)
    .offset(x: vm.xOffset, y: vm.yOffset)

```
## License
------------------------
[MIT](https://choosealicense.com/licenses/mit/)
