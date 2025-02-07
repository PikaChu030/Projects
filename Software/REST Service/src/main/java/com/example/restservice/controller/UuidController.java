package com.example.restservice.controller;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UuidController {
    private static final String STUDENT_ID = "s2749500";

    @GetMapping(value = "/uuid", produces = MediaType.TEXT_HTML_VALUE)
    public ResponseEntity<String> getUuid() {
        String html = """
            <!DOCTYPE html>
            <html lang="en">
                <head>
                    <meta charset="UTF-8">
                    <title>Student ID</title>
                </head>
                <body>
                    <h1>%s</h1>
                </body>
            </html>
            """.formatted(STUDENT_ID);
        return ResponseEntity.ok(html);
    }
}