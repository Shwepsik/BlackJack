//
//  BlackJackData.swift
//  Kazinak
//
//  Created by Valerii on 21.11.2018.
//  Copyright © 2018 Valerii. All rights reserved.
//

import UIKit

class BlackJackData: UIViewController {

    static var cars1 = [UIImage(named: "21"),
                        UIImage(named: "22"),
                        UIImage(named: "23"),
                        UIImage(named: "24"),
                        UIImage(named: "31"),
                        UIImage(named: "32"),
                        UIImage(named: "33"),
                        UIImage(named: "34"),
                        UIImage(named: "41"),
                        UIImage(named: "42"),
                        UIImage(named: "43"),
                        UIImage(named: "44"),
                        UIImage(named: "51"),
                        UIImage(named: "52"),
                        UIImage(named: "53"),
                        UIImage(named: "54"),
                        UIImage(named: "61"),
                        UIImage(named: "62"),
                        UIImage(named: "63"),
                        UIImage(named: "64"),
                        UIImage(named: "71"),
                        UIImage(named: "72"),
                        UIImage(named: "73"),
                        UIImage(named: "74"),
                        UIImage(named: "81"),
                        UIImage(named: "82"),
                        UIImage(named: "83"),
                        UIImage(named: "84"),
                        UIImage(named: "91"),
                        UIImage(named: "92"),
                        UIImage(named: "93"),
                        UIImage(named: "94"),
                        UIImage(named: "101"),
                        UIImage(named: "102"),
                        UIImage(named: "103"),
                        UIImage(named: "104"),
                        UIImage(named: "j1"),
                        UIImage(named: "j2"),
                        UIImage(named: "j3"),
                        UIImage(named: "j4"),
                        UIImage(named: "q1"),
                        UIImage(named: "q2"),
                        UIImage(named: "q3"),
                        UIImage(named: "q4"),
                        UIImage(named: "k1"),
                        UIImage(named: "k2"),
                        UIImage(named: "k3"),
                        UIImage(named: "k4"),
                        UIImage(named: "a1"),
                        UIImage(named: "a2"),
                        UIImage(named: "a3"),
                        UIImage(named: "a4")]
    
    static var checkCards = ["2","2","2","2","3","3","3","3","4","4","4","4","5","5","5","5","6","6","6","6","7","7","7","7","8","8","8","8","9","9","9","9","10","10","10","10","10","10","10","10","10","10","10","10","10","10","10","10","11","11","11","11"]
    
    static let seatButtonImage = UIImage(named: "plus")
    static let stopButtonImage = UIImage(named: "negative")
    static let leaveSeatImage = UIImage(named: "error")
    static let holdSeatImage = UIImage(named: "circle")
    static let backButtons = UIImage(named: "back")
    static let multiplayButton = UIImage(named: "x2")
    static let backCardImage = UIImage(named: "spina")
    static let firstChips = UIImage(named: "100CC")
    static let secondChips = UIImage(named: "1c")
    static let thirdChips = UIImage(named: "3c")
    static let fourthChips = UIImage(named: "6c")
    static let fifthChips = UIImage(named: "30cc")
    static let sixtChips = UIImage(named: "60cc")
    static let win = UIImage(named: "win")
    static let lose = UIImage(named: "lose")
    static let draw = UIImage(named: "push")
    static let bust = UIImage(named: "bust")
    static let rightTrig = UIImage(named: "lefts")
    static let leftTrig = UIImage(named: "rights")
    static let rightTrigY = UIImage(named: "lefs")
    static let leftTrigY = UIImage(named: "righs")
    
    static var timeImage = [UIImage(named: "1"),
                            UIImage(named: "2"),
                            UIImage(named: "3"),
                            UIImage(named: "4"),
                            UIImage(named: "5"),
                            UIImage(named: "6"),
                            UIImage(named: "7"),
                            UIImage(named: "8"),
                            UIImage(named: "9"),
                            UIImage(named: "10"),
                            UIImage(named: "11"),
                            UIImage(named: "12"),
                            UIImage(named: "13"),
                            UIImage(named: "14"),
                            UIImage(named: "15")]
  
    
    static let frameFrom = CGRect(x: 640, y: 30, width: 60, height: 50)
    
    static let firstSeatIsEmpty = 1
    static let secondSeatIsEmpty = 2
    static let thirdSeatIsEmpty = 3
    static let fourthSeatIsEmpty = 4
    static let fifthSeatIsEmpty = 5
    
    static var firstTagNumber = 1
    static var secondTagNumber = 1
    static var thirdTagNumber = 1
    static var fourthTagNumber = 1
    static var fiveTagNumber = 1
    
    static let holdFirstSeat = 6
    static let holdSecondSeat = 7
    static let holdThirdSeat = 8
    static let holdFourthSeat = 9
    static let holdFifthSeat = 10
    
    static let leaveFromFirstSeat = 11
    static let leaveFromSecondSeat = 12
    static let leaveFromThirdSeat = 13
    static let leaveFromFourthSeat = 14
    static let leaveFromFifthSeat = 15
    
    static let stopForFirstSeat = 16
    static let stopForSecondSeat = 17
    static let stopForThirdSeat = 18
    static let stopForFourthSeat = 19
    static let stopForFifthSeat = 20
    
    static let stopForFirstSeatIsOn = 21
    static let stopForSecondSeatIsOn = 22
    static let stopForThirdSeatIsOn = 23
    static let stopForFourthSeatIsOn = 24
    static let stopForFifthSeatIsOn = 25

    static let addCartForFirstSeat = 26
    static let addCartForSecondSeat = 27
    static let addCartForThirdSeat = 28
    static let addCartForFourthSeat = 29
    static let addCartForFifthSeat = 30
    
    static let addThirdCartForFifthSeat = 31
    static let addFourthCartForFifthSeat = 32
    static let addFifthCartForFifthSeat = 33
    static let addSixtCartForFifthSeat = 34
    static let addSeventhCartForFifthSeat = 35
    static let addEighthCartForFifthSeat = 36
    static let addNinthCartForFifthSeat = 37
    
    static let addThirdCartForFourthSeat = 38
    static let addFourthCartForFourthSeat = 39
    static let addFifthCartForFourthSeat = 40
    static let addSixtCartForFourthSeat = 41
    static let addSeventhCartForFourthSeat = 42
    static let addEighthCartFourthSeat = 43
    static let addNinthCartForFourthSeat = 44
    
    static let addThirdCartForThirdSeat = 45
    static let addFourthCartForThirdSeat = 46
    static let addFifthCartForThirdSeat = 47
    static let addSixtCartForThirdSeat = 48
    static let addSeventhCartForThirdSeat = 49
    static let addEighthCartThirdSeat = 50
    static let addNinthCartForThirdSeat = 51
    
    static let addThirdCartForSecondSeat = 52
    static let addFourthCartForSecondSeat = 53
    static let addFifthCartForSecondSeat = 54
    static let addSixtCartForSecondSeat = 55
    static let addSeventhCartForSecondSeat = 56
    static let addEighthCartForSecondSeat = 57
    static let addNinthCartForSecondSeat = 58
    
    static let addThirdCartForFirstSeat = 59
    static let addFourthCartForFirstSeat = 60
    static let addFifthCartForFirstSeat = 61
    static let addSixtCartForFirstSeat = 62
    static let addSeventhCartForFirstSeat = 63
    static let addEighthCartForFirstSeat = 64
    static let addNinthCartForFirstSeat = 65
    
    static let firstSeatWaitingCart = 66
    static let secondSeatWaitingCart = 67
    static let thirdSeatWaitingCart = 68
    static let fourthSeatWaitingCart = 69
    
    
    static var checkFirstSeatLable = UILabel()
    static var checkSecondSeatLable = UILabel()
    static var checkThirdSeatLable = UILabel()
    static var checkFourthSeatLable = UILabel()
    static var checkFifthSeatLable = UILabel()
    static var checkDilerSeatLable = UILabel()
    
    
    // + для раздачи
    
    static var addCartButtonForFirstSeat = UIButton()
    static var addCartButtonForSecondSeat = UIButton()
    static var addCartButtonForThirdSeat = UIButton()
    static var addCartButtonForFirthSeat = UIButton()
    static var addCartButtonForFiveSeat = UIButton()
    
    //  Хватит
    static var stopButtonForFirstSeat = UIButton()
    static var stopButtonForSecondSeat = UIButton()
    static var stopButtonForThirdSeat = UIButton()
    static var stopButtonForFirthSeat = UIButton()
    static var stopButtonForFiveSeat = UIButton()
    
    // Уйти
    static var leaveFirstSeatButton = UIButton()
    static var leaveSecondSeatButton = UIButton()
    static var leaveThirdSeatButton = UIButton()
    static var leaveFirthSeatButton = UIButton()
    static var leaveFiveSeatButton = UIButton()
    
    static var firstSeat = UIButton()
    static var secondSeat = UIButton()
    static var thirdSeat = UIButton()
    static var firthSeat = UIButton()
    static var fiveSeat = UIButton()
    
    // ставки
    static let backButtonTag = 11
    static let firstBetTag = 100
    static let secondBetTag = 1000
    static let thirdBetTag = 3000
    static let firthBetTag = 6000
    static let fiveBetTag = 30000
    static let sixBetTag = 60000
    static let multiplyTag = 88
    
    static var backButton = UIButton()
    static var firstBet = UIButton()
    static var secondBet = UIButton()
    static var thirdBet = UIButton()
    static var firthBet = UIButton()
    static var fiveBet = UIButton()
    static var sixBet = UIButton()
    static var multiply = UIButton()
    
    
    static var seatTagNumber = [fiveTagNumber,fourthTagNumber,thirdTagNumber,secondTagNumber,firstTagNumber]
    static var addCardForSeatsOne = [addThirdCartForFirstSeat,addFourthCartForFirstSeat,addFifthCartForFirstSeat,addSixtCartForFirstSeat,addSeventhCartForFirstSeat,addEighthCartForFirstSeat,addNinthCartForFirstSeat]
    static var addCardForSeatsTwo = [addThirdCartForSecondSeat,addFourthCartForSecondSeat,addFifthCartForSecondSeat,addSixtCartForSecondSeat,addSeventhCartForSecondSeat,addEighthCartForSecondSeat,addNinthCartForSecondSeat]
    static var addCardForSeatsThree = [addThirdCartForThirdSeat,addFourthCartForThirdSeat,addFifthCartForThirdSeat,addSixtCartForThirdSeat,addSeventhCartForThirdSeat,addEighthCartThirdSeat,addNinthCartForThirdSeat]
    static var addCardForSeatsFour = [addThirdCartForFourthSeat,addFourthCartForFourthSeat,addFifthCartForFourthSeat,addSixtCartForFourthSeat,addSeventhCartForFourthSeat,addEighthCartFourthSeat,addNinthCartForFourthSeat]
    static var addCardForSeatsFive = [addThirdCartForFifthSeat,addFourthCartForFifthSeat,addFifthCartForFifthSeat,addSixtCartForFifthSeat,addSeventhCartForFifthSeat,addEighthCartForFifthSeat,addNinthCartForFifthSeat]
    
    static var allBets = [backButton,multiply,sixBet,fiveBet,firthBet,thirdBet,secondBet,firstBet]
    static var allBetsTag = [backButtonTag,multiplyTag,sixBetTag,fiveBetTag,firthBetTag,thirdBetTag,secondBetTag,firstBetTag]
    static var allBetsImage = [backButtons,multiplayButton,sixtChips,fifthChips,fourthChips,thirdChips,secondChips,firstChips]
    
    static var allSeats = [fiveSeat,firthSeat,thirdSeat,secondSeat,firstSeat]
    static var seatsFrame = [fiveSeatFrame,firthSeatFrame,thirdSeatFrame,secondSeatFrame,firstSeatFrame]
    static var seatTag = [fifthSeatIsEmpty,fourthSeatIsEmpty,thirdSeatIsEmpty,secondSeatIsEmpty,firstSeatIsEmpty]
    
    static var leaveButtons = [leaveFiveSeatButton,leaveFirthSeatButton,leaveThirdSeatButton,leaveSecondSeatButton,leaveFirstSeatButton]
    static var leaveButtonsFrame = [leaveFiveSeatButtonFrame,leaveFirthSeatButtonFrame,leaveThirdSeatButtonFrame,leaveSecondSeatButtonFrame,leaveFirstSeatButtonFrame]
    static var leaveButtonsTag = [leaveFromFifthSeat,leaveFromFourthSeat,leaveFromThirdSeat,leaveFromSecondSeat,leaveFromFirstSeat]
    
    static var stopButtons = [stopButtonForFiveSeat,stopButtonForFirthSeat,stopButtonForThirdSeat,stopButtonForSecondSeat,stopButtonForFirstSeat]
    static var stopCartButtonsFrame = [stopButtonForFiveSeatFrame,stopButtonForFirthSeatFrame,stopButtonForThirdSeatFrame,stopButtonForSecondSeatFrame,stopButtonForFirstSeatFrame]
    static var stopCartButtonsTag = [stopForFifthSeat,stopForFourthSeat,stopForThirdSeat,stopForSecondSeat,stopForFirstSeat]
    
    static var checkLose = [checkFifthSeat,checkFourthSeat,checkThirdSeat,checkSecondSeat,checkFirstSeat,checkDilerSeat]
    static var checkLoseText = [checkFifthSeatLable,checkFourthSeatLable,checkThirdSeatLable,checkSecondSeatLable,checkFirstSeatLable,checkDilerSeatLable]
    static var checkLoseFrame = [checkFifthSeatLableFrame,checkFourthSeatLableFrame,checkThirdSeatLableFrame,checkSecondSeatLableFrame,checkFirstSeatLableFrame,checkDilerSeatLableFrame]
    
    static var addCartButtons = [addCartButtonForFiveSeat,addCartButtonForFirthSeat,addCartButtonForThirdSeat,addCartButtonForSecondSeat,addCartButtonForFirstSeat]
    static var addCartButtonsFrame = [addCartButtonForFiveSeatFrame,addCartButtonForFirthSeatFrame,addCartButtonForThirdSeatFrame,addCartButtonForSecondSeatFrame,addCartButtonForFirstSeatFrame]
    static var addCartButtonsTag = [addCartForFifthSeat,addCartForFourthSeat,addCartForThirdSeat,addCartForSecondSeat,addCartForFirstSeat]
    
    static var stopButtonIsOn = [stopForFifthSeatIsOn,stopForFourthSeatIsOn,stopForThirdSeatIsOn,stopForSecondSeatIsOn,stopForFirstSeatIsOn]
    
    // картинки фишек
    
    static var imageFirst = UIImageView()
    static var imageSecond = UIImageView()
    static var imageThird = UIImageView()
    static var imageFourth = UIImageView()
    static var imageFifth = UIImageView()
    
    static var imageFirstCopy = UIImageView()
    static var imageSecondCopy = UIImageView()
    static var imageThirdCopy = UIImageView()
    static var imageFourthCopy = UIImageView()
    static var imageFifthCopy = UIImageView()
    
    static var betImageViewCopy = [imageFifthCopy,imageFourthCopy,imageThirdCopy,imageSecondCopy,imageFirstCopy]
    static var betImageView = [imageFifth,imageFourth,imageThird,imageSecond,imageFirst]
    
    
    static var animationCards : Double = 0
    static var animationCardss = 0
    static let duration = 1
    static var animationDilerCards = 0
    
    static var betCalled = false
    static var statusBetButtons = true
    
    
    static var betFrames = [backButtonFrame,multiplyFrame,sixBetFrame,fiveBetFrame,firthBetFrame,thirdBetFrame,secondBetFrame,firstBetFrame]
    
    static var betFramesMove = [fiveBetFrameMove,firthBetFrameMove,thirdBetFrameMove,secondBetFrameMove,firstBetFrameMove]
    
    static var cardsFrame = [firstCartForFiveSeatFrame,secondCartForFiveSeatFrame,thirdCartForFiveSeatFrame,firthCartForFiveSeatFrame,fiveCartForFiveSeatFrame,sixCartForFiveSeatFrame,sevenCartForFiveSeatFrame,eightCartForFiveSeatFrame,nineCartForFiveSeatFrame,firstCartForFirthSeatFrame,secondCartForFirthSeatFrame,thirdCartForFirthSeatFrame,firthCartForFirthSeatFrame,fiveCartForFirthSeatFrame,sixCartForFirthSeatFrame,sevenCartForFirthSeatFrame,eightCartForFirthSeatFrame,nineCartForFirthSeatFrame,firstCartForThirdSeatFrame,secondCartForThirdSeatFrame,thirdCartForThirdSeatFrame,firthCartForThirdSeatFrame,fiveCartForThirdSeatFrame,sixCartForThirdSeatFrame,sevenCartForThirdSeatFrame,eightCartForThirdSeatFrame,nineCartForThirdSeatFrame,firstCartForSecondSeatFrame,secondCartForSecondSeatFrame,thirdCartForSecondSeatFrame,firthCartForSecondSeatFrame,fiveCartForSecondSeatFrame,sixCartForSecondSeatFrame,sevenCartForSecondSeatFrame,eightCartForSecondSeatFrame,nineCartForSecondSeatFrame,firstCartForFirstSeatFrame,secondCartForFirstSeatFrame,thirdCartForFirstSeatFrame,firthCartForFirstSeatFrame,fiveCartForFirstSeatFrame,sixCartForFirstSeatFrame,sevenCartForFirstSeatFrame,eightCartForFirstSeatFrame,nineCartForFirstSeatFrame,firstCartForDilerSeatFrame,secondCartForDilerSeatFrame,thirdCartForDilerSeatFrame,firthCartForDilerSeatFrame,fiveCartForDilerSeatFrame,sixCartForDilerSeatFrame,sevenCartForDilerSeatFrame]
    
    static var cardsImageView = [firstCartForFiveSeat,secondCartForFiveSeat,thirdCartForFiveSeat,firthCartForFiveSeat,fiveCartForFiveSeat,sixCartForFiveSeat,sevenCartForFiveSeat,eightCartForFiveSeat,nineCartForFiveSeat,firstCartForFirthSeat,secondCartForFirthSeat,thirdCartForFirthSeat,firthCartForFirthSeat,fiveCartForFirthSeat,sixCartForFirthSeat,sevenCartForFirthSeat,eightCartForFirthSeat,nineCartForFirthSeat,firstCartForThirdSeat,secondCartForThirdSeat,thirdCartForThirdSeat,firthCartForThirdSeat,fiveCartForThirdSeat,sixCartForThirdSeat,sevenCartForThirdSeat,eightCartForThirdSeat,nineCartForThirdSeat,firstCartForSecondSeat,secondCartForSecondSeat,thirdCartForSecondSeat,firthCartForSecondSeat,fiveCartForSecondSeat,sixCartForSecondSeat,sevenCartForSecondSeat,eightCartForSecondSeat,nineCartForSecondSeat,firstCartForFirstSeat,secondCartForFirstSeat,thirdCartForFirstSeat,firthCartForFirstSeat,fiveCartForFirstSeat,sixCartForFirstSeat,sevenCartForFirstSeat,eightCartForFirstSeat,nineCartForFirstSeat,firstCartForDilerSeat,secondCartForDilerSeat,thirdCartForDilerSeat,firthCartForDilerSeat,fiveCartForDilerSeat,sixCartForDilerSeat,sevenCartForDilerSeat]
    
    
}



var checkFifthSeat = 0
var checkFourthSeat = 0
var checkThirdSeat = 0
var checkSecondSeat = 0
var checkFirstSeat = 0
var checkDilerSeat = 0


var firstCartForFirstSeat = UIImageView()
var secondCartForFirstSeat = UIImageView()
var thirdCartForFirstSeat = UIImageView()
var firthCartForFirstSeat = UIImageView()
var fiveCartForFirstSeat = UIImageView()
var sixCartForFirstSeat = UIImageView()
var sevenCartForFirstSeat = UIImageView()
var eightCartForFirstSeat = UIImageView()
var nineCartForFirstSeat = UIImageView()

// карты для второго
var firstCartForSecondSeat = UIImageView()
var secondCartForSecondSeat = UIImageView()
var thirdCartForSecondSeat = UIImageView()
var firthCartForSecondSeat = UIImageView()
var fiveCartForSecondSeat = UIImageView()
var sixCartForSecondSeat = UIImageView()
var sevenCartForSecondSeat = UIImageView()
var eightCartForSecondSeat = UIImageView()
var nineCartForSecondSeat = UIImageView()
// карты для тертьего
var firstCartForThirdSeat = UIImageView()
var secondCartForThirdSeat = UIImageView()
var thirdCartForThirdSeat = UIImageView()
var firthCartForThirdSeat = UIImageView()
var fiveCartForThirdSeat = UIImageView()
var sixCartForThirdSeat = UIImageView()
var sevenCartForThirdSeat = UIImageView()
var eightCartForThirdSeat = UIImageView()
var nineCartForThirdSeat = UIImageView()
// карты для четвертого
var firstCartForFirthSeat = UIImageView()
var secondCartForFirthSeat = UIImageView()
var thirdCartForFirthSeat = UIImageView()
var firthCartForFirthSeat = UIImageView()
var fiveCartForFirthSeat = UIImageView()
var sixCartForFirthSeat = UIImageView()
var sevenCartForFirthSeat = UIImageView()
var eightCartForFirthSeat = UIImageView()
var nineCartForFirthSeat = UIImageView()
// карты для пятого
var firstCartForFiveSeat = UIImageView()
var secondCartForFiveSeat = UIImageView()
var thirdCartForFiveSeat = UIImageView()
var firthCartForFiveSeat = UIImageView()
var fiveCartForFiveSeat = UIImageView()
var sixCartForFiveSeat = UIImageView()
var sevenCartForFiveSeat = UIImageView()
var eightCartForFiveSeat = UIImageView()
var nineCartForFiveSeat = UIImageView()
// Карты для дилера
var firstCartForDilerSeat = UIImageView()
var secondCartForDilerSeat = UIImageView()
var thirdCartForDilerSeat = UIImageView()
var firthCartForDilerSeat = UIImageView()
var fiveCartForDilerSeat = UIImageView()
var sixCartForDilerSeat = UIImageView()
var sevenCartForDilerSeat = UIImageView()

var firstCartForFirstSeatFrame = CGRect(x: 35, y: 180, width: 60, height: 60)
var secondCartForFirstSeatFrame = CGRect(x: 65, y: 160, width: 60, height: 60)
var thirdCartForFirstSeatFrame = CGRect(x: 35, y: 140, width: 60, height: 60)
var firthCartForFirstSeatFrame = CGRect(x: 65, y: 120, width: 60, height: 60)
var fiveCartForFirstSeatFrame = CGRect(x: 35, y: 100, width: 60, height: 60)
var sixCartForFirstSeatFrame = CGRect(x: 65, y: 80, width: 60, height: 60)
var sevenCartForFirstSeatFrame = CGRect(x: 35, y: 70, width: 60, height: 60)
var eightCartForFirstSeatFrame = CGRect(x: 65, y: 60, width: 60, height: 60)
var nineCartForFirstSeatFrame = CGRect(x: 35, y: 50, width: 60, height: 60)

var firstCartForSecondSeatFrame = CGRect(x: 175, y: 220, width: 60, height: 60)
var secondCartForSecondSeatFrame = CGRect(x: 205, y: 200, width: 60, height: 60)
var thirdCartForSecondSeatFrame = CGRect(x: 175, y: 180, width: 60, height: 60)
var firthCartForSecondSeatFrame = CGRect(x: 205, y: 160, width: 60, height: 60)
var fiveCartForSecondSeatFrame = CGRect(x: 175, y: 140, width: 60, height: 60)
var sixCartForSecondSeatFrame = CGRect(x: 205, y: 120, width: 60, height: 60)
var sevenCartForSecondSeatFrame = CGRect(x: 175, y: 110, width: 60, height: 60)
var eightCartForSecondSeatFrame = CGRect(x: 205, y: 100, width: 60, height: 60)
var nineCartForSecondSeatFrame = CGRect(x: 175, y: 90, width: 60, height: 60)

var firstCartForThirdSeatFrame = CGRect(x: 339, y: 230, width: 60, height: 60)
var secondCartForThirdSeatFrame = CGRect(x: 369, y: 210, width: 60, height: 60)
var thirdCartForThirdSeatFrame = CGRect(x: 339, y: 190, width: 60, height: 60)
var firthCartForThirdSeatFrame = CGRect(x: 369, y: 170, width: 60, height: 60)
var fiveCartForThirdSeatFrame = CGRect(x: 339, y: 150, width: 60, height: 60)
var sixCartForThirdSeatFrame = CGRect(x: 369, y: 130, width: 60, height: 60)
var sevenCartForThirdSeatFrame = CGRect(x: 339, y: 120, width: 60, height: 60)
var eightCartForThirdSeatFrame = CGRect(x: 369, y: 110, width: 60, height: 60)
var nineCartForThirdSeatFrame = CGRect(x: 339, y: 100, width: 60, height: 60)

var firstCartForFirthSeatFrame = CGRect(x: 503, y: 220, width: 60, height: 60)
var secondCartForFirthSeatFrame = CGRect(x: 533, y: 200, width: 60, height: 60)
var thirdCartForFirthSeatFrame = CGRect(x: 503, y: 180, width: 60, height: 60)
var firthCartForFirthSeatFrame = CGRect(x: 533, y: 160, width: 60, height: 60)
var fiveCartForFirthSeatFrame = CGRect(x: 503, y: 140, width: 60, height: 60)
var sixCartForFirthSeatFrame = CGRect(x: 533, y: 120, width: 60, height: 60)
var sevenCartForFirthSeatFrame = CGRect(x: 503, y: 110, width: 60, height: 60)
var eightCartForFirthSeatFrame = CGRect(x: 533, y: 100, width: 60, height: 60)
var nineCartForFirthSeatFrame = CGRect(x: 503, y: 90, width: 60, height: 60)

var firstCartForFiveSeatFrame = CGRect(x: 643, y: 180, width: 60, height: 60)
var secondCartForFiveSeatFrame = CGRect(x: 673, y: 160, width: 60, height: 60)
var thirdCartForFiveSeatFrame = CGRect(x: 643, y: 140, width: 60, height: 60)
var firthCartForFiveSeatFrame = CGRect(x: 673, y: 120, width: 60, height: 60)
var fiveCartForFiveSeatFrame = CGRect(x: 643, y: 100, width: 60, height: 60)
var sixCartForFiveSeatFrame = CGRect(x: 673, y: 80, width: 60, height: 60)
var sevenCartForFiveSeatFrame = CGRect(x: 643, y: 70, width: 60, height: 60)
var eightCartForFiveSeatFrame = CGRect(x: 673, y: 60, width: 60, height: 60)
var nineCartForFiveSeatFrame = CGRect(x: 643, y: 50, width: 60, height: 60)

var firstCartForDilerSeatFrame = CGRect(x: 325, y: 20, width: 60, height: 60)
var secondCartForDilerSeatFrame = CGRect(x: 355, y: 20, width: 60, height: 60)
var thirdCartForDilerSeatFrame = CGRect(x: 385, y: 20, width: 60, height: 60)
var firthCartForDilerSeatFrame = CGRect(x: 415, y: 20, width: 60, height: 60)
var fiveCartForDilerSeatFrame = CGRect(x: 445, y: 20, width: 60, height: 60)
var sixCartForDilerSeatFrame = CGRect(x: 475, y: 20, width: 60, height: 60)
var sevenCartForDilerSeatFrame = CGRect(x: 505, y: 20, width: 60, height: 60)

var backButtonFrame = CGRect(x: 138 , y: 153, width: 50, height: 50)
var multiplyFrame = CGRect(x: 558, y: 153, width: 50, height: 50)
var firstBetFrame = CGRect(x: 198, y: 131, width: 50, height: 50)
var secondBetFrame = CGRect(x: 258, y: 119, width: 50, height: 50)
var thirdBetFrame = CGRect(x: 318, y: 109, width: 50, height: 50)
var firthBetFrame = CGRect(x: 378, y: 109, width: 50, height: 50)
var fiveBetFrame = CGRect(x: 438, y: 119, width: 50, height: 50)
var sixBetFrame = CGRect(x: 498, y: 131, width: 50, height: 50)

var firstBetFrameMove = CGRect(x: 45, y: 270, width: 40, height: 40)
var secondBetFrameMove = CGRect(x: 185, y: 310, width: 40, height: 40)
var thirdBetFrameMove = CGRect(x: 349, y: 320, width: 40, height: 40)
var firthBetFrameMove = CGRect(x: 513, y: 310, width: 40, height: 40)
var fiveBetFrameMove = CGRect(x: 653, y: 270, width: 40, height: 40)

var addCartButtonForFirstSeatFrame = CGRect(x: 30, y: 315, width: 30, height: 30)
var addCartButtonForSecondSeatFrame = CGRect(x: 170, y: 355, width: 30, height: 30)
var addCartButtonForThirdSeatFrame = CGRect(x: 334, y: 365, width: 30, height: 30)
var addCartButtonForFirthSeatFrame = CGRect(x: 498, y: 355, width: 30, height: 30)
var addCartButtonForFiveSeatFrame = CGRect(x: 638, y: 315, width: 30, height: 30)

var stopButtonForFirstSeatFrame = CGRect(x: 70, y: 315, width: 30, height: 30)
var stopButtonForSecondSeatFrame = CGRect(x: 210, y: 355, width: 30, height: 30)
var stopButtonForThirdSeatFrame = CGRect(x: 373, y: 365, width: 30, height: 30)
var stopButtonForFirthSeatFrame = CGRect(x: 538, y: 355, width: 30, height: 30)
var stopButtonForFiveSeatFrame = CGRect(x: 678, y: 315, width: 30, height: 30)

var leaveFirstSeatButtonFrame = CGRect(x: 50, y: 325, width: 30, height: 30)
var leaveSecondSeatButtonFrame = CGRect(x: 190, y: 365, width: 30, height: 30)
var leaveThirdSeatButtonFrame = CGRect(x: 354, y: 375, width: 30, height: 30)
var leaveFirthSeatButtonFrame = CGRect(x: 518, y: 365, width: 30, height: 30)
var leaveFiveSeatButtonFrame = CGRect(x: 658, y: 325, width: 30, height: 30)

var checkDilerSeatLableFrame = CGRect(x: 355, y: 90, width: 25, height: 15)
var checkFirstSeatLableFrame = CGRect(x: 52, y: 245, width: 25, height: 15)
var checkSecondSeatLableFrame = CGRect(x: 192, y: 285, width: 25, height: 15)
var checkThirdSeatLableFrame = CGRect(x: 356, y: 295, width: 25, height: 15)
var checkFourthSeatLableFrame = CGRect(x: 520, y: 285, width: 25, height: 15)
var checkFifthSeatLableFrame = CGRect(x: 660, y: 245, width: 25, height: 15)

var firstSeatFrame = CGRect(x: 40 , y: 265, width: 50, height: 50)
var secondSeatFrame = CGRect(x: 180, y: 305, width: 50, height: 50)
var thirdSeatFrame = CGRect(x: 344, y: 315, width: 50, height: 50)
var firthSeatFrame = CGRect(x: 508, y: 305, width: 50, height: 50)
var fiveSeatFrame = CGRect(x: 648, y: 265, width: 50, height: 50)



