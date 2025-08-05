"""
Tik

The function tik takes an argument tok and returns a function insta that takes an argument gram. The insta function prints tok and gram on the same line separated by a space and has no return statement.
Its implementation has been omitted intentionally.
"""


def tik(tok):
    """Returns a function that takes gram and prints tok and gram on a line.

    >>> tik(5)(6)
    5 6
    """
    def insta(gram):
        print(tok, gram)
    return insta


tik(tik(5)(print(6)))(print(7))
# 6
# 5 None
# 7
# None None
