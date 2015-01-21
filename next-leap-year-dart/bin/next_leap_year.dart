class NextLeapYear {
    int year;

    NextLeapYear(this.year);

    NextLeapYear next() {
        if (year % 4 == 0) {
            return this;
        }

        return new NextLeapYear(year + 1).next();
    }

}
