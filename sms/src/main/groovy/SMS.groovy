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

        def keys = whichKeysHaveBeenPressed(digits)
        keys.inject( "" ) { output, it ->
            def options = KEYBOARD[it.key]
            def optionIndex = (it.times % options.length()) - 1

            output += options[optionIndex]
        }
    }

    private whichKeysHaveBeenPressed(digits) {
        def firstKeyAndTime = [ new KeyAndTimes(key: null, times: 0) ]

        digits.inject( firstKeyAndTime ) { keys, digit ->
            def lastKeyAndTimes = keys[ keys.size() - 1 ]

            if (digit == " ") {
                keys << new KeyAndTimes(key: null, times: 0)
            } else if (lastKeyAndTimes.key == null) {
                lastKeyAndTimes.key = digit
                lastKeyAndTimes.times++
            } else if (lastKeyAndTimes.key == digit) {
                lastKeyAndTimes.times++
            } else {
                keys << new KeyAndTimes(key: digit, times: 1)
            }

            keys
        }
    }

    private static class KeyAndTimes {
        def key
        def times
    }
}

// Showing how to use the class
/*
def sms = new SMS()
assert "" == sms.translate("")
assert "-" == sms.translate("0")
assert ";" == sms.translate("11")
assert "c" == sms.translate("222")
assert "3" == sms.translate("3333")
assert "m" == sms.translate("66666")
assert "mama" == sms.translate("6262")
assert "caca" == sms.translate("222 2 222 2")
assert "mama" == sms.translate("6 2 6 2")
assert "mama" == sms.translate("6 26 2")
*/
