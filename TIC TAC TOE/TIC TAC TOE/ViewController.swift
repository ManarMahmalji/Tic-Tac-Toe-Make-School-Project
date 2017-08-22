//
//  ViewController.swift
//  TIC TAC TOE
//
//  Created by Manar Mahmalji on 8/20/17.
//  Copyright © 2017 Manar Mahmalji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
@IBOutlet weak var statusLabel: UILabel!
@IBOutlet weak var newGameButton: UIButton!
@IBOutlet weak var button1: UIButton!
@IBOutlet weak var button2: UIButton!
@IBOutlet weak var button3: UIButton!
@IBOutlet weak var button4: UIButton!
@IBOutlet weak var button5: UIButton!
@IBOutlet weak var button6: UIButton!
@IBOutlet weak var button7: UIButton!
@IBOutlet weak var button8: UIButton!
@IBOutlet weak var button9: UIButton!
    
    let winningCombinations = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9],
                               [1,5,9], [3,5,7]]
    var playerOneMoves = Set<Int>()
    var playerTwoMoves = Set<Int>()
    var possibleMove = Array<Int>()
    var nextMove: Int? = nil
    var playerTurn = 1
    let allSpaces: Set<Int> = [1,2,3,4,5,6,7,8,9]
    
    
    @IBAction func newGameButtonClicked(_ sender: AnyObject) {
        newGame()
    }
    
    
    @IBAction func buttonClicked(_ sender: AnyObject) {
        if playerOneMoves.contains(sender.tag) || playerTwoMoves.contains(sender.tag) /* here i am checking if the move done by the player is done before or not*/  {
            statusLabel.text = "Space is occupied"
        }else{
            if playerTurn % 2 != 0 {
                playerOneMoves.insert(sender.tag)// here, i am adding the tag to playerOneMoves set
                sender.setTitle("X", for: UIControlState.normal)//after he clicks, the title is set to x in normal state
                statusLabel.text = "PLayer 2's turn"
                if isWinner(player: playerTurn) == 0 {
                    
                }
                
            }
        }
        
}
    
    
    
    
    
    func newGame(){
        // step 1: cleaning up
        playerOneMoves.removeAll()
        playerTwoMoves.removeAll()
        // step 2: changing the status and turn
        statusLabel.text = "Player 1's turn"
        playerTurn = 1
        // step 3: 
        for index in 1...9 {
            let tile = self.view.viewWithTag(index) as! UIButton
            tile.isEnabled = true
        // here, i am saying that when the compiler loops for view with tag (index), it's a uibutton.So, i am connecting tiles to my tags.
        tile.setTitle("", for: UIControlState.normal)// here, after i renabled the uibuttons, i am setting the titles of my tags to nil i.e. ""
            }
    }
    
    func isWinner(player: Int) -> Int {
        
        var winner = 0
        var movesList = Set<Int>()
        if player == 1 {
            movesList = playerOneMoves
        }else{
            movesList = playerTwoMoves
        }
        
        for combination in winningCombinations{
            if movesList.contains(combination[0]) && movesList.contains(combination[1]) && movesList.contains(combination[2]) && movesList.count > 2 /* This means that if the moveList of the player contains the three elements of any combination in the winning combinations , winner is player*/ {
                winner = player
                statusLabel.text = "Player \(winner) wins!"
                for index in 1...9{
                    let tile = self.view.viewWithTag(index) as! UIButton
                    tile.isEnabled = false
                }
            }
            
        }
        return winner
    }
    func playDefense() -> Int {
        var possibleLosses = Array<Array<Int>>()
        var possibleWins = Array<Array<Int>>()
        let spacesLeft =  allSpaces.subtract(playerOneMoves.union(playerTwoMoves))
        
        
        for combination in winningCombinations{
            var count = 0
            for play in combination{
                if playerOneMoves.contains(play){
                    count += 1
                }
                if playerTwoMoves.contains(play){
                    count -= 1
                }
            
                if count == 2  {
                possibleLosses.append(combination)
                count = 0
                }
                if count == -2 {
                possibleWins.append(combination)
                count = 0
                }
        
            }
        }
        if possibleWins.count > 0{
            for combination in possibleWins{
                for space in combination{
                    if !(playerOneMoves.contains(space) || playerTwoMoves.contains(space)){
                        return space
                    }
                }
            }
        }
        if possibleLosses.count > 0{
            for combination in possibleLosses{
                for space in combination{
                    if !(playerOneMoves.contains(space) || playerTwoMoves.contains(space)){
                        possibleMove.append(space)
                    }
                    
                }
            }
        }
        if possibleMove.count > 0 {
            nextMove = possibleMove[Int(arc4random_uniform(UInt32(possibleMove.count)))]
        }else if spacesLeft.count > 0{
            nextMove = spacesLeft[spacesLeft.startIndex.advancedBy(Int(arc4random_uniform(UInt32(spacesLeft.count))))]
            
        }
      playerTurn ++
        return nextMove!
    }
    



    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

