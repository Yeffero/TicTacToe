class Tictactoe



def initialize(playerX,playerO,size)
  @playerX=playerX
  puts "#{@playerX} you will play with X"
  @playerO=playerO
    puts "#{@playerO} you will play with O"
  @size=size
  startBoard
end

private
def startBoard
  @board=Array.new
  for i in (0...@size) do
    @board[i]=Array.new
    for j in  (0...@size) do

        @board[i][j]="_"
      end
    end

end
public

def printBoard
  print "|0|"
  for i in (0...@size) do
    print  "#{i+1}|"
  end
  puts ""
  for i in (0...@size) do
    print "|#{i+1}|"
    for j in  (0...@size) do
        print "#{@board[i][j]}|"
        if j==(@size-1)
           puts ""
         end
    end

end
end
private
def checkBoardbyPlayer(char)
resultPlayer=false
checkFirstRow=""
checkFirstColumn=""
checkDiagonal=""
checkLastColumn=""
checkLastRow=""

  for i in (0...@size) do
    checkFirstRow+=@board[0][i]
    checkFirstColumn+=@board[i][0]
    checkDiagonal+=@board[i][i]
    checkLastColumn+=@board[i][@size-1]
    checkLastRow+=@board[@size-1][i]
  end


  if (((checkFirstRow.count char) == @size) ||
    ((checkFirstColumn.count char ) == @size) ||
    ((checkLastRow.count char) == @size) ||
    ((checkLastColumn.count char) == @size) ||
    ((checkDiagonal.count char) == @size))

    resultPlayer=true
  end

  resultPlayer
end

end

public
def infinitePlay
loop do


    playPlayer("X")
    printBoard
    if checkBoardbyPlayer("X")
      puts "You #{@playerX} WIN!!!!"
        break
    end

    playPlayer("O")
    printBoard
    if checkBoardbyPlayer("O")
        puts "You #{@playerO} WIN!!!!"
        break
    end

end


end

private
def playPlayer(char)
player=""
    if char=="X"
      player=@playerX
    else
      player=@playerO
    end

          puts "Please #{player} type coordinates for your turn x and y"
          loop do
            xcoord=checkNumber("ROW")
            ycoord=checkNumber("COLUMNS")
            if checkCoord(xcoord.to_i,ycoord.to_i,player,char)
                  break
            end
            printBoard
          end


end

def checkCoord(x,y,player,char)

  position =""
    position=@board[x-1][y-1].to_s
      if position=="_"

        @board[x-1][y-1]=char
        puts " Position #{x},#{y} it is now yours , #{player}"
        return true
      else
        puts " Position #{x},#{y} it is already used, Please check and try again"
        return  false
      end


end


def checkNumber(x)
  typed=""
  loop do
    puts "Please type your choice in #{x} "
    typed=gets.chomp
    if typed.to_i >0 && typed.to_i<=@size
      break
    end

  end
  typed.to_i
end
#Main

j=Tictactoe.new("Jugador_1","Jugador_2",3)
j.printBoard
j.infinitePlay
