//
//  ViewController.swift
//  Musicopedia
//
//  Created by Swapnil on 29/07/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,MusicProtocol {
    @IBOutlet weak var musicTableView: UITableView!

    var viewModel: ViewModel?
    var player: AVPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.musicTableView.register(MusicCell.self, forCellReuseIdentifier: "cellID")
        musicTableView.register(UINib(nibName: "MusicCell", bundle: nil),
                                    forCellReuseIdentifier: "cellID")
        viewModel = ViewModel(apiManager: MusicApiManager())
        viewModel?.getMusicData()
        // Do any additional setup after loading the view.
    }

    func getResponse() {
        musicTableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! MusicCell
        if let model = self.viewModel?.musicArray[indexPath.row] as? MusicContentModel {
            cell.title.text = model.name
        }
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.musicArray.count ?? 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Here I will launch AVPlayer with url
        self.player?.pause()
        if let model = self.viewModel?.musicArray[indexPath.row] as? MusicContentModel {
            playSound(url: model.url)
        } else {
            let alert = UIAlertController(title: "Invalid Model", message: "Selected model ha invalid content", preferredStyle: .alert)
            self.present(alert, animated: true)
        }
    }
}

extension ViewController {
    
    func playSound(url: String) {
        guard let urlContent = URL(string: "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3") else { return }
        do {
            let playerItem = AVPlayerItem(url: urlContent)
            self.player = AVPlayer(playerItem:playerItem)
            player!.volume = 1.0
            player!.play()
        } catch {
            print("AVAudioPlayer init failed")
        }
    }
}

