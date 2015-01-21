class NextLeapYear {
    int year;

    NextLeapYear(this.year);

    NextLeapYear next() {
        if (isLeap(year)) {
            return this;
        }

        int next = year + 1;
        while (!isLeap(next)) {
            next++;
        }

        return new NextLeapYear(next);
    }

    boolean isLeap(candidateYear) {
        return candidateYear % 4 == 0;
    }

}
