class NextLeapYear {
    int year;

    NextLeapYear(this.year);

    NextLeapYear next() {
        if (isLeap(year)) {
            return this;
        }

        int differenceToLeap = 4 - (year % 4);
        int next = year + differenceToLeap;

        return new NextLeapYear(next);
    }

    boolean isLeap(candidateYear) {
        return candidateYear % 4 == 0;
    }

}
