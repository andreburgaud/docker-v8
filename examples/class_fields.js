// class fields

// node --harmony-class-fields class_fields.js

class Counter {
    x = 0;

    inc() {
        this.x++;
    }

    printCounter() {
        console.log(`x=${this.x}`);
    }
}

c = new(Counter);
c.printCounter();
c.inc();
c.inc();
c.printCounter();
