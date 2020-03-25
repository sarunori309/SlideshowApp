//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 猿田将記 on 2020/03/23.
//  Copyright © 2020 nori.saru. All rights reserved
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var images: UIImage!

    // 画像の名前の配列
    let img01 = UIImage(named:"img_01")
    let img02 = UIImage(named:"img_2")
    let img03 = UIImage(named:"img01")
   
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = images
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
