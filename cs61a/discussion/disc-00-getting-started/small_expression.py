def f(x):
    return x - 1


def g(x):
    return 2 * x


def h(x, y):
    return int(str(x) + str(y))


class Number:
    def __init__(self, value):
        self.value = value

    def __str__(self):
        return str(self.value)

    def calls(self):
        return 0


class Call:
    """A call expression."""
    def __init__(self, f, operands):
        self.f = f
        self.operands = operands
        self.value = f(*[e.value for e in operands])

    def __str__(self):
        return f'{self.f.__name__}({",".join(map(str, self.operands))})'

    def calls(self):
        return 1 + sum(o.calls() for o in self.operands)


def smalls(n):
    if n == 0:
        yield Number(5)
    else:
        for operand in smalls(n - 1):
            yield Call(f, [operand])
            yield Call(g, [operand])
        for k in range(n):
            for first in smalls(k):
                for second in smalls(n - k - 1):
                    if first.value > 0 and second.value > 0:
                        yield Call(h, [first, second])


# result = []
# for i in range(9):
#     result.extend([e for e in smalls(i) if e.value == 2024])


for i in range(20):
    result = [e for e in smalls(i) if e.value == 2024]
    if result:
        for e in result:
            print(f"Expression: {e}")
            print(f"Function calls: {e.calls()}")
        break
