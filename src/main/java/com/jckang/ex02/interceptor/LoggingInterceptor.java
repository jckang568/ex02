package com.jckang.ex02.interceptor;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.apache.logging.slf4j.Log4jLogger;
import org.jetbrains.annotations.NotNull;
import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;

import java.util.Enumeration;
import java.util.stream.Collectors;

@Slf4j
public class LoggingInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request, @NotNull HttpServletResponse response, @NotNull Object handler) throws Exception {
        log.debug("Request URL: {}", request.getRequestURL());
        log.debug("Method: {}", request.getMethod());
        request.getHeaderNames().asIterator().forEachRemaining(s -> log.debug("Header name 3: {}", s));
        Enumeration<String> headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String requestName = headerNames.nextElement();
            log.debug("Header name: {} , value: {}", requestName, request.getHeader(requestName));
        }

        request.getHeaderNames().asIterator().forEachRemaining(s -> log.debug("Header name2 : {}, value : {}" , s, request.getHeader(s)));
        log.debug("Headers: {}", request.getHeaderNames());
        log.debug("Parameters: {}", request.getParameterMap());
        log.debug("Payload: {}", request.getReader().lines().collect(Collectors.joining(System.lineSeparator())));
        return true;
    }

    @Override
    public void postHandle(@NotNull HttpServletRequest request, @NotNull HttpServletResponse response, @NotNull Object handler, ModelAndView modelAndView) throws Exception {
        // No implementation needed
    }

    @Override
    public void afterCompletion(@NotNull HttpServletRequest request, @NotNull HttpServletResponse response, @NotNull Object handler, Exception ex) throws Exception {
        // No implementation needed
    }
}