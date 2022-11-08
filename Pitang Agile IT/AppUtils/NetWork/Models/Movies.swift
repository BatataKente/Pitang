//
//  Movies.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/08/1401 AP.
//

import Foundation

struct Movie: Codable {
    
    let _id, name, url: String?
    let __v: Int?
}


/*
[{"_id":"5d9e2b219aed8c0c42f775dd",
 "name":"Aladdin",
 "url":"https://image.tmdb.org/t/p/w300_and_h450_bestv2/cYlzLYlhUXS0kW9T3ttAQ6fvZuV.jpg",
 "__v":0},
 
 {"_id":"5d9e50204aa94d85823838f0","name":"Avatar","url":"https://media.fstatic.com/9Nj6GJcDtcgMG4FllePHuegogts=/fit-in/290x478/smart/media/movies/covers/2011/06/71fc1d0bb2bc1483e66941bb2f17d830.jpg","__v":0},{"_id":"5d9e4ebc4aa94d85823838ee","name":"Bacurau","url":"https://media.fstatic.com/yQz_oR8G5_y_OOCDHVesLVN3oyA=/fit-in/290x478/smart/media/movies/covers/2019/07/0636548.jpg-r_1920_1080-f_jpg-q_x-xxyxx.jpg","__v":0}]
*/
