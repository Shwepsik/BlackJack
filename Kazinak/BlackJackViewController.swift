//
//  BlackJackViewController.swift
//  Kazinak
//
//  Created by Valerii on 20.11.2018.
//  Copyright © 2018 Valerii. All rights reserved.
//

import UIKit

class BlackJackViewController: UIViewController {

    
    
    let balancLable = UILabel()
    let myBetLable = UILabel()
    var balance = 10000
    var stavka = 0
    var index = 0
    var checkIndex = 0
    var stopCardButton = 0
    var addCardButton = 0
    var betNumber = 0
    var betImages = 0
    var sum = 0
    var random = Int()
    var myTimer = Timer()
    var time = 15
    let shareCart = UIButton()
    var leftTrigon = UIImageView()
    let rightTrigon = UIImageView()
    var cardNumber = Int()
    var checkLoseNumber = Int()
    var hide = false
    var carts = BlackJackData.cars1
    var checkCarts = BlackJackData.checkCards
    var reverseCard = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSeat()
        seatIsEmpty()
        imageWhenSeatIsEmpty()
        createBalance()
    }
    
    func moveFirstCartForFifthSeat() {
        UIView.animate(withDuration: TimeInterval(BlackJackData.duration)) {
            BlackJackData.cardsImageView[self.cardNumber].frame = BlackJackData.cardsFrame[self.cardNumber]
        }
    }
   
    
    
    func createCheckForDiler() {
        BlackJackData.checkLoseText[checkLoseNumber].frame = BlackJackData.checkLoseFrame[checkLoseNumber]
        BlackJackData.checkLoseText[checkLoseNumber].backgroundColor = UIColor.black
        BlackJackData.checkLoseText[checkLoseNumber].textColor = UIColor.yellow
        BlackJackData.checkLoseText[checkLoseNumber].textAlignment = .center
        view.addSubview(BlackJackData.checkLoseText[checkLoseNumber])
    }
  
    func createTimer() {
        time = 15
        shareCart.setImage(BlackJackData.timeImage[time - 1], for: .normal)
        rightTrigon.image = BlackJackData.rightTrig
        leftTrigon.image = BlackJackData.leftTrig
        myTimer = Timer.scheduledTimer(timeInterval: 1,
                                       target: self,
                                       selector: #selector(updateTimerImage),
                                       userInfo: nil, repeats: true)
    }
    
    @objc func updateTimerImage() {
        if time != 1 {
            time -= 1
            shareCart.setImage(BlackJackData.timeImage[time - 1], for: .normal)
            if time == 5 {
                leftTrigon.image = BlackJackData.leftTrigY
                rightTrigon.image = BlackJackData.rightTrigY
            }
        } else if time == 1 && stavka != 0 && index != 0 {
                myTimer.invalidate()
                shareCartButton()
        } else {
            myTimer.invalidate()
            index = 0
            checkIndex = 0
            BlackJackData.betCalled = false
            turnOffLeaveButtons()
            turnOffSeatButto1n()
            hideBetButtons()
            seatIsEmpty()
            imageWhenSeatIsEmpty()
        }
    }
    
    func removeImage() {
        rightTrigon.image = nil
        leftTrigon.image = nil
    }
    
    func seatIsEmpty() {
        for seat in 0..<5 {
            BlackJackData.allSeats[seat].tag = BlackJackData.seatTag[seat]
            BlackJackData.allSeats[seat].isEnabled = true
            shareCart.removeTarget(nil, action: nil, for: .allEvents)
            removeImage()
        }
    }
    
    func imageWhenSeatIsEmpty() {
        for seat in 0..<5 {
            BlackJackData.allSeats[seat].setImage(BlackJackData.seatButtonImage, for: .normal)
        }
    }
    
    // Кнопки добавить карту
    
    
    func createAddCartForFirstSeatButton() {
        BlackJackData.addCartButtons[checkLoseNumber].frame = BlackJackData.addCartButtonsFrame[checkLoseNumber]
        BlackJackData.addCartButtons[checkLoseNumber].setImage(BlackJackData.seatButtonImage, for: .normal)
        BlackJackData.addCartButtons[checkLoseNumber].tag = BlackJackData.addCartButtonsTag[checkLoseNumber]
        view.addSubview(BlackJackData.addCartButtons[checkLoseNumber])
    }
 
    
    
    // Кнопки хватит

    func createStopForFirstSeat() {
        BlackJackData.stopButtons[checkLoseNumber].frame = BlackJackData.stopCartButtonsFrame[checkLoseNumber]
        BlackJackData.stopButtons[checkLoseNumber].setImage(BlackJackData.stopButtonImage, for: .normal)
        BlackJackData.stopButtons[checkLoseNumber].tag = BlackJackData.stopCartButtonsTag[checkLoseNumber]
        view.addSubview(BlackJackData.stopButtons[checkLoseNumber])
    }
 
    
    // Выключить места
    
    func turnOffSeatButton() {
        for seat in BlackJackData.allSeats {
            seat.isEnabled = false
        }
    }
    
    func turnOffSeatButto1n() {
        for seat in BlackJackData.allSeats {
            seat.isEnabled = true
        }
    }
    
    // Выключить кнопки уйти
    
    func turnOffLeaveButtons() {
        for leaveButtons in BlackJackData.leaveButtons {
            leaveButtons.isHidden = true
        }
    }
    
    func turnOffAddAndStopButtons() {
        hide = !hide
        for addCardButtons in BlackJackData.addCartButtons {
            addCardButtons.isHidden = hide
        }
        for stopCardButtons in BlackJackData.stopButtons {
            stopCardButtons.isHidden = hide
        }
    }
    
    
    // Баланс
    
    func createBalance() {
        balancLable.text = "Баланс \(balance)"
        balancLable.frame = CGRect(x: 10, y: 10, width: 200, height: 31)
        myBetLable.frame = CGRect(x: 200, y: 10, width: 200, height: 31)
        myBetLable.text = "\(stavka)"
        view.addSubview(balancLable)
        view.addSubview(myBetLable)
    }
    
    // Игровые места
    
    func createSeat() {

        for seat in 0..<5 {
                BlackJackData.allSeats[seat].frame = BlackJackData.seatsFrame[seat]
                BlackJackData.allSeats[seat].setImage(BlackJackData.seatButtonImage, for: .normal)
                view.addSubview(BlackJackData.allSeats[seat])
                BlackJackData.allSeats[seat].addTarget(self, action: #selector(holdSeat(send:)), for: .touchUpInside)
                BlackJackData.stopButtons[seat].addTarget(self, action: #selector(stopButton(send:)), for: .touchUpInside)
                BlackJackData.leaveButtons[seat].addTarget(self, action: #selector(leaveFromSeat(send:)), for: .touchUpInside)
        }
       
        BlackJackData.addCartButtonForFirstSeat.addTarget(self, action: #selector(addCartForFirstSeat(send:)), for: .touchUpInside)
        BlackJackData.addCartButtonForSecondSeat.addTarget(self, action: #selector(addCartForSecondSeat(send:)), for: .touchUpInside)
        BlackJackData.addCartButtonForThirdSeat.addTarget(self, action: #selector(addCartForThirdSeat(send:)), for: .touchUpInside)
        BlackJackData.addCartButtonForFirthSeat.addTarget(self, action: #selector(addCartForFirthSeat(send:)), for: .touchUpInside)
        BlackJackData.addCartButtonForFiveSeat.addTarget(self, action: #selector(addCartForFiveSeat(send:)), for: .touchUpInside)
        BlackJackData.stopButtonForSecondSeat.addTarget(self, action: #selector(addCardsWhenSecondStop(send:)), for: .touchUpInside)
        BlackJackData.stopButtonForThirdSeat.addTarget(self, action: #selector(addCardsWhenThirdStop(send:) ), for: .touchUpInside)
        BlackJackData.stopButtonForFirthSeat.addTarget(self, action: #selector(addCardsWhenFirthStop(send:)), for: .touchUpInside)
        BlackJackData.stopButtonForFiveSeat.addTarget(self, action: #selector(addCardsWhenFiveStop(send:)), for: .touchUpInside)
        
    }
    
    // Валидность баланса
    
    func checkBetButton() {
        for bet in 2..<8 {
            if balance < BlackJackData.allBetsTag[bet] * index {
                BlackJackData.allBets[bet].isEnabled = false
            } else if balance > BlackJackData.allBetsTag[bet] * index && index != 0 {
                BlackJackData.allBets[bet].isEnabled = true
            } else if index == 0 {
                BlackJackData.allBets[bet].isEnabled = false
            }
        }
        if balance > stavka * 2 && stavka != 0 {
            BlackJackData.allBets[1].isEnabled = true
        } else {
            BlackJackData.allBets[1].isEnabled = false
        }
    }
    
    // Кнопки ставок
    
    func createBetButtons() {
        BlackJackData.betCalled = true
        for bet in 0..<8 {
            BlackJackData.allBets[bet].frame = BlackJackData.betFrames[bet]
            BlackJackData.allBets[bet].setImage(BlackJackData.allBetsImage[bet], for: .normal)
            BlackJackData.allBets[bet].tag = BlackJackData.allBetsTag[bet]
            view.addSubview(BlackJackData.allBets[bet])
        }
        shareCart.frame = CGRect(x: 344, y: 167, width: 50, height: 50)
        leftTrigon.frame = CGRect(x: 206, y: 167, width: 130, height: 50)
        rightTrigon.frame = CGRect(x: 400, y: 167, width: 130, height: 50)
        view.addSubview(rightTrigon)
        view.addSubview(leftTrigon)
        view.addSubview(shareCart)

        checkBetButton()
        
        BlackJackData.firstBet.addTarget(self, action: #selector(pressBet(send:)), for: .touchUpInside)
        BlackJackData.secondBet.addTarget(self, action: #selector(pressBet(send:)), for: .touchUpInside)
        BlackJackData.thirdBet.addTarget(self, action: #selector(pressBet(send:)), for: .touchUpInside)
        BlackJackData.firthBet.addTarget(self, action: #selector(pressBet(send:)), for: .touchUpInside)
        BlackJackData.fiveBet.addTarget(self, action: #selector(pressBet(send:)), for: .touchUpInside)
        BlackJackData.sixBet.addTarget(self, action: #selector(pressBet(send:)), for: .touchUpInside)
        BlackJackData.backButton.addTarget(self, action: #selector(backButton(send:)), for: .touchUpInside)
        BlackJackData.multiply.addTarget(self, action: #selector(multiplyButton(send:)), for: .touchUpInside)
    }
    
    //  Кнопка Раздать карты
    
    func shareCartButton() {
        shareCart.setImage(BlackJackData.seatButtonImage, for: .normal)
        shareCart.addTarget(self, action: #selector(shareCart(send:)), for: .touchUpInside)
    }

    // Кнопки уйти
    var leaveButton = 0
    
    func createLeaveButtonForFirstSeat() {
        BlackJackData.leaveButtons[leaveButton].frame = BlackJackData.leaveButtonsFrame[leaveButton]
        BlackJackData.leaveButtons[leaveButton].setImage(BlackJackData.leaveSeatImage, for: .normal)
        BlackJackData.leaveButtons[leaveButton].tag = BlackJackData.leaveButtonsTag[leaveButton]
        view.addSubview(BlackJackData.leaveButtons[leaveButton])
        BlackJackData.leaveButtons[leaveButton].isHidden = false
    }
    
    
    func reverseSecondCard() {
        if index == 0 {
            cardNumber = 46
            checkLoseNumber = 5
            random = Int(arc4random_uniform(UInt32(BlackJackData.cars1.count)))
            secondCartForDilerSeat.image = BlackJackData.cars1[random]
            UIView.transition(with: secondCartForDilerSeat, duration: TimeInterval(BlackJackData.duration), options: .transitionFlipFromLeft, animations: nil, completion: nil)
            forFifthSeat()
            checkLoseDiler()
        }
    }
    func checkStopDilerSeat() {
        if BlackJackData.checkLose[5] < 17 && cardNumber >= 46 {
            cardNumber += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.duration), execute: {
                self.addFirstCartForFifthSeat()
                self.checkLoseDiler()
            })
        } else if cardNumber >= 46 {
            DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.duration), execute: {
                self.checkLoseWin()
            })
        }
    }
    
    
    func checkLoseWin() {
        clearImage()
        for check in 0...4 {
            if BlackJackData.checkLose[check] > 21  {
                BlackJackData.allSeats[check].setImage(BlackJackData.bust, for: .normal)
            } else if BlackJackData.checkLose[check] > BlackJackData.checkLose[5] {
                BlackJackData.allSeats[check].setImage(BlackJackData.win, for: .normal)
                moneyForWinner()
            } else if BlackJackData.checkLose[5] > 21 && BlackJackData.checkLose[check] > 0 {
                BlackJackData.allSeats[check].setImage(BlackJackData.win, for: .normal)
                moneyForWinner()
            } else if BlackJackData.checkLose[check] == BlackJackData.checkLose[5] {
                BlackJackData.allSeats[check].setImage(BlackJackData.draw, for: .normal)
                moneyForWinner()
            } else if BlackJackData.checkLose[check] < BlackJackData.checkLose[5] && BlackJackData.checkLose[check] > 0 {
                BlackJackData.allSeats[check].setImage(BlackJackData.lose, for: .normal)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(10), execute: {
            self.stavka = 0
            self.createBalance()
            self.clearGame()
        })
    }
    
    func moneyForWinner() {
        sum += 1
        balance += sum * eachSeatBet * 2
        sum = 0
    }

    func clearGame() {
        seatIsEmpty()
        imageWhenSeatIsEmpty()
        clearCheckLose()
        BlackJackData.betCalled = false
        removeCards()
        checkIndex = 0
        eachSeatBet = 0
        BlackJackData.cars1 = carts
        BlackJackData.checkCards = checkCarts
    }
    
    func clearImage() {
        for image in 0..<5 {
            BlackJackData.betImageView[image].image = nil
            BlackJackData.betImageViewCopy[image].image = nil
            BlackJackData.addCartButtons[image].removeFromSuperview()
            BlackJackData.addCartButtons[image].isEnabled = true
            BlackJackData.stopButtons[image].removeFromSuperview()
            BlackJackData.stopButtons[image].isEnabled = true
            BlackJackData.seatTagNumber[image] = 1
        }
    }
    
    func clearCheckLose() {
        for text in 0..<6 {
            BlackJackData.checkLoseText[text].backgroundColor = UIColor.clear
            BlackJackData.checkLoseText[text].text = ""
            BlackJackData.checkLose[text] = 0
        }
    }
    
    func removeCards() {
        for card in 0..<52 {
            BlackJackData.cardsImageView[card].image = nil
        }
    }
    
    func addSecondCartForDilerSeat() {
        secondCartForDilerSeat.image = BlackJackData.backCardImage
        secondCartForDilerSeat.frame = BlackJackData.frameFrom
        view.addSubview(secondCartForDilerSeat)
        moveFirstCartForFifthSeat()
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.duration), execute: {
            self.turnOffAddAndStopButtons()
        })
    }
    
 
    @objc func stopButton(send : UIButton) {
        switch send.tag {
        case BlackJackData.stopForFirstSeat:
            BlackJackData.addCartButtonForFirstSeat.isEnabled = false
            BlackJackData.stopButtonForFirstSeat.isEnabled = false
            BlackJackData.stopButtonForFirstSeat.tag = BlackJackData.stopForFirstSeatIsOn
            index -= 1
            reverseSecondCard()
        case BlackJackData.stopForSecondSeat:
            BlackJackData.addCartButtonForSecondSeat.isEnabled = false
            BlackJackData.stopButtonForSecondSeat.isEnabled = false
            BlackJackData.stopButtonForSecondSeat.tag = BlackJackData.stopForSecondSeatIsOn
            index -= 1
            reverseSecondCard()
        case BlackJackData.stopForThirdSeat:
            BlackJackData.addCartButtonForThirdSeat.isEnabled = false
            BlackJackData.stopButtonForThirdSeat.isEnabled = false
            BlackJackData.stopButtonForThirdSeat.tag = BlackJackData.stopForThirdSeatIsOn
            index -= 1
            reverseSecondCard()
        case BlackJackData.stopForFourthSeat:
            BlackJackData.addCartButtonForFirthSeat.isEnabled = false
            BlackJackData.stopButtonForFirthSeat.isEnabled = false
            BlackJackData.stopButtonForFirthSeat.tag = BlackJackData.stopForFourthSeatIsOn
            index -= 1
            reverseSecondCard()
        case BlackJackData.stopForFifthSeat:
            BlackJackData.addCartButtonForFiveSeat.isEnabled = false
            BlackJackData.stopButtonForFiveSeat.isEnabled = false
            BlackJackData.stopButtonForFiveSeat.tag = BlackJackData.stopForFifthSeatIsOn
            index -= 1
            reverseSecondCard()
        default:
            break
        }
    }
    
    
    func forFifthSeat() {
        //print(checkLoseNumber)
        BlackJackData.checkLose[checkLoseNumber] += Int(BlackJackData.checkCards[self.random])!
        print(BlackJackData.checkLose[checkLoseNumber])
        BlackJackData.checkCards.remove(at: self.random)
        BlackJackData.cars1.remove(at: Int(self.random))
    }

    func addFirstCartForFifthSeat() {
        BlackJackData.cardsImageView[cardNumber].frame = BlackJackData.frameFrom
        view.addSubview(BlackJackData.cardsImageView[cardNumber])
        random = Int(arc4random_uniform(UInt32(BlackJackData.cars1.count)))
        BlackJackData.cardsImageView[cardNumber].image = BlackJackData.cars1[random]
        forFifthSeat()
        moveFirstCartForFifthSeat()
    }
    
    func makeFirstGreatAgain() {
        BlackJackData.addCartButtons[4].tag = 150
        BlackJackData.stopButtons[4].tag = 150
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(1.1), execute: {
            BlackJackData.addCartButtons[4].tag = BlackJackData.addCardForSeatsOne[BlackJackData.firstTagNumber]
            BlackJackData.stopButtons[4].tag = BlackJackData.stopCartButtonsTag[4]
            BlackJackData.seatTagNumber[4] += 1
        })
    }
    
    @objc func addCartForFirstSeat(send : UIButton) {
        switch send.tag {
        case BlackJackData.addCartForFirstSeat:
            checkIndex = 0
            checkAddCartForFirstSeat()
        case BlackJackData.addFourthCartForFirstSeat:
            cardNumber = 39
            checkLoseNumber = 4
            addFirstCartForFifthSeat()
            checkLoseFirst()
            makeFirstGreatAgain()
        case BlackJackData.addFifthCartForFirstSeat:
            cardNumber = 40
            checkLoseNumber = 4
            addFirstCartForFifthSeat()
            checkLoseFirst()
            makeFirstGreatAgain()
        case BlackJackData.addSixtCartForFirstSeat:
            cardNumber = 41
            checkLoseNumber = 4
            addFirstCartForFifthSeat()
            checkLoseFirst()
            makeFirstGreatAgain()
        case BlackJackData.addSeventhCartForFirstSeat:
            cardNumber = 42
            checkLoseNumber = 4
            addFirstCartForFifthSeat()
            checkLoseFirst()
            makeFirstGreatAgain()
        case BlackJackData.addEighthCartForFirstSeat:
            cardNumber = 43
            checkLoseNumber = 4
            addFirstCartForFifthSeat()
            checkLoseFirst()
            makeFirstGreatAgain()
        case BlackJackData.addNinthCartForFirstSeat:
            cardNumber = 44
            checkLoseNumber = 4
            addFirstCartForFifthSeat()
            checkLoseFirst()
            makeFirstGreatAgain()
            BlackJackData.addCartButtonForFirstSeat.isHidden = true
        default:
            break
        }
    }
    

    func checkAddCartForFirstSeat() {
        if BlackJackData.secondSeat.tag == BlackJackData.secondSeatIsEmpty || BlackJackData.stopButtonForSecondSeat.tag == BlackJackData.stopForSecondSeatIsOn || BlackJackData.checkLose[3] > 21 {
            checkIndex += 1
        }
        if BlackJackData.thirdSeat.tag == BlackJackData.thirdSeatIsEmpty || BlackJackData.stopButtonForThirdSeat.tag == BlackJackData.stopForThirdSeatIsOn || BlackJackData.checkLose[2] > 21 {
            checkIndex += 1
        }
        if BlackJackData.firthSeat.tag == BlackJackData.fourthSeatIsEmpty || BlackJackData.stopButtonForFirthSeat.tag == BlackJackData.stopForFourthSeatIsOn || BlackJackData.checkLose[1] > 21 {
            checkIndex += 1
        }
        if BlackJackData.fiveSeat.tag == BlackJackData.fifthSeatIsEmpty || BlackJackData.stopButtonForFiveSeat.tag == BlackJackData.stopForFifthSeatIsOn || BlackJackData.checkLose[0] > 21 {
            checkIndex += 1
        }
        if checkIndex == 4 {
            cardNumber = 38
            checkLoseNumber = 4
            addFirstCartForFifthSeat()
            checkLoseFirst()
            makeFirstGreatAgain()
        } else {
            BlackJackData.addCartButtonForFirstSeat.tag = BlackJackData.firstSeatWaitingCart
            BlackJackData.addCartButtonForFirstSeat.isEnabled = false
            BlackJackData.stopButtonForFirstSeat.isEnabled = false
        }
    }
    
    func makeSecondGreatAgain() {
        BlackJackData.addCartButtons[3].tag = 150
        BlackJackData.stopButtons[3].tag = 150
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(1.1), execute: {
            BlackJackData.addCartButtons[3].tag = BlackJackData.addCardForSeatsTwo[BlackJackData.secondTagNumber]
            BlackJackData.stopButtons[3].tag = BlackJackData.stopCartButtonsTag[3]
            BlackJackData.seatTagNumber[3] += 1
        })
    }
    
    @objc func addCartForSecondSeat(send : UIButton) {
        switch send.tag {
        case BlackJackData.addCartForSecondSeat:
            checkIndex = 0
            checkAddCartForSecondSeat()
        case BlackJackData.addFourthCartForSecondSeat:
            cardNumber = 30
            checkLoseNumber = 3
            addFirstCartForFifthSeat()
            checkLoseSecond()
            makeSecondGreatAgain()
        case BlackJackData.addFifthCartForSecondSeat:
            cardNumber = 31
            checkLoseNumber = 3
            addFirstCartForFifthSeat()
            checkLoseSecond()
            makeSecondGreatAgain()
        case BlackJackData.addSixtCartForSecondSeat:
            cardNumber = 32
            checkLoseNumber = 3
            addFirstCartForFifthSeat()
            checkLoseSecond()
            makeSecondGreatAgain()
        case BlackJackData.addSeventhCartForSecondSeat:
            cardNumber = 33
            checkLoseNumber = 3
            addFirstCartForFifthSeat()
            checkLoseSecond()
            makeSecondGreatAgain()
        case BlackJackData.addEighthCartForSecondSeat:
            cardNumber = 34
            checkLoseNumber = 3
            addFirstCartForFifthSeat()
            checkLoseSecond()
            makeSecondGreatAgain()
        case BlackJackData.addNinthCartForSecondSeat:
            cardNumber = 35
            checkLoseNumber = 3
            addFirstCartForFifthSeat()
            checkLoseSecond()
            makeSecondGreatAgain()
            BlackJackData.addCartButtonForSecondSeat.isHidden = true
        default:
            break
        }
    }
    
    func checkAddCartForSecondSeat() {
        if BlackJackData.fiveSeat.tag == BlackJackData.fifthSeatIsEmpty || BlackJackData.stopButtonForFiveSeat.tag == BlackJackData.stopForFifthSeatIsOn || BlackJackData.checkLose[0] > 21 {
            checkIndex += 1
        }
        if BlackJackData.firthSeat.tag == BlackJackData.fourthSeatIsEmpty || BlackJackData.stopButtonForFirthSeat.tag == BlackJackData.stopForFourthSeatIsOn || BlackJackData.checkLose[1] > 21 {
            checkIndex += 1
        }
        if BlackJackData.thirdSeat.tag == BlackJackData.thirdSeatIsEmpty || BlackJackData.stopButtonForThirdSeat.tag == BlackJackData.stopForThirdSeatIsOn || BlackJackData.checkLose[2] > 21 {
            checkIndex += 1
        }
        if checkIndex == 3 {
            cardNumber = 29
            checkLoseNumber = 3
            addFirstCartForFifthSeat()
            checkLoseSecond()
            makeSecondGreatAgain()
        } else {
            BlackJackData.addCartButtonForSecondSeat.tag = BlackJackData.secondSeatWaitingCart
            BlackJackData.addCartButtonForSecondSeat.isEnabled = false
            BlackJackData.stopButtonForSecondSeat.isEnabled = false
        }
    }
    
    func makeThirdGreatAgain() {
        BlackJackData.addCartButtons[2].tag = 150
        BlackJackData.stopButtons[2].tag = 150
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(1.1), execute: {
            BlackJackData.addCartButtons[2].tag = BlackJackData.addCardForSeatsThree[BlackJackData.thirdTagNumber]
            BlackJackData.stopButtons[2].tag = BlackJackData.stopCartButtonsTag[2]
            BlackJackData.seatTagNumber[2] += 1
        })
    }
    
    @objc func addCartForThirdSeat(send : UIButton) {
        switch send.tag {
        case BlackJackData.addCartForThirdSeat:
            checkIndex = 0
            checkAddCartForThirdSeat()
        case BlackJackData.addFourthCartForThirdSeat:
            cardNumber = 21
            checkLoseNumber = 2
            addFirstCartForFifthSeat()
            checkLoseThird()
            makeThirdGreatAgain()
        case BlackJackData.addFifthCartForThirdSeat:
            cardNumber = 22
            checkLoseNumber = 2
            addFirstCartForFifthSeat()
            checkLoseThird()
            makeThirdGreatAgain()
        case BlackJackData.addSixtCartForThirdSeat:
            cardNumber = 23
            checkLoseNumber = 2
            addFirstCartForFifthSeat()
            checkLoseThird()
            makeThirdGreatAgain()
        case BlackJackData.addSeventhCartForThirdSeat:
            cardNumber = 24
            checkLoseNumber = 2
            addFirstCartForFifthSeat()
            checkLoseThird()
            makeThirdGreatAgain()
        case BlackJackData.addEighthCartThirdSeat:
            cardNumber = 25
            checkLoseNumber = 2
            addFirstCartForFifthSeat()
            checkLoseThird()
            makeThirdGreatAgain()
        case BlackJackData.addNinthCartForThirdSeat:
            cardNumber = 26
            checkLoseNumber = 2
            addFirstCartForFifthSeat()
            checkLoseThird()
            makeThirdGreatAgain()
            BlackJackData.addCartButtonForThirdSeat.isHidden = true
        default:
            break
        }
    }
    
    
    func checkAddCartForThirdSeat() {
        if BlackJackData.fiveSeat.tag == BlackJackData.fifthSeatIsEmpty || BlackJackData.stopButtonForFiveSeat.tag == BlackJackData.stopForFifthSeatIsOn || BlackJackData.checkLose[0] > 21 {
            checkIndex += 1
        }
        if BlackJackData.firthSeat.tag == BlackJackData.fourthSeatIsEmpty || BlackJackData.stopButtonForFirthSeat.tag == BlackJackData.stopForFourthSeatIsOn || BlackJackData.checkLose[1] > 21 {
            checkIndex += 1
        }
        if checkIndex == 2 {
            cardNumber = 20
            checkLoseNumber = 2
            addFirstCartForFifthSeat()
            checkLoseThird()
            makeThirdGreatAgain()
        }  else {
            BlackJackData.addCartButtonForThirdSeat.tag = BlackJackData.thirdSeatWaitingCart
            BlackJackData.addCartButtonForThirdSeat.isEnabled = false
            BlackJackData.stopButtonForThirdSeat.isEnabled = false
        }
    }
    
    func makeFourthGreatAgain() {
        BlackJackData.addCartButtons[1].tag = 150
        BlackJackData.stopButtons[1].tag = 150
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(1.1), execute: {
            BlackJackData.addCartButtons[1].tag = BlackJackData.addCardForSeatsFour[BlackJackData.fourthTagNumber]
            BlackJackData.stopButtons[1].tag = BlackJackData.stopCartButtonsTag[1]
            BlackJackData.seatTagNumber[1] += 1
        })
    }
    
    
    @objc func addCartForFirthSeat(send : UIButton) {
        switch send.tag {
        case BlackJackData.addCartForFourthSeat:
            if BlackJackData.fiveSeat.tag == BlackJackData.fifthSeatIsEmpty || BlackJackData.checkLose[0] > 21 || BlackJackData.stopButtonForFiveSeat.tag == BlackJackData.stopForFifthSeatIsOn {
                cardNumber = 11
                checkLoseNumber = 1
                addFirstCartForFifthSeat()
                checkLoseFourth()
                makeFourthGreatAgain()
            } else {
                BlackJackData.addCartButtonForFirthSeat.tag = BlackJackData.fourthSeatWaitingCart
                BlackJackData.addCartButtonForFirthSeat.isEnabled = false
                BlackJackData.stopButtonForFirthSeat.isEnabled = false
            }
        case BlackJackData.addFourthCartForFourthSeat:
            cardNumber = 12
            checkLoseNumber = 1
            addFirstCartForFifthSeat()
            checkLoseFourth()
            makeFourthGreatAgain()
        case BlackJackData.addFifthCartForFourthSeat:
            cardNumber = 13
            checkLoseNumber = 1
            addFirstCartForFifthSeat()
            checkLoseFourth()
            makeFourthGreatAgain()
        case BlackJackData.addSixtCartForFourthSeat:
            cardNumber = 14
            checkLoseNumber = 1
            addFirstCartForFifthSeat()
            checkLoseFourth()
            makeFourthGreatAgain()
        case BlackJackData.addSeventhCartForFourthSeat:
            cardNumber = 15
            checkLoseNumber = 1
            addFirstCartForFifthSeat()
            checkLoseFourth()
            makeFourthGreatAgain()
        case BlackJackData.addEighthCartFourthSeat:
            cardNumber = 16
            checkLoseNumber = 1
            addFirstCartForFifthSeat()
            checkLoseFourth()
            makeFourthGreatAgain()
        case BlackJackData.addNinthCartForFourthSeat:
            cardNumber = 17
            checkLoseNumber = 1
            addFirstCartForFifthSeat()
            checkLoseFourth()
            makeFourthGreatAgain()
            BlackJackData.addCartButtonForFirthSeat.isHidden = true
        default:
            break
        }
    }
    
    func makeFiveGreatAgain() {
        BlackJackData.addCartButtons[0].tag = 150
        BlackJackData.stopButtons[0].tag = 150
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(1.1), execute: {
            BlackJackData.addCartButtons[0].tag = BlackJackData.addCardForSeatsFive[BlackJackData.fiveTagNumber]
            BlackJackData.stopButtons[0].tag = BlackJackData.stopCartButtonsTag[0]
            BlackJackData.seatTagNumber[0] += 1
        })
    }
    
    @objc func addCartForFiveSeat(send : UIButton) {
        switch send.tag {
        case BlackJackData.addCartForFifthSeat:
            cardNumber = 2
            checkLoseNumber = 0
            addFirstCartForFifthSeat()
            checkLoseFifth()
            makeFiveGreatAgain()
        case BlackJackData.addFourthCartForFifthSeat:
            cardNumber = 3
            checkLoseNumber = 0
            addFirstCartForFifthSeat()
            checkLoseFifth()
            makeFiveGreatAgain()
        case BlackJackData.addFifthCartForFifthSeat:
            cardNumber = 4
            checkLoseNumber = 0
            addFirstCartForFifthSeat()
            checkLoseFifth()
            makeFiveGreatAgain()
        case BlackJackData.addSixtCartForFifthSeat:
            cardNumber = 5
            checkLoseNumber = 0
            addFirstCartForFifthSeat()
            checkLoseFifth()
            makeFiveGreatAgain()
        case BlackJackData.addSeventhCartForFifthSeat:
            cardNumber = 6
            checkLoseNumber = 0
            addFirstCartForFifthSeat()
            checkLoseFifth()
            makeFiveGreatAgain()
        case BlackJackData.addEighthCartForFifthSeat:
            cardNumber = 7
            checkLoseNumber = 0
            addFirstCartForFifthSeat()
            checkLoseFifth()
            makeFiveGreatAgain()
        case BlackJackData.addNinthCartForFifthSeat:
            cardNumber = 8
            checkLoseNumber = 0
            addFirstCartForFifthSeat()
            checkLoseFifth()
            makeFiveGreatAgain()
            BlackJackData.addCartButtonForFiveSeat.isHidden = true
        default:
            break
        }
    }
    
    func checkThirdSeatForFiveStop() {
        if BlackJackData.firthSeat.tag == BlackJackData.fourthSeatIsEmpty || BlackJackData.stopButtonForFirthSeat.tag == BlackJackData.stopForFourthSeatIsOn || BlackJackData.checkLose[1] > 21 {
            cardNumber = 20
            checkLoseNumber = 2
            addFirstCartForFifthSeat()
            checkLoseThird()
            makeThirdGreatAgain()
            BlackJackData.addCartButtonForThirdSeat.isEnabled = true
            BlackJackData.stopButtonForThirdSeat.isEnabled = true
        }
    }
    
    func checkThirdSeatForFirthStop() {
        if BlackJackData.fiveSeat.tag == BlackJackData.fifthSeatIsEmpty || BlackJackData.stopButtonForFiveSeat.tag == BlackJackData.stopForFifthSeatIsOn || BlackJackData.checkLose[0] > 21 {
            cardNumber = 20
            checkLoseNumber = 2
            addFirstCartForFifthSeat()
            checkLoseThird()
            makeThirdGreatAgain()
            BlackJackData.addCartButtonForThirdSeat.isEnabled = true
            BlackJackData.stopButtonForThirdSeat.isEnabled = true
        }
    }
    
    func checkSecondSeatForFiveStop() {
        if BlackJackData.firthSeat.tag == BlackJackData.fourthSeatIsEmpty || BlackJackData.stopButtonForFirthSeat.tag == BlackJackData.stopForFourthSeatIsOn || BlackJackData.checkLose[1] > 21 {
            checkIndex += 1
        }
        if BlackJackData.thirdSeat.tag == BlackJackData.thirdSeatIsEmpty || BlackJackData.stopButtonForThirdSeat.tag == BlackJackData.stopForThirdSeatIsOn || BlackJackData.checkLose[2] > 21  {
            checkIndex += 1
        }
        if checkIndex == 2 {
            cardNumber = 29
            checkLoseNumber = 3
            addFirstCartForFifthSeat()
            checkLoseSecond()
            makeSecondGreatAgain()
            BlackJackData.addCartButtonForSecondSeat.isEnabled = true
            BlackJackData.stopButtonForSecondSeat.isEnabled = true
        }
    }
    
    func checkSecondSeatForFirthStop() {
        if BlackJackData.fiveSeat.tag == BlackJackData.fifthSeatIsEmpty || BlackJackData.stopButtonForFiveSeat.tag == BlackJackData.stopForFifthSeatIsOn || BlackJackData.checkLose[0] > 21 {
            checkIndex += 1
        }
        if BlackJackData.thirdSeat.tag == BlackJackData.thirdSeatIsEmpty || BlackJackData.stopButtonForThirdSeat.tag == BlackJackData.stopForThirdSeatIsOn || BlackJackData.checkLose[2] > 21 {
            checkIndex += 1
        }
        if checkIndex == 2 {
            cardNumber = 29
            checkLoseNumber = 3
            addFirstCartForFifthSeat()
            checkLoseSecond()
            makeSecondGreatAgain()
            BlackJackData.addCartButtonForSecondSeat.isEnabled = true
            BlackJackData.stopButtonForSecondSeat.isEnabled = true
        }
    }
    
    func checkSecondSeatForThirdStop() {
        if BlackJackData.fiveSeat.tag == BlackJackData.fifthSeatIsEmpty || BlackJackData.stopButtonForFiveSeat.tag == BlackJackData.stopForFifthSeatIsOn || BlackJackData.checkLose[0] > 21 {
            checkIndex += 1
        }
        if BlackJackData.firthSeat.tag == BlackJackData.fourthSeatIsEmpty || BlackJackData.stopButtonForFirthSeat.tag == BlackJackData.stopForFourthSeatIsOn || BlackJackData.checkLose[1] > 21 {
            checkIndex += 1
        }
        if checkIndex == 2 {
            cardNumber = 29
            checkLoseNumber = 3
            addFirstCartForFifthSeat()
            checkLoseSecond()
            makeSecondGreatAgain()
            BlackJackData.addCartButtonForSecondSeat.isEnabled = true
            BlackJackData.stopButtonForSecondSeat.isEnabled = true
        }
    }
    
    func checkFirstSeatForFiveStop() {
        if BlackJackData.firthSeat.tag == BlackJackData.fourthSeatIsEmpty || BlackJackData.stopButtonForFirthSeat.tag == BlackJackData.stopForFourthSeatIsOn || BlackJackData.checkLose[1] > 21 {
            checkIndex += 1
        }
        if BlackJackData.thirdSeat.tag == BlackJackData.thirdSeatIsEmpty || BlackJackData.stopButtonForThirdSeat.tag == BlackJackData.stopForThirdSeatIsOn || BlackJackData.checkLose[2] > 21 {
            checkIndex += 1
        }
        if BlackJackData.secondSeat.tag == BlackJackData.secondSeatIsEmpty || BlackJackData.stopButtonForSecondSeat.tag == BlackJackData.stopForSecondSeatIsOn || BlackJackData.checkLose[3] > 21  {
            checkIndex += 1
        }
        if checkIndex == 3 {
            cardNumber = 38
            checkLoseNumber = 4
            addFirstCartForFifthSeat()
            checkLoseFirst()
            makeFirstGreatAgain()
            BlackJackData.addCartButtonForFirstSeat.isEnabled = true
            BlackJackData.stopButtonForFirstSeat.isEnabled = true
        }
    }
    
    func checkFirstSeatForFirthStop() {
        if BlackJackData.fiveSeat.tag == BlackJackData.fifthSeatIsEmpty || BlackJackData.stopButtonForFiveSeat.tag == BlackJackData.stopForFifthSeatIsOn || BlackJackData.checkLose[0] > 21 {
            checkIndex += 1
        }
        if BlackJackData.thirdSeat.tag == BlackJackData.thirdSeatIsEmpty || BlackJackData.stopButtonForThirdSeat.tag == BlackJackData.stopForThirdSeatIsOn || BlackJackData.checkLose[2] > 21 {
            checkIndex += 1
        }
        if BlackJackData.secondSeat.tag == BlackJackData.secondSeatIsEmpty || BlackJackData.stopButtonForSecondSeat.tag == BlackJackData.stopForSecondSeatIsOn || BlackJackData.checkLose[3] > 21 {
            checkIndex += 1
        }
        if checkIndex == 3 {
            cardNumber = 38
            checkLoseNumber = 4
            addFirstCartForFifthSeat()
            checkLoseFirst()
            makeFirstGreatAgain()
            BlackJackData.addCartButtonForFirstSeat.isEnabled = true
            BlackJackData.stopButtonForFirstSeat.isEnabled = true
        }
    }
    
    func checkFirstSeatForSecondStop() {
        if BlackJackData.fiveSeat.tag == BlackJackData.fifthSeatIsEmpty || BlackJackData.stopButtonForFiveSeat.tag == BlackJackData.stopForFifthSeatIsOn || BlackJackData.checkLose[0] > 21 {
            checkIndex += 1
        }
        if BlackJackData.firthSeat.tag == BlackJackData.fourthSeatIsEmpty || BlackJackData.stopButtonForFirthSeat.tag == BlackJackData.stopForFourthSeatIsOn || BlackJackData.checkLose[1] > 21 {
            checkIndex += 1
        }
        if BlackJackData.thirdSeat.tag == BlackJackData.thirdSeatIsEmpty || BlackJackData.stopButtonForThirdSeat.tag == BlackJackData.stopForThirdSeatIsOn || BlackJackData.checkLose[2] > 21 {
            checkIndex += 1
        }
        if checkIndex == 3 {
            cardNumber = 38
            checkLoseNumber = 4
            addFirstCartForFifthSeat()
            checkLoseFirst()
            makeFirstGreatAgain()
            BlackJackData.addCartButtonForFirstSeat.isEnabled = true
            BlackJackData.stopButtonForFirstSeat.isEnabled = true
        }
    }
    
    func checkFirstSeatForThirdStop() {
        if BlackJackData.fiveSeat.tag == BlackJackData.fifthSeatIsEmpty || BlackJackData.stopButtonForFiveSeat.tag == BlackJackData.stopForFifthSeatIsOn || BlackJackData.checkLose[0] > 21 {
            checkIndex += 1
        }
        if BlackJackData.firthSeat.tag == BlackJackData.fourthSeatIsEmpty || BlackJackData.stopButtonForFirthSeat.tag == BlackJackData.stopForFourthSeatIsOn || BlackJackData.checkLose[1] > 21 {
            checkIndex += 1
        }
        if BlackJackData.thirdSeat.tag == BlackJackData.thirdSeatIsEmpty || BlackJackData.stopButtonForThirdSeat.tag == BlackJackData.stopForThirdSeatIsOn || BlackJackData.checkLose[2] > 21 {
            checkIndex += 1
        }
        if BlackJackData.secondSeat.tag == BlackJackData.secondSeatIsEmpty || BlackJackData.stopButtonForSecondSeat.tag == BlackJackData.stopForSecondSeatIsOn || BlackJackData.checkLose[3] > 21 {
            checkIndex += 1
        }
        if checkIndex == 4 {
            cardNumber = 38
            checkLoseNumber = 4
            addFirstCartForFifthSeat()
            checkLoseFirst()
            makeFirstGreatAgain()
            BlackJackData.addCartButtonForFirstSeat.isEnabled = true
            BlackJackData.stopButtonForFirstSeat.isEnabled = true
        }
    }
    
    func addCardWhenFiveStop() {
        if BlackJackData.addCartButtonForFirthSeat.tag == BlackJackData.fourthSeatWaitingCart && BlackJackData.stopButtonForFiveSeat.tag == BlackJackData.stopForFifthSeatIsOn {
            cardNumber = 11
            checkLoseNumber = 1
            addFirstCartForFifthSeat()//dadasdas
            checkLoseFourth()
            makeFourthGreatAgain()
            BlackJackData.addCartButtonForFirthSeat.isEnabled = true
            BlackJackData.stopButtonForFirthSeat.isEnabled = true
        } else if BlackJackData.addCartButtonForThirdSeat.tag == BlackJackData.thirdSeatWaitingCart && BlackJackData.stopButtonForFiveSeat.tag == BlackJackData.stopForFifthSeatIsOn {
            checkThirdSeatForFiveStop()
        } else if BlackJackData.addCartButtonForSecondSeat.tag == BlackJackData.secondSeatWaitingCart && BlackJackData.stopButtonForFiveSeat.tag == BlackJackData.stopForFifthSeatIsOn {
            checkIndex = 0
            checkSecondSeatForFiveStop()
        } else if BlackJackData.addCartButtonForFirstSeat.tag == BlackJackData.firstSeatWaitingCart && BlackJackData.stopButtonForFiveSeat.tag == BlackJackData.stopForFifthSeatIsOn  {
            checkIndex = 0
            checkFirstSeatForFiveStop()
        }
    }
    
    @objc func addCardsWhenFiveStop(send : UIButton) {
        addCardWhenFiveStop()
    }
    
    func addCardWhenFourthStop() {
        if BlackJackData.addCartButtonForThirdSeat.tag == BlackJackData.thirdSeatWaitingCart && BlackJackData.stopButtonForFirthSeat.tag == BlackJackData.stopForFourthSeatIsOn {
            checkThirdSeatForFirthStop()
        } else if BlackJackData.addCartButtonForSecondSeat.tag == BlackJackData.secondSeatWaitingCart && BlackJackData.stopButtonForFirthSeat.tag == BlackJackData.stopForFourthSeatIsOn   {
            checkIndex = 0
            checkSecondSeatForFirthStop()
        } else if BlackJackData.addCartButtonForFirstSeat.tag == BlackJackData.firstSeatWaitingCart && BlackJackData.stopButtonForFirthSeat.tag == BlackJackData.stopForFourthSeatIsOn  {
            checkIndex = 0
            checkFirstSeatForFirthStop()
        }
    }
    
    @objc func addCardsWhenFirthStop(send : UIButton) {
        addCardWhenFourthStop()
    }
    
    func addCardWhenSecondStop() {
        if BlackJackData.addCartButtonForFirstSeat.tag == BlackJackData.firstSeatWaitingCart && BlackJackData.stopButtonForSecondSeat.tag == BlackJackData.stopForSecondSeatIsOn  {
            checkIndex = 0
            checkFirstSeatForSecondStop()
        }
    }
    
    @objc func addCardsWhenSecondStop(send : UIButton) {
        addCardWhenSecondStop()
    }
    
    func addCardWhenThirdStop() {
        if BlackJackData.addCartButtonForSecondSeat.tag == BlackJackData.secondSeatWaitingCart && BlackJackData.stopButtonForThirdSeat.tag == BlackJackData.stopForThirdSeatIsOn  {
            checkIndex = 0
            checkSecondSeatForThirdStop()
        } else if BlackJackData.addCartButtonForFirstSeat.tag == BlackJackData.firstSeatWaitingCart && BlackJackData.stopButtonForThirdSeat.tag == BlackJackData.stopForThirdSeatIsOn   {
            checkIndex = 0
            checkFirstSeatForThirdStop()
        }
    }
    
    @objc func addCardsWhenThirdStop(send : UIButton) {
        addCardWhenThirdStop()
    }

    
    func hideBetButtons() {
        for bet in 0..<8 {
            BlackJackData.allBets[bet].isHidden = true
        }
        shareCart.isHidden = true
        BlackJackData.statusBetButtons = false
    }
    
    
    func showBetButtons() {
        for bet in 0..<8 {
            BlackJackData.allBets[bet].isHidden = false
        }
        shareCart.isHidden = false
        BlackJackData.statusBetButtons = true
    }
    
    func checkLoseFifthSeat() {
        //print(checkLoseNumber)
        if BlackJackData.checkLose[checkLoseNumber] > 21 {
            print(BlackJackData.checkLose[checkLoseNumber])
            BlackJackData.addCartButtons[checkLoseNumber].isEnabled = false
            BlackJackData.stopButtons[checkLoseNumber].isEnabled = false
            BlackJackData.stopButtons[checkLoseNumber].tag = BlackJackData.stopButtonIsOn[checkLoseNumber]
            index -= 1
        }
    }
    
    func checkLoseFifth() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.duration), execute: {
            BlackJackData.checkLoseText[0].text = String(BlackJackData.checkLose[0])
            self.checkLoseNumber = 0
            self.checkLoseFifthSeat()
            self.addCardWhenFiveStop()
            self.reverseSecondCard()
        })
    }
    
    func checkLoseFourth() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.duration), execute: {
            BlackJackData.checkLoseText[1].text = String(BlackJackData.checkLose[1])
            self.checkLoseNumber = 1
            self.checkLoseFifthSeat()
            self.addCardWhenFourthStop()
            self.reverseSecondCard()
        })
    }

    func checkLoseThird() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.duration), execute: {
            BlackJackData.checkLoseText[2].text = String(BlackJackData.checkLose[2])
            self.checkLoseNumber = 2
            self.checkLoseFifthSeat()
            self.addCardWhenThirdStop()
            self.reverseSecondCard()
        })
    }

    func checkLoseSecond() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.duration), execute: {
            BlackJackData.checkLoseText[3].text = String(BlackJackData.checkLose[3])
            self.checkLoseNumber = 3
            self.checkLoseFifthSeat()
            self.addCardWhenSecondStop()
            self.reverseSecondCard()
        })
    }

    func checkLoseFirst() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.duration), execute: {
            BlackJackData.checkLoseText[4].text = String(BlackJackData.checkLose[4])
            self.checkLoseNumber = 4
            self.checkLoseFifthSeat()
            self.reverseSecondCard()
        })
    }
    
    func checkLoseDiler() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.duration), execute: {
            BlackJackData.checkLoseText[5].text = String(BlackJackData.checkLose[5])
            self.checkStopDilerSeat()
        })
    }
    
    func addSecondCardForFifthSeat() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.animationCardss), execute: {
            self.cardNumber = 1
            self.checkLoseNumber = 0
            self.addFirstCartForFifthSeat()
            self.checkLoseFifth()
            self.createStopAndAddButtons()
        })
    }
    
    func addSecondCardForFourthSeat() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.animationCardss), execute: {
            self.checkLoseNumber = 1
            self.cardNumber = 10
            self.addFirstCartForFifthSeat()
            self.checkLoseFourth()
            self.createStopAndAddButtons()
        })
    }
    
    func addSecondCardForThirdSeat() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.animationCardss), execute: {
            self.checkLoseNumber = 2
            self.cardNumber = 19
            self.addFirstCartForFifthSeat()
           // BlackJackData.checkLose[2] = 22
            self.checkLoseThird()
            self.createStopAndAddButtons()
        })
    }
    
    func addSecondCardForSecondSeat() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.animationCardss), execute: {
            self.checkLoseNumber = 3
            self.cardNumber = 28
            self.addFirstCartForFifthSeat()
            self.checkLoseSecond()
            self.createStopAndAddButtons()
        })
    }
    
    func addSecondCardForFirstSeat() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.animationCardss), execute: {
            self.checkLoseNumber = 4
            self.cardNumber = 37
            self.addFirstCartForFifthSeat()
            self.checkLoseFirst()
            self.createStopAndAddButtons()
        })
    }

    func addFirstCardForFourthSeat() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.animationCards), execute: {
            self.checkLoseNumber = 1
            self.cardNumber = 9
            self.addFirstCartForFifthSeat()
            self.checkLoseFourth()
            self.createCheckForDiler()
        })
    }
    
    func addFirstCardForThirdSeat() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.animationCards), execute: {
            self.checkLoseNumber = 2
            self.cardNumber = 18
            self.addFirstCartForFifthSeat()
            self.checkLoseThird()
            self.createCheckForDiler()
        })
    }
    
    func addFirstCardForSecondSeat() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.animationCards), execute: {
            self.checkLoseNumber = 3
            self.cardNumber = 27
            self.addFirstCartForFifthSeat()
            self.checkLoseSecond()
            self.createCheckForDiler()
        })
    }
    
    func addFirstCardForFirstSeat() {
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.animationCards), execute: {
            self.checkLoseNumber = 4
            self.cardNumber = 36
            self.addFirstCartForFifthSeat()
            self.checkLoseFirst()
            self.createCheckForDiler()
        })
    }
    
    func createStopAndAddButtons() {
            self.createAddCartForFirstSeatButton()
            self.createStopForFirstSeat()
        
    }
    

    @objc func shareCart(send : UIButton) {
        
           BlackJackData.animationCardss = index + 1
           BlackJackData.animationCards = 0
           turnOffLeaveButtons()
           hideBetButtons()
           turnOffAddAndStopButtons()
           removeImage()
           eachSeatBet = stavka / index

        
         if BlackJackData.fiveSeat.tag == BlackJackData.holdFifthSeat {
            BlackJackData.animationCards += 1
            cardNumber = 0
            checkLoseNumber = 0
            addFirstCartForFifthSeat()
            checkLoseFifth()
            createCheckForDiler()
            addSecondCardForFifthSeat()
            BlackJackData.animationCardss += 1
         } else {
            BlackJackData.fiveSeat.isEnabled = false
        }
        if BlackJackData.firthSeat.tag == BlackJackData.holdFourthSeat && BlackJackData.animationCards != 0  {
            addFirstCardForFourthSeat()
            BlackJackData.animationCards += 1
            addSecondCardForFourthSeat()
            BlackJackData.animationCardss += 1
        } else if BlackJackData.firthSeat.tag == BlackJackData.holdFourthSeat && BlackJackData.animationCards == 0 {
            BlackJackData.animationCards += 1
            checkLoseNumber = 1
            cardNumber = 9
            addFirstCartForFifthSeat()
            checkLoseFourth()
            createCheckForDiler()
            addSecondCardForFourthSeat()
            BlackJackData.animationCardss += 1
        } else {
            BlackJackData.firthSeat.isEnabled = false
        }
        if BlackJackData.thirdSeat.tag == BlackJackData.holdThirdSeat && BlackJackData.animationCards != 0 {
            addFirstCardForThirdSeat()
            BlackJackData.animationCards += 1
            addSecondCardForThirdSeat()
            BlackJackData.animationCardss += 1
        } else if BlackJackData.thirdSeat.tag == BlackJackData.holdThirdSeat && BlackJackData.animationCards == 0 {
            checkLoseNumber = 2
            BlackJackData.animationCards += 1
            cardNumber = 18
            addFirstCartForFifthSeat()
            checkLoseThird()
            createCheckForDiler()
            addSecondCardForThirdSeat()
            BlackJackData.animationCardss += 1
        } else {
            BlackJackData.thirdSeat.isEnabled = false
        }
        if BlackJackData.secondSeat.tag == BlackJackData.holdSecondSeat && BlackJackData.animationCards != 0 {
            addFirstCardForSecondSeat()
            BlackJackData.animationCards += 1
            addSecondCardForSecondSeat()
            BlackJackData.animationCardss += 1
       } else if BlackJackData.secondSeat.tag == BlackJackData.holdSecondSeat && BlackJackData.animationCards == 0 {
            checkLoseNumber = 3
            BlackJackData.animationCards += 1
            cardNumber = 27
            addFirstCartForFifthSeat()
            checkLoseSecond()
            createCheckForDiler()
            addSecondCardForSecondSeat()
            BlackJackData.animationCardss += 1
       } else {
           BlackJackData.secondSeat.isEnabled = false
       }
       if BlackJackData.firstSeat.tag == BlackJackData.holdFirstSeat && BlackJackData.animationCards != 0 {
            addFirstCardForFirstSeat()
            BlackJackData.animationCards += 1
            addSecondCardForFirstSeat()
            BlackJackData.animationCardss += 1
        } else if BlackJackData.firstSeat.tag == BlackJackData.holdFirstSeat && BlackJackData.animationCards == 0 {
            checkLoseNumber = 4
            BlackJackData.animationCards += 1
            cardNumber = 36
            addFirstCartForFifthSeat()
            checkLoseFirst()
            createCheckForDiler()
            addSecondCardForFirstSeat()
        BlackJackData.animationCardss += 1
       } else {
           BlackJackData.firstSeat.isEnabled = false
       }
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.animationCards), execute: {
            self.checkLoseNumber = 5
            self.cardNumber = 45
            self.addFirstCartForFifthSeat()
            self.createCheckForDiler()
            self.checkLoseDiler()
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.animationCardss), execute: {
            self.cardNumber = 46
            self.addSecondCartForDilerSeat()
        })
    }
    
    
    @objc func backButton(send : UIButton) {
        balance += stavka
        stavka = 0
        turnOffSeatButto1n()
        checkBetButton()
        shareCart.removeTarget(nil, action: nil, for: .allEvents)
        for image in 0..<5 {
            BlackJackData.betImageViewCopy[image].image = nil
            BlackJackData.betImageView[image].image = nil
        }
        if time == 1 {
            myTimer.invalidate()
            createTimer()
        }
        createBalance()
    }
    
    @objc func multiplyButton(send : UIButton) {
        balance -= stavka
        stavka = stavka * 2
        createBalance()
        checkBetButton()
    }

    @objc func moveFirstBet() {
        if BlackJackData.fiveSeat.tag == BlackJackData.holdFifthSeat {
            betNumber = 0
            createBetImageForMove()
                DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.duration), execute: {
                    self.betNumber = 0
                    self.copyBetImage()
            })
        } else {
            BlackJackData.fiveSeat.isEnabled = false
        }
        if BlackJackData.firthSeat.tag == BlackJackData.holdFourthSeat {
            betNumber = 1
            createBetImageForMove()
                DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.duration), execute: {
                    self.betNumber = 1
                    self.copyBetImage()
            })
        } else {
            BlackJackData.firthSeat.isEnabled = false
        }
        if BlackJackData.thirdSeat.tag == BlackJackData.holdThirdSeat {
            betNumber = 2
            createBetImageForMove()
            DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.duration), execute: {
                self.betNumber = 2
                self.copyBetImage()
            })
        } else {
            BlackJackData.thirdSeat.isEnabled = false
        }
        if BlackJackData.secondSeat.tag == BlackJackData.holdSecondSeat {
            betNumber = 3
            createBetImageForMove()
                DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.duration), execute: {
                    self.betNumber = 3
                    self.copyBetImage()
            })
        } else {
            BlackJackData.secondSeat.isEnabled = false
        }
        if BlackJackData.firstSeat.tag == BlackJackData.holdFirstSeat {
            betNumber = 4
            createBetImageForMove()
                DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(BlackJackData.duration), execute: {
                    self.betNumber = 4
                    self.copyBetImage()
            })
        } else {
            BlackJackData.firstSeat.isEnabled = false
        }
        makeSeatEnable()
    }
    
    
    func copyBetImage() {
        makeBetEnable()
        if stavka > 0 && BlackJackData.allSeats[betNumber].tag != BlackJackData.seatTag[betNumber] {
            BlackJackData.betImageViewCopy[self.betNumber].image = BlackJackData.allBetsImage[self.betImages]
        }
    }
    
    
    func createBetImageForMove() {
        BlackJackData.betImageViewCopy[self.betNumber].frame = BlackJackData.betFramesMove[self.betNumber]
        view.addSubview(BlackJackData.betImageViewCopy[betNumber])
        BlackJackData.betImageView[betNumber].frame = BlackJackData.betFrames[betImages]
        BlackJackData.betImageView[betNumber].image = BlackJackData.allBetsImage[betImages]
        view.addSubview(BlackJackData.betImageView[betNumber])
        UIView.animate(withDuration: TimeInterval(BlackJackData.duration)) {
            BlackJackData.betImageView[self.betNumber].frame = BlackJackData.betFramesMove[self.betNumber]
        }
    }

    var times = Timer()

    func makeBetDisable() {
        for bet in 2..<8 {
            BlackJackData.allBets[bet].tag = 150
        }
    }
    
    func makeBetEnable() {
        for bet in 2..<8 {
            BlackJackData.allBets[bet].tag = BlackJackData.allBetsTag[bet]
        }
    }
    
    func forBets() {
        makeBetDisable()
        balance -= BlackJackData.allBetsTag[betImages] * index
        stavka += BlackJackData.allBetsTag[betImages] * index
    }
    
    @objc func pressBet(send : UIButton) {
        switch send.tag {
        case BlackJackData.firstBetTag:
            betImages = 7
            forBets()
            checkBetButton()
            createBalance()
            moveFirstBet()
        case BlackJackData.secondBetTag:
            betImages = 6
            forBets()
            checkBetButton()
            createBalance()
            moveFirstBet()
        case BlackJackData.thirdBetTag:
            betImages = 5
            forBets()
            checkBetButton()
            createBalance()
            moveFirstBet()
        case BlackJackData.firthBetTag:
            betImages = 4
            forBets()
            checkBetButton()
            createBalance()
            moveFirstBet()
        case BlackJackData.fiveBetTag:
            betImages = 3
            forBets()
            checkBetButton()
            createBalance()
            moveFirstBet()
        case BlackJackData.sixBetTag:
            betImages = 2
            forBets()
            createBalance()
            checkBetButton()
            moveFirstBet()
        default:
            break
        }
    }
   
    func callBetAndTimerAferDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            if BlackJackData.betCalled == false && BlackJackData.statusBetButtons == true {
                if  self.index != 0 {
                    self.createBetButtons()
                    self.createTimer()
                    print("here")
                }
            } else if BlackJackData.betCalled == false && BlackJackData.statusBetButtons == false {
                print("ehere")
                if  self.index != 0 {
                    BlackJackData.betCalled = true
                    self.checkBetButton()
                    self.createTimer()
                    self.showBetButtons()
                }
            }
        })
    }
    
    
    @objc func holdSeat(send : UIButton) {
        switch send.tag {
        case BlackJackData.firstSeatIsEmpty: BlackJackData.firstSeat.setImage(BlackJackData.holdSeatImage, for: .normal)
            BlackJackData.firstSeat.tag = BlackJackData.holdFirstSeat
            leaveButton = 4
            createLeaveButtonForFirstSeat()
            index += 1
            checkBetButton()
            callBetAndTimerAferDelay()
        case BlackJackData.secondSeatIsEmpty: BlackJackData.secondSeat.setImage(BlackJackData.holdSeatImage, for: .normal)
            BlackJackData.secondSeat.tag = BlackJackData.holdSecondSeat
            leaveButton = 3
            createLeaveButtonForFirstSeat()
            index += 1
            checkBetButton()
            callBetAndTimerAferDelay()
        case BlackJackData.thirdSeatIsEmpty: BlackJackData.thirdSeat.setImage(BlackJackData.holdSeatImage, for: .normal)
            BlackJackData.thirdSeat.tag = BlackJackData.holdThirdSeat
            leaveButton = 2
            createLeaveButtonForFirstSeat()
            index += 1
            checkBetButton()
            callBetAndTimerAferDelay()
        case BlackJackData.fourthSeatIsEmpty: BlackJackData.firthSeat.setImage(BlackJackData.holdSeatImage, for: .normal)
            BlackJackData.firthSeat.tag = BlackJackData.holdFourthSeat
            leaveButton = 1
            createLeaveButtonForFirstSeat()
            index += 1
            checkBetButton()
            callBetAndTimerAferDelay()
        case BlackJackData.fifthSeatIsEmpty: BlackJackData.fiveSeat.setImage(BlackJackData.holdSeatImage, for: .normal)
            BlackJackData.fiveSeat.tag = BlackJackData.holdFifthSeat
            leaveButton = 0
            createLeaveButtonForFirstSeat()
            index += 1
            checkBetButton()
            callBetAndTimerAferDelay()
        default:
            break
        }
    }
    
    var leaveNumber = Int()
    var eachSeatBet = Int()
    
    func eachSeat() {
        if stavka > 0 {
            eachSeatBet = stavka / index
            balance += eachSeatBet
            stavka -= eachSeatBet
            createBalance()
        }
    }
    
    func leaveSeat() {
        checkBetButton()
        if  eachSeatBet > 0  {
            BlackJackData.leaveButtons[leaveNumber].isHidden = true
            BlackJackData.allSeats[leaveNumber].isEnabled = false
            BlackJackData.betImageViewCopy[leaveNumber].image = nil
            BlackJackData.betImageView[leaveNumber].image = nil
            eachSeatBet = 0
            makeSeatEnable()
        } else {
            BlackJackData.leaveButtons[leaveNumber].isHidden = true
        }
    }
    
    func makeSeatEnable() {
        if index == 0 && time == 1 {
            turnOffSeatButto1n()
            hideBetButtons()
            BlackJackData.betCalled = false
        } else if index == 0 {
            turnOffSeatButto1n()
        }
    }
    
    
    @objc func leaveFromSeat(send : UIButton) {
        switch send.tag {
        case BlackJackData.leaveFromFirstSeat: BlackJackData.firstSeat.setImage(BlackJackData.seatButtonImage, for: .normal)
            BlackJackData.firstSeat.tag = BlackJackData.firstSeatIsEmpty
            eachSeat()
            index -= 1
            leaveNumber = 4
            leaveSeat()
        case BlackJackData.leaveFromSecondSeat: BlackJackData.secondSeat.setImage(BlackJackData.seatButtonImage, for: .normal)
            BlackJackData.secondSeat.tag = BlackJackData.secondSeatIsEmpty
            eachSeat()
            index -= 1
            leaveNumber = 3
            leaveSeat()
        case BlackJackData.leaveFromThirdSeat: BlackJackData.thirdSeat.setImage(BlackJackData.seatButtonImage, for: .normal)
            BlackJackData.thirdSeat.tag = BlackJackData.thirdSeatIsEmpty
            eachSeat()
            index -= 1
            leaveNumber = 2
            leaveSeat()
        case BlackJackData.leaveFromFourthSeat: BlackJackData.firthSeat.setImage(BlackJackData.seatButtonImage, for: .normal)
            BlackJackData.firthSeat.tag = BlackJackData.fourthSeatIsEmpty
            eachSeat()
            index -= 1
            leaveNumber = 1
            leaveSeat()
        case BlackJackData.leaveFromFifthSeat: BlackJackData.fiveSeat.setImage(BlackJackData.seatButtonImage, for: .normal)
            BlackJackData.fiveSeat.tag = BlackJackData.fifthSeatIsEmpty
            eachSeat()
            index -= 1
            leaveNumber = 0
            leaveSeat()
        default:
            break
        }
    }
}

