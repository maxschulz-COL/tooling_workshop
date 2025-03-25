def add_numbers(a: int, b: int) -> int:
    return a + b

# Mypy violation: passing a string instead of an int
result = add_numbers("two", 3)

def greet(name: str) -> str:
    return "Hello, " + name

# Mypy violation: passing an int instead of a str
message = greet(123)

# Mypy violation: returning an int instead of a str
def get_number() -> str:
    return 42

foo = get_number()

print(foo)
# foo.capitalize()