package com.jckang.ex02.practice;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.platform.commons.util.StringUtils;

import java.util.Arrays;

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
    public void test() {
        String [] test1 = {"1","2","3"};
        String test2 = Arrays.toString(test1);
        log.info(test2);
        String test3 = String.join(", ", test1);
        log.info(test3);
    }

    @AfterEach
    public void after(){
        log.info("after passed.........");
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
