package com.example.restservice.model;

import lombok.Data;
import jakarta.validation.constraints.NotBlank;

@Data
public class CallRequest {
    @NotBlank(message = "externalBaseUrl is required")
    private String externalBaseUrl;

    @NotBlank(message = "parameters is required")
    private String parameters;
}