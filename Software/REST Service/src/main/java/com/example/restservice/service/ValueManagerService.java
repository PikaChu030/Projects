package com.example.restservice.service;

import org.springframework.stereotype.Service;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class ValueManagerService {
    private final ConcurrentHashMap<String, String> store = new ConcurrentHashMap<>();

    public synchronized void put(String key, String value) {
        if (key == null || key.isEmpty()) throw new IllegalArgumentException("Key cannot be empty");
        store.put(key, value);
    }

    public String get(String key) {
        return store.get(key);
    }

    public synchronized void delete(String key) {
        store.remove(key);
    }

    public ConcurrentHashMap<String, String> getAll() {
        return new ConcurrentHashMap<>(store);
    }
}