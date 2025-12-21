import random

# My first Mojo program!
def main():
    rows: Int = Int(input("Enter the rows"))
    cols: Int = Int(input("Enter the cols"))

    glider = [
        [0, 1, 0, 0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0, 0, 0, 0],
        [1, 1, 1, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
    ]

    print_grid(glider, rows, cols)

@fieldwise_init
struct GameOfLife(Copyable, Stringable):
    var grid: List[List[Int]]

    fn __str__():
        return print_grid()
    
    @staticmethod
    fn generate_random_grid(self) -> Self:

        random.seed()

        newGrid: List[List[Int]] = []
        return Self(newGrid^)
        

def print_grid(grid: List[List[Int]], rows: Int, cols: Int):
    s:String=""
    for row in range(rows):
        for col in range(cols):
            s += '*' if grid[row][col] == 1 else ' '
        s+='\n'
