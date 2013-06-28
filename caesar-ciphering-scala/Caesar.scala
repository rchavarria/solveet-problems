/*
 *  Complete solution and tests can be found at:
 *      https://github.com/rchavarria/solveet-problems/tree/master/caesar-ciphering-scala
 */
class Caesar {

    def cipher(message: String, offset: Int): String = {
    	message.toList.map{ char => 
    		val index = Caesar.ALPHABET.indexOf(char)
    		val positiveOffset = (index + offset + Caesar.LENGTH) % Caesar.LENGTH
    		if (index < 0) char else Caesar.ALPHABET(positiveOffset)
    	}.mkString
    }

    def decipher(message: String, offset: Int) = cipher(message, -offset)
}

object Caesar {
	val ALPHABET = "abcdefghijklmnopqrstuvwxyz"
	val LENGTH = ALPHABET.length
}