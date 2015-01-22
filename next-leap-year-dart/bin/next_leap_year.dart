class NextLeapYear {
    int year;

    NextLeapYear(this.year);

    NextLeapYear next() {
        if (isLeap(year)) {
            return this;
        }

        int next = findGoodCandidate(year);

        return new NextLeapYear(next);
    }

    int findGoodCandidate(startingAtYear) {
        int differenceToLeap = 4 - (startingAtYear % 4);
        int next = year + differenceToLeap;
        if (!isLeap(next)) {
            next += 4;
        }

        return next;
    }

    boolean isLeap(candidateYear) {
        if (candidateYear % 100 == 0) {
            return false;
        }

        return candidateYear % 4 == 0;
    }

}
