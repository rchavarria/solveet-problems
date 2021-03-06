class NextLeapYear {
    static int MINIMUM_LEAP_INTERVAL = 4;
    static int LEAP_YEARS_INTERVAL_EXCEPTION = 100;
    static int FIX_LEAP_INTERVAL_EXCEPTION_INTERVAL = 400;
    int year;

    NextLeapYear(this.year);

    NextLeapYear next() {
        if (isLeap(year)) {
            return this;
        }

        int next = findGoodCandidate(year);
        return new NextLeapYear(next);
    }

    int findGoodCandidate(startingAt) {
        int differenceToLeap = MINIMUM_LEAP_INTERVAL - (startingAt % MINIMUM_LEAP_INTERVAL);
        int next = startingAt + differenceToLeap;

        if (isLeap(next)) {
            return next;
        }
        return findGoodCandidate(next);
    }

    boolean isLeap(candidateYear) {
        if (dirtyFixToLeapExceptions(candidateYear)) {
            return true;
        }

        if (isAnExceptionToLeap(candidateYear)) {
            return false;
        }

        return matchLeapInterval(candidateYear);
    }

    boolean matchLeapInterval(candidate) => candidate % MINIMUM_LEAP_INTERVAL == 0;
    boolean isAnExceptionToLeap(candidate) => candidate % LEAP_YEARS_INTERVAL_EXCEPTION == 0;
    boolean dirtyFixToLeapExceptions(candidate) => candidate % FIX_LEAP_INTERVAL_EXCEPTION_INTERVAL == 0;

}
