//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 猿田将記 on 2020/03/23.
//  Copyright © 2020 nori.saru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var num = 0
    var timer: Timer!
    var timer_sec: Float =  0
   
    @IBOutlet weak var nextbutton: UIButton!
    @IBOutlet weak var buckbutton: UIButton!
    @IBOutlet weak var switchButtonTap: UIButton!

    @IBOutlet weak var imageView: UIImageView!

    // 画像の名前の配列
    let img01 = UIImage(named:"img_01")
    let img02 = UIImage(named:"img_2")
    let img03 = UIImage(named:"img01")
    let img = ["img_01","img_2","img01"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      imageView.image = UIImage(named: img[num])
    }
    
    @IBAction func nextbutton(_ sender: UIButton) {
    // 表示している画像の番号を1増やす
    num += 1
    // 表示している画像の番号を元に画像を表示する
    displayImage()
    }
    @IBAction func buckbutton(_ sender: UIButton) {
    // 表示している画像の番号を1減らす
    num -= 1
    // 表示している画像の番号を元に画像を表示する
    displayImage()
    }
    /// 表示している画像の番号を元に画像を表示する
    func displayImage(){
    // 範囲より下を指している場合、最後の画像を表示
    if num < 0 {
       num = 2
           }
    // 範囲より上を指している場合、最初の画像を表示
    if num > 2 {
       num = 0
           }
   imageView.image = UIImage(named: img[num])
    }
    
    // 再生・停止ボタン
    @IBAction func switchButtonTap(_ sender: Any) {
    // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
    if self.timer == nil {
    // タイマーを設定
    self.timer = Timer.scheduledTimer(timeInterval: 2.0,target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
    nextbutton.isEnabled = false
    buckbutton.isEnabled = false
        
    switchButtonTap.setTitle("停止", for: UIControl.State.normal)
    } else if self.timer != nil {
    // タイマーを停止
    self.timer.invalidate()
    // nil にして再び再生(nil の時にタイマー生成)
    self.timer = nil
    // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
    nextbutton.isEnabled = true
    buckbutton.isEnabled = true
        
    switchButtonTap.setTitle("再生", for: UIControl.State.normal)
          }
        }
    // #selectorで呼び出される関数
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec = 2.0
    // 進むボタンの内容を行う
    if num < img.count - 1 {
    // 表示している画像の番号を1増やす
    num += 1
    // 表示している画像の番号を元に画像を表示する
    displayImage()
        } else {
    num = 0
    displayImage()
        }
        imageView.image = UIImage(named: img[num])
    }

    @IBAction func pick(_ sender: Any) {
        self.performSegue(withIdentifier: "segue", sender: (Any).self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.images = imageView.image
        
    //２画面目から戻ってきた際の処理
    if self.timer != nil {
    self.timer.invalidate()
    self.timer = nil
    nextbutton.isEnabled = true
    buckbutton.isEnabled = true
    switchButtonTap.setTitle("再生", for: UIControl.State.normal)
        }
    }
        
     @IBAction func unwind(_ segue: UIStoryboardSegue) {
     }

}


