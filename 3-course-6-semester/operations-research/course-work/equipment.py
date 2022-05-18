#! Name:    Solves the problem of replacement of equipment
#! Author:  Egor Bronnikov


# Import
from typing import List, Tuple


def replacing_equipment(n: int, year: int, s: int, P: int, r: List[int], u: List[int]) -> Tuple[List[str], int]:
    """
        @Synopsis
        def replacing_equipment(n: int, year: int, s: int, P: int, r: List[int], u: List[int]) -> Tuple[List[str], int]: ...

        @Description
        Solves the equipment replacement problem by the dynamic programming method.

        @param n: Number of years of planning
        @type n: int
        @param year: Equipment age
        @type year: int
        @param s: Residual value of equipment
        @type s: int
        @param P: New equipment costs
        @type P: int
        @param r: The value of the products produced during the year
        @type r: List[int]
        @param u: Annual costs associated with the operation of equipment
        @type u: List[int]

        @return: Equipment replacement plan for a given period of time `n` and the maximum profit (the target function value).
        @rtype: Tuple[List[str], int]
    """

    # Prepare data
    matrix = [[0 for _ in range(n+1)] for _ in range(n)]    # Matrix for Bellman function
    replacement = [0 for _ in range(n)]                     # Replacement rate

    matrix[n-1] = [max(r[t] - u[t], s - P + r[0] - u[0]) for t in range(n+1)]
    replacement[n-1] = s - P + r[0] - u[0]

    # Conditional optimization
    # Filling in the Bellman function matrix
    for i in range(n-1, 0, -1):
        for t in range(n):
            matrix[i-1][t] = max(r[t] - u[t] + matrix[i][t+1], s - P + r[0] - u[0] + matrix[i][1])
        replacement[i-1] = s - P + r[0] - u[0] + matrix[i][1]
        matrix[i-1][n] = matrix[i-1][n-1]

    # Unconditional optimization
    column = [row[year] for row in matrix]
    value = column[0]
    
    pos = year
    plan = []
    
    for i in range(n):
        if pos == matrix[i].index(replacement[i]):  # Save at this time and replace on the future
            plan.append(f"{i+1}")
            plan.append("R")
            pos = 0
        elif pos > matrix[i].index(replacement[i]): # Replace 
            plan.append("R")
            plan.append(f"{i+1}")
            pos = 0
        else:                                       # Save
            plan.append(f"{i+1}")
            pos += 1

    return plan, value


if __name__ == "__main__":
    n = 10
    y = 3
    s = 4
    P = 18
    r = [31, 30, 28, 28, 27, 26, 26, 25, 24, 24, 23]
    u = [8, 9, 9, 10, 10, 10, 11, 12, 14, 17, 18]
    print(replacing_equipment(n, y, s, P, r, u))
