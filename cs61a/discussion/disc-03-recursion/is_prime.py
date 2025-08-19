def is_prime(n):
    """Return True if n is a prime number and False otherwise.

    >>> is_prime(2)
    True
    >>> is_prime(16)
    False
    >>> is_prime(521)
    True
    """
    def helper(i):
        if n % i == 0:
            return n == i
        elif i > n:
            return True
        else:
            return helper(i + 1)

    return helper(2)
