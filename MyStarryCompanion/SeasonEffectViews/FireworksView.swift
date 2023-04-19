//
//  FireworksView.swift
//  constellations
//
//  Created by Byeon jinha on 2023/04/14.
//

import SwiftUI

struct FireworksView: View {
    @State private var particles: [Particle] = []
    
    var body: some View {
        ZStack {
            ForEach(particles) { particle in
                Circle()
                    .fill(particle.color)
                    .frame(width: particle.size, height: particle.size)
                    .modifier(ParticlesModifier())
                    .offset(x: particle.xOffset, y: particle.yOffset)
            }
        }
        .onReceive(Timer.publish(every: 1.0, on: .main, in: .default).autoconnect()) { _ in
            if particles.count > 100 {
                particles.removeFirst(particles.count - 100)
            }
            particles.append(Particle())
        }
    }
}

struct Particle: Identifiable {
    var id = UUID()
    var size: CGFloat = CGFloat.random(in: 20...45)
    var xOffset: CGFloat = CGFloat.random(in: -150...150)
    var yOffset: CGFloat = CGFloat.random(in: -150...150)
    var color: Color {
        let colors: [Color] = [.red, .green, .blue, .orange, .pink, .yellow, .purple]
        return colors.randomElement() ?? .white
    }
}

struct ParticlesModifier: ViewModifier {
    @State var time = 0.0
    @State var scale = 0.1
    let duration = 5.0
    
    func body(content: Content) -> some View {
        ZStack {
            ForEach(0..<10, id: \.self) { index in
                content
                    .hueRotation(Angle(degrees: time * 80))
                    .scaleEffect(scale)
                    .modifier(FireworkParticlesGeometryEffect(time: time))
                    .opacity(((duration-time) / duration))
            }
        }
        .onAppear {
            withAnimation (.easeOut(duration: duration)) {
                self.time = duration
                self.scale = 1.0
            }
        }
        .onReceive(Timer.publish(every: 0.1, on: .main, in: .default).autoconnect()) { _ in
            withAnimation (.linear(duration:5)) {
                self.time += 0.1
            }
        }
    }
}


struct FireworkParticlesGeometryEffect : GeometryEffect {
    var time : Double
    var speed = Double.random(in: 20 ... 200)
    var direction = Double.random(in: -Double.pi ...  Double.pi)
    
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = speed * cos(direction) * time
        let yTranslation = speed * sin(direction) * time
        let affineTranslation =  CGAffineTransform(translationX: xTranslation, y: yTranslation)
        return ProjectionTransform(affineTranslation)
    }
}
