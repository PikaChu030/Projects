package com.example.restservice.controller;

import com.example.restservice.model.CallRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequiredArgsConstructor
public class CallServiceController {
    private final RestTemplate restTemplate;

    @PostMapping("/callservice")
    public ResponseEntity<?> callExternalService(@RequestBody CallRequest request) {
        try {
            String url = sanitizeUrl(request.getExternalBaseUrl(), request.getParameters());
            ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
            return ResponseEntity.ok()
                    .contentType(response.getHeaders().getContentType())
                    .body(response.getBody());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .contentType(MediaType.TEXT_PLAIN)
                    .body("Error: " + e.getMessage());
        }
    }

    private String sanitizeUrl(String baseUrl, String params) {
        String cleanBase = baseUrl.replaceAll("/+$", "");
        String cleanParams = params.replaceAll("^/+", "");
        return cleanBase + "/" + cleanParams;
    }
}