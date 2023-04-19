//
//  Audio.swift
//  MyStarryCompanion
//
//  Created by Byeon jinha on 2023/04/19.
//
import AVKit

class mAudioPlayer: NSObject, ObservableObject, AVAudioPlayerDelegate {
    // 재생할 mp3 파일의 URL
    let audioURL: URL
    
    // AVAudioPlayer 인스턴스 생성
    var audioPlayer: AVAudioPlayer?
    
    // 초기화 함수
    override init() {
        self.audioURL = Bundle.main.url(forResource: "starAudio", withExtension: "mp3")!
        
        super.init()
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            guard let player = audioPlayer else { return }
            player.delegate = self
            player.prepareToPlay()
        } catch {
            print("Error initializing AVAudioPlayer: \(error.localizedDescription)")
        }
    }
    
    // 재생 함수
    func play() {
        audioPlayer?.play()
    }
    
    // 일시정지 함수
    func pause() {
        audioPlayer?.pause()
    }
    
    // AVAudioPlayerDelegate 함수
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        audioPlayer?.play()
    }
}
