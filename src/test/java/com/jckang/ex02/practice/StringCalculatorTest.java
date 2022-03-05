package com.jckang.ex02.practice;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

@Log4j2
public class StringCalculatorTest {
    private StringCalculator stringCalculator;
    @BeforeEach
    public void setup() {
        stringCalculator = new StringCalculator();
        log.info("before passed..............");
    }

    @Test
    public void nullOrEmpty(){
        assertEquals(0, stringCalculator.add(null));
        assertEquals(0, stringCalculator.add(" "));
    }
}
