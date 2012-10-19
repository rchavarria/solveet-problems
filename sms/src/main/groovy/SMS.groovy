/**
 * Complete solution and tests at: https://github.com/rchavarria/solveet-problems/tree/master/sms
 */
class SMS {

    static KEYBOARD = [ '0': '-_:0',
                        '1': '.; 1', 
                        '2': 'abc2', 
                        '3': 'def3', 
                        '4': 'ghi4', 
                        '5': 'jkl5', 
                        '6': 'mno6', 
                        '7': 'pqrs7', 
                        '8': 'tuv8', 
                        '9': 'wxyz9', 
                      ]

    def translate(digits) {
        if("" == digits) return ""

        def keyPressed = digits[0]
        def times = digits.length()
        def options = KEYBOARD[keyPressed]
        options[(times % options.length()) - 1]
    }
}

// Showing how to use the class
