//
//  NumberConnectedComponentsUndirectedGraphTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 30/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class NumberConnectedComponentsUndirectedGraphTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let n = 5
        let edges = [[0, 1],
                     [1, 2],
                     [3, 4]]
        
        let count = NumberConnectedComponentsUndirectedGraph.countComponents(n, edges)
        
        XCTAssertEqual(count, 2)
    }
    
    func test_B() {
        let n = 5
        let edges = [[0, 1],
                     [1, 2],
                     [2, 3],
                     [3, 4]]
        
        let count = NumberConnectedComponentsUndirectedGraph.countComponents(n, edges)
        
        XCTAssertEqual(count, 1)
    }
    
    func test_C() {
        let n = 4
        let edges = [[2, 3],
                     [1, 2],
                     [1, 3]]
        
        let count = NumberConnectedComponentsUndirectedGraph.countComponents(n, edges)
        
        XCTAssertEqual(count, 2)
    }
    
    func test_D() {
        let n = 500
        let edges = [[481, 475],
                     [196, 63],
                     [438, 33],
                     [212, 328],
                     [268, 20],
                     [226, 288],
                     [436, 487],
                     [199, 494],
                     [421, 279],
                     [369, 14],
                     [92, 91],
                     [183, 174],
                     [271, 15],
                     [4, 435],
                     [435, 47],
                     [217, 460],
                     [216, 319],
                     [468, 125],
                     [115, 1],
                     [435, 383],
                     [192, 136],
                     [86, 103],
                     [336, 342],
                     [5, 301],
                     [255, 253],
                     [185, 37],
                     [323, 168],
                     [417, 241],
                     [151, 208],
                     [347, 53],
                     [180, 329],
                     [198, 452],
                     [31, 419],
                     [406, 74],
                     [324, 105],
                     [164, 494],
                     [281, 316],
                     [139, 318],
                     [269, 214],
                     [21, 269],
                     [271, 234],
                     [142, 50],
                     [304, 375],
                     [285, 438],
                     [120, 251],
                     [275, 423],
                     [447, 91],
                     [420, 443],
                     [163, 476],
                     [436, 423],
                     [76, 487],
                     [3, 443],
                     [262, 309],
                     [398, 194],
                     [26, 468],
                     [413, 241],
                     [187, 472],
                     [279, 58],
                     [29, 48],
                     [173, 250],
                     [423, 499],
                     [456, 242],
                     [34, 102],
                     [42, 376],
                     [286, 159],
                     [147, 55],
                     [208, 449],
                     [352, 86],
                     [147, 228],
                     [111, 306],
                     [108, 238],
                     [297, 290],
                     [199, 472],
                     [263, 451],
                     [383, 116],
                     [441, 465],
                     [490, 396],
                     [39, 342],
                     [16, 441],
                     [175, 405],
                     [139, 70],
                     [377, 370],
                     [244, 276],
                     [379, 188],
                     [175, 188],
                     [3, 165],
                     [291, 485],
                     [162, 293],
                     [336, 140],
                     [236, 61],
                     [297, 424],
                     [413, 403],
                     [75, 161],
                     [148, 232],
                     [9, 313],
                     [260, 186],
                     [390, 116],
                     [282, 350],
                     [239, 357],
                     [33, 285],
                     [231, 24],
                     [342, 82],
                     [58, 210],
                     [423, 356],
                     [85, 97],
                     [197, 346],
                     [157, 467],
                     [210, 364],
                     [276, 283],
                     [170, 54],
                     [113, 332],
                     [48, 270],
                     [43, 166],
                     [416, 42],
                     [261, 341],
                     [373, 76],
                     [32, 128],
                     [382, 302],
                     [89, 376],
                     [414, 363],
                     [346, 474],
                     [245, 460],
                     [62, 440],
                     [138, 458],
                     [427, 419],
                     [412, 128],
                     [400, 308],
                     [229, 286],
                     [134, 153],
                     [332, 488],
                     [67, 343],
                     [401, 202],
                     [130, 370],
                     [345, 242],
                     [211, 169],
                     [128, 346],
                     [372, 128],
                     [405, 139],
                     [181, 344],
                     [65, 52],
                     [257, 40],
                     [355, 133],
                     [188, 416],
                     [128, 362],
                     [30, 365],
                     [329, 88],
                     [261, 32],
                     [197, 171],
                     [387, 463],
                     [316, 360],
                     [364, 250],
                     [167, 129],
                     [25, 318],
                     [429, 87],
                     [274, 272],
                     [426, 92],
                     [24, 127],
                     [123, 245],
                     [238, 164],
                     [124, 275],
                     [98, 48],
                     [275, 414],
                     [217, 409],
                     [80, 326],
                     [486, 180],
                     [223, 182],
                     [344, 236],
                     [147, 153],
                     [20, 63],
                     [177, 51],
                     [430, 57],
                     [447, 108],
                     [339, 265],
                     [455, 6],
                     [249, 300],
                     [367, 279],
                     [368, 309],
                     [460, 175],
                     [453, 366],
                     [352, 129],
                     [433, 127],
                     [319, 78],
                     [369, 114],
                     [156, 400],
                     [80, 146],
                     [190, 194],
                     [148, 9],
                     [230, 107],
                     [236, 449],
                     [417, 287],
                     [486, 63],
                     [92, 301],
                     [77, 332],
                     [101, 111],
                     [33, 373],
                     [189, 265],
                     [458, 209],
                     [318, 219],
                     [179, 451],
                     [30, 259],
                     [7, 252],
                     [45, 403],
                     [18, 261],
                     [7, 413],
                     [387, 211],
                     [230, 80],
                     [194, 26],
                     [61, 200],
                     [336, 483],
                     [385, 410],
                     [196, 260],
                     [487, 16],
                     [193, 494],
                     [490, 410],
                     [217, 499],
                     [387, 119],
                     [30, 174],
                     [47, 165],
                     [409, 352],
                     [420, 189],
                     [294, 242],
                     [332, 335],
                     [341, 13],
                     [6, 121],
                     [479, 282],
                     [491, 373],
                     [60, 269],
                     [476, 29],
                     [239, 59],
                     [365, 408],
                     [361, 205],
                     [427, 329],
                     [185, 30],
                     [339, 424],
                     [6, 190],
                     [50, 274],
                     [483, 98],
                     [304, 233],
                     [214, 294],
                     [230, 29],
                     [441, 401],
                     [46, 217],
                     [339, 446],
                     [54, 183],
                     [427, 378],
                     [9, 319],
                     [446, 337],
                     [120, 219],
                     [280, 371],
                     [390, 495],
                     [44, 378],
                     [108, 95],
                     [209, 126],
                     [234, 156],
                     [206, 367],
                     [178, 273],
                     [237, 49],
                     [374, 155],
                     [201, 176],
                     [208, 122],
                     [178, 131],
                     [12, 432],
                     [152, 461],
                     [309, 386],
                     [79, 114],
                     [337, 271],
                     [226, 200],
                     [177, 117],
                     [259, 41],
                     [427, 423],
                     [75, 449],
                     [430, 427],
                     [256, 320],
                     [497, 309],
                     [87, 324],
                     [383, 311],
                     [233, 464],
                     [97, 161],
                     [484, 38],
                     [397, 200],
                     [312, 258],
                     [252, 207],
                     [478, 169],
                     [207, 441],
                     [210, 28],
                     [179, 305],
                     [250, 85],
                     [181, 491],
                     [250, 426],
                     [441, 43],
                     [484, 115],
                     [274, 316],
                     [432, 55],
                     [424, 21],
                     [361, 252],
                     [432, 95],
                     [423, 174],
                     [95, 316],
                     [65, 15],
                     [87, 305],
                     [255, 109],
                     [151, 282],
                     [391, 85],
                     [63, 114],
                     [411, 279],
                     [42, 238],
                     [160, 461],
                     [77, 115],
                     [211, 287],
                     [433, 427],
                     [230, 179],
                     [146, 183],
                     [255, 128],
                     [125, 165],
                     [126, 383],
                     [483, 490],
                     [22, 481],
                     [90, 232],
                     [435, 389],
                     [387, 246],
                     [53, 329],
                     [131, 7],
                     [3, 483],
                     [281, 191],
                     [335, 401],
                     [464, 482],
                     [277, 289],
                     [418, 489],
                     [289, 210],
                     [83, 199],
                     [54, 131],
                     [439, 206],
                     [462, 182],
                     [107, 147],
                     [36, 236],
                     [72, 267],
                     [59, 471],
                     [86, 91],
                     [35, 150],
                     [331, 420],
                     [414, 151],
                     [467, 266],
                     [440, 141],
                     [410, 349],
                     [347, 179],
                     [475, 241],
                     [477, 108],
                     [138, 237],
                     [172, 68],
                     [69, 97],
                     [266, 40],
                     [43, 466],
                     [118, 406],
                     [238, 303],
                     [92, 216],
                     [157, 13],
                     [127, 337],
                     [159, 162],
                     [343, 344],
                     [153, 311],
                     [114, 255],
                     [22, 203],
                     [236, 46],
                     [360, 235],
                     [57, 358],
                     [311, 73],
                     [450, 444],
                     [134, 283],
                     [444, 60],
                     [55, 248],
                     [372, 343],
                     [193, 286],
                     [20, 458],
                     [78, 390],
                     [360, 477],
                     [355, 164],
                     [465, 212],
                     [191, 15],
                     [374, 241],
                     [75, 118],
                     [115, 374],
                     [359, 361],
                     [153, 479],
                     [83, 53],
                     [377, 406],
                     [21, 304],
                     [348, 176],
                     [408, 52],
                     [366, 25],
                     [375, 80],
                     [104, 98],
                     [84, 428],
                     [251, 423],
                     [437, 29],
                     [197, 258],
                     [213, 488],
                     [386, 114],
                     [204, 375],
                     [148, 367],
                     [129, 363],
                     [419, 369],
                     [176, 113],
                     [359, 175],
                     [160, 303],
                     [341, 224],
                     [352, 41],
                     [414, 6],
                     [135, 214],
                     [369, 240],
                     [48, 361],
                     [88, 427],
                     [311, 305],
                     [441, 147],
                     [333, 148],
                     [494, 73],
                     [6, 82],
                     [49, 280],
                     [423, 471],
                     [262, 362],
                     [222, 316],
                     [199, 414],
                     [370, 84],
                     [122, 403],
                     [9, 315],
                     [323, 266],
                     [270, 338],
                     [460, 72],
                     [171, 335],
                     [28, 342],
                     [198, 402],
                     [367, 9],
                     [22, 307],
                     [13, 34],
                     [363, 446],
                     [297, 404],
                     [73, 60],
                     [95, 53],
                     [252, 166],
                     [216, 414],
                     [384, 270],
                     [464, 50],
                     [0, 185],
                     [478, 19],
                     [172, 457],
                     [2, 479],
                     [290, 409],
                     [138, 369],
                     [262, 175],
                     [93, 368],
                     [326, 59],
                     [13, 125],
                     [360, 260],
                     [333, 110],
                     [21, 95],
                     [323, 134],
                     [65, 432],
                     [33, 411],
                     [490, 252],
                     [389, 169],
                     [2, 45],
                     [18, 248],
                     [374, 452],
                     [457, 56],
                     [212, 33],
                     [428, 485],
                     [229, 323],
                     [36, 235],
                     [324, 276],
                     [41, 382],
                     [451, 400],
                     [390, 473],
                     [487, 33],
                     [64, 414],
                     [271, 461],
                     [149, 384],
                     [360, 31],
                     [393, 119],
                     [294, 235],
                     [447, 204],
                     [450, 499],
                     [308, 345],
                     [44, 295],
                     [111, 491],
                     [125, 49],
                     [293, 473],
                     [182, 3],
                     [324, 358],
                     [302, 455],
                     [274, 188],
                     [297, 387],
                     [12, 278],
                     [348, 86],
                     [425, 5],
                     [163, 463],
                     [219, 354],
                     [481, 380],
                     [1, 31],
                     [43, 80],
                     [339, 159],
                     [452, 303],
                     [367, 182],
                     [162, 456],
                     [420, 99],
                     [164, 354],
                     [214, 84],
                     [445, 272],
                     [16, 14],
                     [90, 236],
                     [483, 180],
                     [187, 474],
                     [312, 53],
                     [478, 22],
                     [185, 376],
                     [342, 132],
                     [219, 35],
                     [460, 92],
                     [151, 350],
                     [146, 459],
                     [469, 287],
                     [332, 361],
                     [179, 145],
                     [90, 438],
                     [11, 417],
                     [361, 329],
                     [173, 423],
                     [376, 341],
                     [456, 327],
                     [74, 261],
                     [261, 402],
                     [446, 418],
                     [62, 339],
                     [333, 462],
                     [92, 32],
                     [419, 451],
                     [269, 452],
                     [86, 247],
                     [441, 6],
                     [178, 219],
                     [175, 122],
                     [474, 176],
                     [336, 10],
                     [400, 483],
                     [185, 334],
                     [343, 175],
                     [207, 261],
                     [77, 157],
                     [236, 325],
                     [416, 234],
                     [304, 359],
                     [136, 165],
                     [411, 129],
                     [272, 230],
                     [482, 416],
                     [51, 245],
                     [105, 80],
                     [243, 50],
                     [76, 390],
                     [420, 261],
                     [261, 433],
                     [218, 448],
                     [308, 469],
                     [272, 52],
                     [37, 384],
                     [7, 70],
                     [292, 195],
                     [312, 57],
                     [311, 142],
                     [97, 431],
                     [386, 294],
                     [316, 320],
                     [465, 42],
                     [440, 433],
                     [91, 134],
                     [179, 302],
                     [365, 115],
                     [247, 67],
                     [139, 149],
                     [230, 232],
                     [384, 1],
                     [330, 450],
                     [41, 144],
                     [191, 192],
                     [54, 271],
                     [6, 456],
                     [481, 443],
                     [66, 219],
                     [346, 301],
                     [168, 226],
                     [269, 353],
                     [312, 318],
                     [104, 467],
                     [198, 399],
                     [377, 398],
                     [226, 197],
                     [440, 164],
                     [146, 177],
                     [292, 494],
                     [494, 360],
                     [64, 464],
                     [314, 349],
                     [254, 25],
                     [100, 293],
                     [20, 274],
                     [486, 444],
                     [17, 173],
                     [143, 404],
                     [338, 203],
                     [179, 126],
                     [135, 84],
                     [389, 398],
                     [404, 480],
                     [173, 228],
                     [245, 466],
                     [98, 194],
                     [37, 116],
                     [328, 111],
                     [150, 218],
                     [31, 237],
                     [488, 225],
                     [151, 397],
                     [40, 269],
                     [242, 136],
                     [420, 469],
                     [378, 61],
                     [34, 157],
                     [268, 485],
                     [175, 442],
                     [460, 437],
                     [119, 237],
                     [410, 174],
                     [348, 446],
                     [334, 282],
                     [363, 73],
                     [205, 185],
                     [66, 218],
                     [97, 159],
                     [407, 363],
                     [288, 269],
                     [348, 105],
                     [315, 272],
                     [280, 492],
                     [175, 483],
                     [194, 316],
                     [33, 81],
                     [47, 402],
                     [480, 248],
                     [444, 74],
                     [127, 373],
                     [142, 309],
                     [114, 336],
                     [384, 213],
                     [14, 102],
                     [228, 83],
                     [425, 113],
                     [427, 42],
                     [228, 286],
                     [333, 205],
                     [238, 371],
                     [3, 334],
                     [415, 298],
                     [396, 482],
                     [16, 311],
                     [77, 269],
                     [295, 269],
                     [432, 322],
                     [200, 353],
                     [360, 388],
                     [17, 266],
                     [370, 350],
                     [316, 120],
                     [146, 186],
                     [378, 363],
                     [186, 224],
                     [45, 196],
                     [401, 434],
                     [92, 296],
                     [82, 120],
                     [90, 216],
                     [263, 352],
                     [479, 66],
                     [13, 185],
                     [313, 275],
                     [437, 469],
                     [391, 59],
                     [214, 74],
                     [72, 372],
                     [383, 27],
                     [258, 235],
                     [486, 460],
                     [137, 78],
                     [285, 89],
                     [293, 238],
                     [117, 411],
                     [91, 51],
                     [137, 318],
                     [409, 345],
                     [10, 224],
                     [407, 274],
                     [161, 440],
                     [351, 100]]
        
        let count = NumberConnectedComponentsUndirectedGraph.countComponents(n, edges)
        
        XCTAssertEqual(count, 35)
    }
}
