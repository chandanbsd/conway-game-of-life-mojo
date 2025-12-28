import random

# My first Mojo program!
def main():
    rows: Int = Int(input("Enter the rows: "))
    cols: Int = Int(input("Enter the cols: "))
    gameOfLife = GameOfLife(rows, cols)
    
    print("Here's the generated grid: \n")
    print(String(gameOfLife))


struct GameOfLife(Copyable, Stringable):
    var grid: List[List[Int]]

    fn __str__(self) -> String:
        try:
            return print_grid(self.grid)
        except Exception:
            return "Error generating grid string: "
    
    fn __init__(out self, rows:Int, cols:Int):
        random.seed()
        newGrid: List[List[Int]] = []
        for row in range(rows):
            newGrid.append([])
            for _ in range(cols):
                newGrid[row].append(Int(random.random_si64(0, 1)))
        self.grid = newGrid^
        

def print_grid(grid: List[List[Int]]) -> String:
    s:String=""
    rows = len(grid)
    cols = len(grid[0])
    for row in range(rows):
        for col in range(cols):
            s += '*' if grid[row][col] == 1 else '-'
        s+='\n'
    return s
