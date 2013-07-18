import java.util.GregorianCalendar
import java.util.Calendar

/*
 *  Complete solution and tests can be found at:
 *      https://github.com/rchavarria/solveet-problems/tree/master/spotify-best-before-scala
 */
class BestBefore {

    // the only public method
    def bestBefore(input: String): (Int, String, Int) = {
        val values = input.split("/")
        val numbers = values map (_.toInt)

        resultIs(minimumDateIn(possibleDates(builtFromPermutationsOf(numbers))))
    }

    private def builtFromPermutationsOf(numbers: Array[Int]) = {
        val a = numbers(0)
        val b = numbers(1)
        val c = numbers(2)

        List(
            (a, b, c),
            (a, c, b),
            (b, a, c),
            (b, c, a),
            (c, a, b),
            (c, b, a)
            )
    }

    private def possibleDates(permutations: List[(Int, Int, Int)]) = {
        val datesInMillis = permutations.map { dayMonthYear => 
            val day = dayMonthYear._1
            val month = dayMonthYear._2 - 1
            val year = 2000 + dayMonthYear._3

            val calendar = new GregorianCalendar
            calendar.set(Calendar.DAY_OF_MONTH, day)
            calendar.set(Calendar.MONTH, month)
            calendar.set(Calendar.YEAR, year)

            // check if date is valid (equal as expected)
            val invalidDate = calendar.get(Calendar.DAY_OF_MONTH) != day ||
                              calendar.get(Calendar.MONTH) != month ||
                              calendar.get(Calendar.YEAR) != year

            // if not, return a really high value
            if(invalidDate) Long.MaxValue else calendar.getTimeInMillis
        }.filter(_ < Long.MaxValue)

        if(datesInMillis.isEmpty) throw new Exception("No valid date can be found!")
        datesInMillis
    }

    private def minimumDateIn(dates: List[Long]) = dates.min

    private def resultIs(millis: Long) = {
        val calendar = new GregorianCalendar
        calendar.setTimeInMillis(millis)

        val day = calendar.get(Calendar.DAY_OF_MONTH)
        val month = MONTHS(calendar.get(Calendar.MONTH))
        val year = calendar.get(Calendar.YEAR)

        (day, month, year)
    }

    val MONTHS = List(
                    "January", 
                    "February", 
                    "March", 
                    "April", 
                    "May", 
                    "June", 
                    "July", 
                    "August", 
                    "September", 
                    "October", 
                    "November", 
                    "December"
                    )
}
