//
//  LarrysArrayTests.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 12/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import XCTest

class LarrysArrayTests: XCTestCase {
    
    // MARK: Tests
    
    func test_larrysArrayA() {
        
        let canBeSorted = LarrysArray.canRobotSort([3, 1, 2])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayB() {
        
        let canBeSorted = LarrysArray.canRobotSort([1, 3, 4, 2])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayC() {
        
        let canBeSorted = LarrysArray.canRobotSort([1, 2, 3, 5, 4])
        
        XCTAssertFalse(canBeSorted)
    }
    
    func test_larrysArrayD() {
        
        let canBeSorted = LarrysArray.canRobotSort([1, 3, 4, 2])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayE() {
        
        let canBeSorted = LarrysArray.canRobotSort([1, 2, 3, 5, 4])
        
        XCTAssertFalse(canBeSorted)
    }
    
    func test_larrysArrayF() {
        
        let canBeSorted = LarrysArray.canRobotSort([4, 1, 3, 2])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayG() {
        
        let canBeSorted = LarrysArray.canRobotSort([9, 6, 8, 12, 3, 7, 1, 11, 10, 2, 5, 4])
        
        XCTAssertFalse(canBeSorted)
    }
    
    func test_larrysArrayH() {
        
        let canBeSorted = LarrysArray.canRobotSort([17, 21, 2, 1, 16, 9, 12, 11, 6, 18, 20, 7, 14, 8, 19, 10, 3, 4, 13, 5, 15])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayI() {
        
        let canBeSorted = LarrysArray.canRobotSort([5, 8, 13, 3, 10, 4, 12, 1, 2, 7, 14, 6, 15, 11, 9])
        
        XCTAssertFalse(canBeSorted)
    }
    
    func test_larrysArrayJ() {
        
        let canBeSorted = LarrysArray.canRobotSort([8, 10, 6, 11, 7, 1, 9, 12, 3, 5, 13, 4, 2])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayK() {
        
        let canBeSorted = LarrysArray.canRobotSort([7, 9, 15, 8, 10, 16, 6, 14, 5, 13, 17, 12, 3, 11, 4, 1, 18, 2])
        
        XCTAssertFalse(canBeSorted)
    }
    
    func test_larrysArrayL() {
        
        let canBeSorted = LarrysArray.canRobotSort([176, 591, 437, 249, 448, 600, 73, 152, 12, 731, 736, 593, 202, 824, 223, 844, 195, 235, 416, 194, 115, 777, 182, 753, 87, 236, 279, 680, 229, 880, 33, 789, 849, 170, 368, 62, 719, 492, 854, 25, 69, 146, 517, 749, 188, 807, 727, 639, 760, 288, 674, 628, 199, 744, 163, 904, 852, 151, 270, 618, 35, 415, 81, 316, 671, 861, 763, 627, 208, 232, 145, 869, 892, 662, 574, 380, 419, 602, 336, 595, 538, 305, 832, 159, 294, 449, 531, 328, 588, 771, 98, 694, 243, 840, 95, 179, 522, 259, 218, 781, 590, 814, 287, 457, 330, 307, 310, 649, 604, 1, 830, 501, 394, 537, 134, 507, 795, 740, 423, 428, 50, 488, 774, 155, 579, 689, 120, 125, 15, 553, 291, 84, 473, 528, 544, 788, 714, 539, 38, 230, 770, 113, 196, 168, 599, 816, 800, 859, 381, 51, 630, 490, 453, 725, 22, 728, 596, 851, 273, 784, 17, 127, 118, 233, 683, 172, 650, 443, 625, 144, 244, 5, 699, 454, 616, 242, 23, 371, 580, 541, 738, 623, 129, 57, 413, 214, 886, 340, 147, 245, 729, 32, 479, 660, 601, 364, 701, 636, 661, 264, 703, 474, 112, 225, 55, 894, 612, 901, 404, 206, 391, 126, 698, 853, 565, 645, 71, 444, 400, 815, 494, 512, 793, 803, 566, 7, 556, 659, 24, 89, 427, 9, 275, 768, 887, 96, 564, 720, 361, 295, 397, 351, 212, 568, 605, 508, 20, 124, 37, 13, 581, 321, 550, 543, 111, 385, 183, 776, 354, 439, 808, 864, 520, 411, 292, 174, 76, 447, 746, 762, 518, 663, 139, 332, 70, 171, 425, 691, 231, 575, 465, 498, 186, 160, 620, 282, 338, 378, 500, 629, 547, 524, 343, 396, 471, 847, 505, 621, 452, 207, 388, 372, 36, 356, 536, 142, 516, 324, 804, 870, 896, 334, 767, 75, 743, 433, 133, 560, 757, 135, 11, 810, 280, 106, 30, 540, 751, 190, 855, 101, 387, 511, 535, 422, 455, 123, 399, 745, 609, 631, 220, 756, 184, 290, 450, 670, 86, 41, 710, 210, 654, 285, 92, 842, 198, 464, 97, 640, 692, 339, 772, 546, 458, 678, 778, 154, 837, 759, 606, 633, 185, 845, 687, 485, 376, 554, 187, 523, 283, 477, 718, 254, 293, 215, 587, 841, 790, 29, 577, 737, 748, 724, 549, 764, 414, 497, 369, 786, 357, 879, 615, 480, 569, 877, 667, 335, 78, 289, 669, 561, 666, 345, 406, 489, 576, 103, 646, 219, 52, 503, 891, 475, 597, 706, 883, 284, 712, 240, 132, 105, 468, 442, 750, 68, 271, 90, 119, 532, 18, 677, 495, 363, 765, 341, 707, 130, 65, 506, 482, 417, 708, 874, 551, 647, 558, 527, 519, 460, 274, 200, 141, 486, 373, 865, 409, 367, 834, 228, 3, 227, 268, 695, 392, 440, 59, 313, 817, 358, 829, 267, 42, 502, 723, 709, 585, 201, 6, 157, 675, 866, 19, 826, 420, 868, 169, 167, 875, 572, 412, 836, 209, 43, 696, 180, 515, 121, 573, 542, 61, 304, 780, 899, 711, 676, 386, 672, 811, 613, 296, 445, 122, 461, 40, 272, 611, 148, 872, 54, 165, 491, 325, 429, 333, 156, 298, 681, 299, 469, 181, 150, 64, 234, 239, 197, 697, 583, 403, 638, 690, 779, 27, 470, 365, 91, 347, 456, 331, 418, 405, 306, 350, 426, 526, 375, 26, 773, 730, 833, 430, 143, 656, 805, 726, 648, 441, 557, 66, 393, 192, 504, 782, 734, 735, 466, 775, 651, 797, 641, 342, 104, 269, 362, 850, 366, 94, 398, 224, 352, 382, 822, 34, 493, 360, 166, 158, 827, 682, 384, 337, 873, 665, 262, 173, 211, 792, 684, 499, 513, 761, 348, 137, 881, 472, 438, 571, 668, 451, 390, 221, 47, 10, 49, 48, 407, 309, 4, 893, 716, 563, 318, 276, 431, 806, 446, 809, 253, 161, 552, 424, 766, 619, 102, 509, 377, 82, 110, 769, 878, 755, 484, 610, 742, 410, 514, 831, 175, 263, 93, 109, 297, 686, 481, 758, 303, 383, 617, 819, 589, 395, 319, 642, 247, 312, 241, 624, 496, 634, 848, 732, 867, 510, 713, 643, 791, 107, 754, 322, 248, 828, 902, 301, 603, 326, 559, 31, 747, 432, 355, 860, 260, 46, 389, 578, 562, 88, 2, 370, 799, 717, 153, 478, 721, 705, 226, 884, 685, 108, 300, 203, 614, 177, 261, 702, 846, 785, 700, 191, 839, 657, 353, 21, 136, 359, 533, 487, 900, 44, 715, 722, 794, 116, 897, 58, 802, 525, 379, 317, 632, 462, 60, 63, 80, 796, 246, 626, 658, 67, 99, 801, 863, 434, 733, 820, 752, 189, 871, 592, 856, 320, 607, 787, 314, 53, 344, 128, 72, 798, 582, 838, 664, 823, 256, 408, 222, 637, 435, 882, 903, 679, 85, 653, 39, 237, 857, 100, 277, 876, 329, 898, 586, 467, 635, 257, 265, 205, 895, 302, 644, 117, 555, 250, 459, 114, 77, 162, 655, 255, 835, 308, 821, 402, 83, 131, 584, 315, 739, 213, 570, 278, 463, 889, 704, 783, 843, 281, 818, 28, 530, 622, 421, 567, 598, 216, 323, 138, 688, 888, 327, 8, 858, 251, 890, 594, 608, 45, 16, 548, 164, 217, 813, 286, 178, 79, 238, 74, 349, 374, 311, 693, 545, 204, 812, 534, 346, 529, 258, 652, 885, 14, 476, 193, 673, 741, 521, 149, 862, 483, 56, 436, 401, 252, 140, 825, 266])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayM() {
        
        let canBeSorted = LarrysArray.canRobotSort([107, 430, 526, 297, 263, 638, 395, 672, 154, 77, 824, 371, 468, 602, 31, 298, 760, 490, 406, 224, 750, 482, 349, 257, 673, 603, 75, 463, 503, 155, 379, 388, 394, 261, 716, 451, 659, 592, 35, 372, 101, 352, 752, 744, 749, 698, 24, 798, 579, 323, 53, 548, 809, 851, 197, 99, 668, 55, 599, 92, 72, 675, 34, 677, 466, 511, 811, 839, 562, 127, 663, 432, 325, 91, 184, 607, 794, 459, 335, 255, 408, 580, 332, 595, 10, 114, 277, 734, 608, 290, 113, 534, 173, 720, 49, 814, 94, 691, 426, 20, 815, 676, 108, 390, 695, 74, 8, 522, 78, 342, 191, 662, 373, 118, 751, 478, 98, 588, 645, 844, 33, 42, 360, 169, 819, 362, 331, 123, 256, 110, 693, 234, 216, 471, 604, 291, 523, 642, 622, 131, 23, 818, 280, 293, 227, 1, 473, 568, 250, 449, 399, 183, 477, 276, 444, 126, 479, 640, 711, 788, 438, 258, 700, 19, 358, 137, 162, 187, 574, 176, 104, 383, 193, 823, 232, 16, 423, 669, 689, 147, 786, 170, 353, 847, 243, 351, 320, 461, 514, 404, 59, 267, 79, 158, 259, 274, 704, 195, 457, 269, 781, 235, 773, 513, 21, 100, 483, 68, 402, 688, 685, 531, 842, 405, 499, 417, 237, 634, 380, 464, 762, 593, 300, 133, 90, 496, 678, 125, 702, 270, 87, 71, 583, 743, 411, 708, 840, 728, 392, 740, 533, 726, 584, 848, 476, 202, 810, 84, 556, 57, 218, 348, 285, 816, 735, 355, 560, 350, 682, 343, 736, 271, 780, 637, 628, 517, 435, 95, 480, 268, 837, 103, 363, 733, 296, 76, 617, 26, 165, 610, 582, 207, 636, 305, 354, 737, 765, 228, 777, 820, 454, 386, 802, 709, 340, 67, 201, 772, 553, 286, 64, 179, 282, 190, 119, 86, 485, 410, 130, 172, 830, 525, 156, 288, 138, 272, 529, 223, 32, 309, 69, 14, 206, 706, 465, 539, 519, 310, 301, 112, 294, 152, 540, 808, 121, 567, 670, 244, 835, 506, 134, 47, 653, 150, 58, 770, 486, 306, 518, 18, 148, 431, 445, 415, 246, 585, 145, 409, 420, 166, 557, 120, 845, 507, 509, 778, 446, 564, 455, 546, 573, 833, 161, 175, 153, 46, 230, 732, 88, 631, 774, 577, 841, 488, 144, 382, 598, 707, 443, 260, 25, 566, 81, 447, 439, 36, 11, 470, 221, 730, 366, 186, 504, 745, 6, 701, 102, 655, 697, 619, 219, 589, 616, 440, 763, 635, 356, 626, 177, 632, 44, 731, 555, 345, 554, 424, 215, 469, 157, 643, 192, 532, 460, 812, 2, 51, 521, 365, 665, 596, 168, 528, 652, 284, 38, 660, 686, 452, 713, 434, 550, 822, 418, 500, 757, 647, 561, 339, 664, 96, 571, 768, 654, 262, 369, 364, 200, 495, 650, 116, 699, 302, 684, 12, 236, 648, 149, 208, 609, 639, 407, 621, 710, 151, 287, 251, 487, 838, 397, 563, 715, 378, 167, 367, 843, 792, 73, 60, 761, 481, 212, 605, 396, 651, 211, 559, 66, 336, 565, 240, 537, 9, 205, 7, 775, 558, 748, 142, 671, 391, 769, 849, 359, 22, 239, 472, 600, 516, 578, 231, 545, 791, 188, 436, 594, 4, 739, 612, 549, 448, 785, 581, 817, 275, 196, 576, 242, 657, 747, 63, 491, 683, 644, 544, 181, 692, 283, 164, 122, 333, 656, 834, 442, 767, 400, 40, 538, 139, 189, 266, 527, 317, 321, 384, 738, 174, 393, 741, 510, 805, 825, 241, 618, 620, 278, 106, 484, 389, 712, 401, 65, 29, 403, 572, 141, 623, 718, 185, 361, 413, 649, 159, 220, 624, 724, 790, 311, 254, 453, 319, 329, 328, 327, 753, 248, 160, 412, 829, 337, 312, 247, 203, 204, 501, 742, 756, 210, 398, 456, 429, 541, 377, 313, 696, 245, 530, 27, 795, 474, 674, 180, 512, 441, 249, 475, 308, 318, 776, 171, 505, 705, 427, 15, 117, 178, 80, 793, 801, 143, 587, 419, 322, 590, 135, 128, 625, 146, 502, 222, 494, 658, 83, 292, 547, 85, 89, 586, 265, 764, 666, 209, 3, 725, 115, 722, 646, 821, 606, 273, 226, 569, 462, 629, 543, 552, 304, 846, 341, 132, 789, 194, 52, 41, 381, 492, 787, 467, 661, 50, 28, 497, 542, 813, 376, 723, 229, 758, 727, 575, 611, 641, 56, 338, 759, 45, 48, 5, 771, 721, 828, 804, 520, 163, 836, 524, 315, 303, 253, 385, 597, 680, 614, 703, 719, 374, 667, 493, 422, 832, 70, 140, 238, 807, 111, 458, 428, 766, 784, 800, 416, 82, 806, 831, 39, 551, 129, 489, 779, 437, 375, 414, 93, 681, 252, 615, 425, 330, 198, 754, 536, 433, 289, 755, 13, 613, 264, 591, 803, 850, 62, 299, 136, 729, 630, 796, 498, 334, 687, 182, 783, 43, 746, 124, 199, 316, 633, 421, 570, 717, 535, 690, 105, 827, 346, 515, 295, 281, 357, 109, 627, 344, 233, 508, 217, 694, 324, 314, 213, 61, 387, 214, 97, 368, 37, 54, 279, 799, 797, 679, 370, 225, 782, 450, 601, 307, 30, 347, 326, 17, 714, 826])
        
        XCTAssertFalse(canBeSorted)
    }
    
    // MARK: Alt
    
    func test_larrysArrayAltA() {
        
        let canBeSorted = LarrysArray.canRobotSortAlt([3, 1, 2])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayAltB() {
        
        let canBeSorted = LarrysArray.canRobotSortAlt([1, 3, 4, 2])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayAltC() {
        
        let canBeSorted = LarrysArray.canRobotSortAlt([1, 2, 3, 5, 4])
        
        XCTAssertFalse(canBeSorted)
    }

    func test_larrysArrayAltD() {
        
        let canBeSorted = LarrysArray.canRobotSortAlt([1, 3, 4, 2])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayAltE() {
        
        let canBeSorted = LarrysArray.canRobotSortAlt([1, 2, 3, 5, 4])
        
        XCTAssertFalse(canBeSorted)
    }
    
    func test_larrysArrayAltF() {
        
        let canBeSorted = LarrysArray.canRobotSortAlt([4, 1, 3, 2])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayAltG() {
        
        let canBeSorted = LarrysArray.canRobotSortAlt([9, 6, 8, 12, 3, 7, 1, 11, 10, 2, 5, 4])
        
        XCTAssertFalse(canBeSorted)
    }
    
    func test_larrysArrayAltH() {
        
        let canBeSorted = LarrysArray.canRobotSortAlt([17, 21, 2, 1, 16, 9, 12, 11, 6, 18, 20, 7, 14, 8, 19, 10, 3, 4, 13, 5, 15])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayAltI() {
        
        let canBeSorted = LarrysArray.canRobotSortAlt([5, 8, 13, 3, 10, 4, 12, 1, 2, 7, 14, 6, 15, 11, 9])
        
        XCTAssertFalse(canBeSorted)
    }
    
    func test_larrysArrayAltJ() {
        
        let canBeSorted = LarrysArray.canRobotSortAlt([8, 10, 6, 11, 7, 1, 9, 12, 3, 5, 13, 4, 2])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayAltK() {
        
        let canBeSorted = LarrysArray.canRobotSortAlt([7, 9, 15, 8, 10, 16, 6, 14, 5, 13, 17, 12, 3, 11, 4, 1, 18, 2])
        
        XCTAssertFalse(canBeSorted)
    }
    
    func test_larrysArrayAltL() {
        
        let canBeSorted = LarrysArray.canRobotSortAlt([176, 591, 437, 249, 448, 600, 73, 152, 12, 731, 736, 593, 202, 824, 223, 844, 195, 235, 416, 194, 115, 777, 182, 753, 87, 236, 279, 680, 229, 880, 33, 789, 849, 170, 368, 62, 719, 492, 854, 25, 69, 146, 517, 749, 188, 807, 727, 639, 760, 288, 674, 628, 199, 744, 163, 904, 852, 151, 270, 618, 35, 415, 81, 316, 671, 861, 763, 627, 208, 232, 145, 869, 892, 662, 574, 380, 419, 602, 336, 595, 538, 305, 832, 159, 294, 449, 531, 328, 588, 771, 98, 694, 243, 840, 95, 179, 522, 259, 218, 781, 590, 814, 287, 457, 330, 307, 310, 649, 604, 1, 830, 501, 394, 537, 134, 507, 795, 740, 423, 428, 50, 488, 774, 155, 579, 689, 120, 125, 15, 553, 291, 84, 473, 528, 544, 788, 714, 539, 38, 230, 770, 113, 196, 168, 599, 816, 800, 859, 381, 51, 630, 490, 453, 725, 22, 728, 596, 851, 273, 784, 17, 127, 118, 233, 683, 172, 650, 443, 625, 144, 244, 5, 699, 454, 616, 242, 23, 371, 580, 541, 738, 623, 129, 57, 413, 214, 886, 340, 147, 245, 729, 32, 479, 660, 601, 364, 701, 636, 661, 264, 703, 474, 112, 225, 55, 894, 612, 901, 404, 206, 391, 126, 698, 853, 565, 645, 71, 444, 400, 815, 494, 512, 793, 803, 566, 7, 556, 659, 24, 89, 427, 9, 275, 768, 887, 96, 564, 720, 361, 295, 397, 351, 212, 568, 605, 508, 20, 124, 37, 13, 581, 321, 550, 543, 111, 385, 183, 776, 354, 439, 808, 864, 520, 411, 292, 174, 76, 447, 746, 762, 518, 663, 139, 332, 70, 171, 425, 691, 231, 575, 465, 498, 186, 160, 620, 282, 338, 378, 500, 629, 547, 524, 343, 396, 471, 847, 505, 621, 452, 207, 388, 372, 36, 356, 536, 142, 516, 324, 804, 870, 896, 334, 767, 75, 743, 433, 133, 560, 757, 135, 11, 810, 280, 106, 30, 540, 751, 190, 855, 101, 387, 511, 535, 422, 455, 123, 399, 745, 609, 631, 220, 756, 184, 290, 450, 670, 86, 41, 710, 210, 654, 285, 92, 842, 198, 464, 97, 640, 692, 339, 772, 546, 458, 678, 778, 154, 837, 759, 606, 633, 185, 845, 687, 485, 376, 554, 187, 523, 283, 477, 718, 254, 293, 215, 587, 841, 790, 29, 577, 737, 748, 724, 549, 764, 414, 497, 369, 786, 357, 879, 615, 480, 569, 877, 667, 335, 78, 289, 669, 561, 666, 345, 406, 489, 576, 103, 646, 219, 52, 503, 891, 475, 597, 706, 883, 284, 712, 240, 132, 105, 468, 442, 750, 68, 271, 90, 119, 532, 18, 677, 495, 363, 765, 341, 707, 130, 65, 506, 482, 417, 708, 874, 551, 647, 558, 527, 519, 460, 274, 200, 141, 486, 373, 865, 409, 367, 834, 228, 3, 227, 268, 695, 392, 440, 59, 313, 817, 358, 829, 267, 42, 502, 723, 709, 585, 201, 6, 157, 675, 866, 19, 826, 420, 868, 169, 167, 875, 572, 412, 836, 209, 43, 696, 180, 515, 121, 573, 542, 61, 304, 780, 899, 711, 676, 386, 672, 811, 613, 296, 445, 122, 461, 40, 272, 611, 148, 872, 54, 165, 491, 325, 429, 333, 156, 298, 681, 299, 469, 181, 150, 64, 234, 239, 197, 697, 583, 403, 638, 690, 779, 27, 470, 365, 91, 347, 456, 331, 418, 405, 306, 350, 426, 526, 375, 26, 773, 730, 833, 430, 143, 656, 805, 726, 648, 441, 557, 66, 393, 192, 504, 782, 734, 735, 466, 775, 651, 797, 641, 342, 104, 269, 362, 850, 366, 94, 398, 224, 352, 382, 822, 34, 493, 360, 166, 158, 827, 682, 384, 337, 873, 665, 262, 173, 211, 792, 684, 499, 513, 761, 348, 137, 881, 472, 438, 571, 668, 451, 390, 221, 47, 10, 49, 48, 407, 309, 4, 893, 716, 563, 318, 276, 431, 806, 446, 809, 253, 161, 552, 424, 766, 619, 102, 509, 377, 82, 110, 769, 878, 755, 484, 610, 742, 410, 514, 831, 175, 263, 93, 109, 297, 686, 481, 758, 303, 383, 617, 819, 589, 395, 319, 642, 247, 312, 241, 624, 496, 634, 848, 732, 867, 510, 713, 643, 791, 107, 754, 322, 248, 828, 902, 301, 603, 326, 559, 31, 747, 432, 355, 860, 260, 46, 389, 578, 562, 88, 2, 370, 799, 717, 153, 478, 721, 705, 226, 884, 685, 108, 300, 203, 614, 177, 261, 702, 846, 785, 700, 191, 839, 657, 353, 21, 136, 359, 533, 487, 900, 44, 715, 722, 794, 116, 897, 58, 802, 525, 379, 317, 632, 462, 60, 63, 80, 796, 246, 626, 658, 67, 99, 801, 863, 434, 733, 820, 752, 189, 871, 592, 856, 320, 607, 787, 314, 53, 344, 128, 72, 798, 582, 838, 664, 823, 256, 408, 222, 637, 435, 882, 903, 679, 85, 653, 39, 237, 857, 100, 277, 876, 329, 898, 586, 467, 635, 257, 265, 205, 895, 302, 644, 117, 555, 250, 459, 114, 77, 162, 655, 255, 835, 308, 821, 402, 83, 131, 584, 315, 739, 213, 570, 278, 463, 889, 704, 783, 843, 281, 818, 28, 530, 622, 421, 567, 598, 216, 323, 138, 688, 888, 327, 8, 858, 251, 890, 594, 608, 45, 16, 548, 164, 217, 813, 286, 178, 79, 238, 74, 349, 374, 311, 693, 545, 204, 812, 534, 346, 529, 258, 652, 885, 14, 476, 193, 673, 741, 521, 149, 862, 483, 56, 436, 401, 252, 140, 825, 266])
        
        XCTAssertTrue(canBeSorted)
    }
    
    func test_larrysArrayAltM() {
        
        let canBeSorted = LarrysArray.canRobotSortAlt([107, 430, 526, 297, 263, 638, 395, 672, 154, 77, 824, 371, 468, 602, 31, 298, 760, 490, 406, 224, 750, 482, 349, 257, 673, 603, 75, 463, 503, 155, 379, 388, 394, 261, 716, 451, 659, 592, 35, 372, 101, 352, 752, 744, 749, 698, 24, 798, 579, 323, 53, 548, 809, 851, 197, 99, 668, 55, 599, 92, 72, 675, 34, 677, 466, 511, 811, 839, 562, 127, 663, 432, 325, 91, 184, 607, 794, 459, 335, 255, 408, 580, 332, 595, 10, 114, 277, 734, 608, 290, 113, 534, 173, 720, 49, 814, 94, 691, 426, 20, 815, 676, 108, 390, 695, 74, 8, 522, 78, 342, 191, 662, 373, 118, 751, 478, 98, 588, 645, 844, 33, 42, 360, 169, 819, 362, 331, 123, 256, 110, 693, 234, 216, 471, 604, 291, 523, 642, 622, 131, 23, 818, 280, 293, 227, 1, 473, 568, 250, 449, 399, 183, 477, 276, 444, 126, 479, 640, 711, 788, 438, 258, 700, 19, 358, 137, 162, 187, 574, 176, 104, 383, 193, 823, 232, 16, 423, 669, 689, 147, 786, 170, 353, 847, 243, 351, 320, 461, 514, 404, 59, 267, 79, 158, 259, 274, 704, 195, 457, 269, 781, 235, 773, 513, 21, 100, 483, 68, 402, 688, 685, 531, 842, 405, 499, 417, 237, 634, 380, 464, 762, 593, 300, 133, 90, 496, 678, 125, 702, 270, 87, 71, 583, 743, 411, 708, 840, 728, 392, 740, 533, 726, 584, 848, 476, 202, 810, 84, 556, 57, 218, 348, 285, 816, 735, 355, 560, 350, 682, 343, 736, 271, 780, 637, 628, 517, 435, 95, 480, 268, 837, 103, 363, 733, 296, 76, 617, 26, 165, 610, 582, 207, 636, 305, 354, 737, 765, 228, 777, 820, 454, 386, 802, 709, 340, 67, 201, 772, 553, 286, 64, 179, 282, 190, 119, 86, 485, 410, 130, 172, 830, 525, 156, 288, 138, 272, 529, 223, 32, 309, 69, 14, 206, 706, 465, 539, 519, 310, 301, 112, 294, 152, 540, 808, 121, 567, 670, 244, 835, 506, 134, 47, 653, 150, 58, 770, 486, 306, 518, 18, 148, 431, 445, 415, 246, 585, 145, 409, 420, 166, 557, 120, 845, 507, 509, 778, 446, 564, 455, 546, 573, 833, 161, 175, 153, 46, 230, 732, 88, 631, 774, 577, 841, 488, 144, 382, 598, 707, 443, 260, 25, 566, 81, 447, 439, 36, 11, 470, 221, 730, 366, 186, 504, 745, 6, 701, 102, 655, 697, 619, 219, 589, 616, 440, 763, 635, 356, 626, 177, 632, 44, 731, 555, 345, 554, 424, 215, 469, 157, 643, 192, 532, 460, 812, 2, 51, 521, 365, 665, 596, 168, 528, 652, 284, 38, 660, 686, 452, 713, 434, 550, 822, 418, 500, 757, 647, 561, 339, 664, 96, 571, 768, 654, 262, 369, 364, 200, 495, 650, 116, 699, 302, 684, 12, 236, 648, 149, 208, 609, 639, 407, 621, 710, 151, 287, 251, 487, 838, 397, 563, 715, 378, 167, 367, 843, 792, 73, 60, 761, 481, 212, 605, 396, 651, 211, 559, 66, 336, 565, 240, 537, 9, 205, 7, 775, 558, 748, 142, 671, 391, 769, 849, 359, 22, 239, 472, 600, 516, 578, 231, 545, 791, 188, 436, 594, 4, 739, 612, 549, 448, 785, 581, 817, 275, 196, 576, 242, 657, 747, 63, 491, 683, 644, 544, 181, 692, 283, 164, 122, 333, 656, 834, 442, 767, 400, 40, 538, 139, 189, 266, 527, 317, 321, 384, 738, 174, 393, 741, 510, 805, 825, 241, 618, 620, 278, 106, 484, 389, 712, 401, 65, 29, 403, 572, 141, 623, 718, 185, 361, 413, 649, 159, 220, 624, 724, 790, 311, 254, 453, 319, 329, 328, 327, 753, 248, 160, 412, 829, 337, 312, 247, 203, 204, 501, 742, 756, 210, 398, 456, 429, 541, 377, 313, 696, 245, 530, 27, 795, 474, 674, 180, 512, 441, 249, 475, 308, 318, 776, 171, 505, 705, 427, 15, 117, 178, 80, 793, 801, 143, 587, 419, 322, 590, 135, 128, 625, 146, 502, 222, 494, 658, 83, 292, 547, 85, 89, 586, 265, 764, 666, 209, 3, 725, 115, 722, 646, 821, 606, 273, 226, 569, 462, 629, 543, 552, 304, 846, 341, 132, 789, 194, 52, 41, 381, 492, 787, 467, 661, 50, 28, 497, 542, 813, 376, 723, 229, 758, 727, 575, 611, 641, 56, 338, 759, 45, 48, 5, 771, 721, 828, 804, 520, 163, 836, 524, 315, 303, 253, 385, 597, 680, 614, 703, 719, 374, 667, 493, 422, 832, 70, 140, 238, 807, 111, 458, 428, 766, 784, 800, 416, 82, 806, 831, 39, 551, 129, 489, 779, 437, 375, 414, 93, 681, 252, 615, 425, 330, 198, 754, 536, 433, 289, 755, 13, 613, 264, 591, 803, 850, 62, 299, 136, 729, 630, 796, 498, 334, 687, 182, 783, 43, 746, 124, 199, 316, 633, 421, 570, 717, 535, 690, 105, 827, 346, 515, 295, 281, 357, 109, 627, 344, 233, 508, 217, 694, 324, 314, 213, 61, 387, 214, 97, 368, 37, 54, 279, 799, 797, 679, 370, 225, 782, 450, 601, 307, 30, 347, 326, 17, 714, 826])
        
        XCTAssertFalse(canBeSorted)
    }

}
