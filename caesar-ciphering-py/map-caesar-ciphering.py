from string import ascii_lowercase as alphabet

def shift(character, offset):
	index = alphabet.find(character)
	if(index < 0): return character
	return alphabet[(index + offset) % len(alphabet)]

def cipher(message, offset):
	ciphered = map(shift, message, [offset] * len(message))
	return "".join(ciphered)

def decipher(message, offset):
	return cipher(message, -1 * offset)

# simple ciphering
assert "d" == cipher("a", 3)
assert "a" == decipher("d", 3)
assert "ibm" == cipher("hal", 1)
assert "hal" == decipher("ibm", 1)
# ciphering over the dictionary limit
assert "a" == cipher("z", 1)
assert "z" == decipher("a", 1)
assert "yzab" == cipher("wxyz", 2)
assert "wxyz" == decipher("yzab", 2)
# ciphering characters out of any dictionary
assert "?" == cipher("?", 5)
assert "!" == decipher("!", 9)
assert "," == cipher(",", 2)
assert "." == decipher(".", 100)
# cheking limits
assert "abc" == cipher("abc", len(alphabet))
assert "abc" == decipher("abc", len(alphabet))
