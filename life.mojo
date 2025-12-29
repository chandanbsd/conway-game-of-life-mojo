import random
from sys import exit

# My first Mojo program!
def main():
    rows: Int = Int(input("Enter the rows: "))
    cols: Int = Int(input("Enter the cols: "))
    # rows: Int = 5
    # cols:Int = 5
    gameOfLife = GameOfLife(rows, cols)
    
    print("Here's the generated grid: \n")
    print(String(gameOfLife))

    while True:
        ch:String = input("Enter 'e' to evolve or anything else to quit:")
        # ch:String = 'e'

        if ch == 'e':
            gameOfLife.evolve()
            print(String(gameOfLife))
        else:
            exit()


struct GameOfLife(Copyable, Stringable):
    var grid: List[List[Int]]
    var row_count: Int
    var col_count: Int

    fn __str__(self) -> String:
        return self.print_grid()
    
    fn __init__(out self, rows:Int, cols:Int):
        self.row_count = rows
        self.col_count = cols
        random.seed()
        newGrid: List[List[Int]] = []
        for row in range(rows):
            newGrid.append([])
            for _ in range(cols):
                newGrid[row].append(Int(random.random_si64(0, 1)))
        self.grid = newGrid^
        

    fn print_grid(self) -> String:
        s:String=""
        for row in range(self.row_count):
            for col in range(self.col_count):
                s += '*' if self.grid[row][col] == 1 else '-'
            s+='\n'
        return s

    fn evolve(mut self):
        next_generation: List[List[Int]] = []

        for row in range(self.row_count):
            prev_row = (row - 1) % self.row_count
            next_row = (row + 1) % self.row_count
            next_generation.append([])

            for col in range(self.col_count):

                prev_col = (col - 1) % self.col_count
                next_col = (col + 1) % self.col_count

                neighbours_count = self.grid[prev_row][prev_col] \
                    + self.grid[prev_row][next_col] \
                    + self.grid[next_row][prev_col] \
                    + self.grid[next_row][next_col] \
                    + self.grid[row][prev_col] \
                    + self.grid[row][next_col] \
                    + self.grid[prev_row][col] \
                    + self.grid[next_row][col]
                
                if (self.grid[row][col] == 1):

                    if neighbours_count < 2:
                        next_generation[row].append(0)
                    
                    elif neighbours_count ==2 or neighbours_count ==3:
                        next_generation[row].append(1)

                    elif neighbours_count > 3:
                        next_generation[row].append(0)
                    
                    else:
                        next_generation[row].append(0)
                
                else:

                    if neighbours_count == 3:
                        next_generation[row].append(1)
                    
                    else:
                        next_generation[row].append(0)
        self.grid = next_generation^
