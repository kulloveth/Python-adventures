import re

def is_password_valid(password):
    if len(password) < 6 or len(password) > 12:
        return False

    # Check if the password contains the required character sets
    if not re.search(r'[a-z]', password):
        return False
    if not re.search(r'[A-Z]', password):
        return False
    if not re.search(r'[0-9]', password):
        return False
    if not re.search(r'[$#@_&%]', password):
        return False

    return True

print(is_password_valid("Tango@2023"))

print(is_password_valid("Tango"))
