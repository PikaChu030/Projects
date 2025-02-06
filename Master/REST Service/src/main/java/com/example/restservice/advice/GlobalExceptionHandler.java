package com.example.restservice.advice;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.servlet.NoHandlerFoundException;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler({
            MissingServletRequestParameterException.class, // 缺少請求參數
            ServletRequestBindingException.class,         // 參數綁定錯誤（如路徑變量格式錯誤）
            NoHandlerFoundException.class,                // 無匹配的路徑
            MethodArgumentTypeMismatchException.class,    // 類型轉換錯誤（如路徑變量類型不匹配）
            IllegalArgumentException.class               // 非法參數（如路徑變量為空）
    })
    public ResponseEntity<Void> handleAll404Scenarios() {
        return ResponseEntity.notFound().build(); // 統一返回無 BODY 的 404
    }
}