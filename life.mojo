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
    

def print_grid(grid: List[List[Int]], rows: Int, cols: Int):
    for row in range(rows):
        for col in range(cols):
            print('*' if grid[row][col] == 1 else ' ', end="")
        print()
