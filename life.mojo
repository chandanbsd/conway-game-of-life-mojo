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
    var row_count: Int
    var col_count: Int

    fn __str__(self) -> String:
        try:
            return self.print_grid()
        except Exception:
            return "Error generating grid string: "
    
    fn __init__(out self, rows:Int, cols:Int):
        row_count = rows
        col_count = cols
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

    fn evolve(self):
        next_generation = List[][]
