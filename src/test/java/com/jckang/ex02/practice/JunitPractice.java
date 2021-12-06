package com.jckang.ex02.practice;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

@Log4j2
public class JunitPractice {
    private Calculator cal;

    @BeforeEach
    public void setup() {
        cal = new Calculator();
        log.info("before passed..............");
    }

    @Test
    public void add() {
        assertEquals(9, cal.add(6, 3));
    }

    @Test
    public void subtract() {
        assertEquals(2, cal.subtract(6, 3));
    }
}
