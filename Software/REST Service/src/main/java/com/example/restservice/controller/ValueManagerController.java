package com.example.restservice.controller;

import com.example.restservice.service.ValueManagerService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
public class ValueManagerController {
    private final ValueManagerService service;

    // POST 1: Query parameters
    @PostMapping("/valuemanager")
    public ResponseEntity<Void> postWithParams(
            @RequestParam(required = false) String key,
            @RequestParam(required = false) String value) {

        if (key == null || value == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        if (key.isEmpty() || value.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        service.put(key, value);
        return ResponseEntity.ok().build();
    }

    // POST 2: Path variables
    @PostMapping("/valuemanager/{key}/{value}")
    public ResponseEntity<Void> postWithPath(
            @PathVariable String key,
            @PathVariable String value) {

        if (key.isEmpty() || value.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        service.put(key, value);
        return ResponseEntity.ok().build();
    }

    // DELETE
    @DeleteMapping("/valuemanager/{key}")
    public ResponseEntity<Void> deleteKey(@PathVariable String key) {
        if (key.isEmpty() || !service.getAll().containsKey(key)) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
        service.delete(key);
        return ResponseEntity.ok().build();
    }

    // GET
    @GetMapping(value = {"/valuemanager", "/valuemanager/{key:.+}"})
    public ResponseEntity<?> getValueOrAll(
            @PathVariable(required = false) String key) {

        if (key == null) {
            return ResponseEntity.ok(service.getAll());
        }

        if (key.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        String value = service.get(key);
        return (value != null)
                ? ResponseEntity.ok().contentType(MediaType.TEXT_PLAIN).body(value)
                : ResponseEntity.status(HttpStatus.NOT_FOUND).build();
    }
}