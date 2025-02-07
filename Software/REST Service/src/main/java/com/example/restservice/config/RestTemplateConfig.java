package com.example.restservice.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MapPropertySource;
import java.util.HashMap;
import java.util.Map;

@Configuration
public class RestTemplateConfig {
    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
    public ConfigurableEnvironment disableErrorBody(ConfigurableEnvironment env) {
        Map<String, Object> props = new HashMap<>();
        props.put("server.error.include-message", "never");
        props.put("server.error.include-binding-errors", "never");
        props.put("server.error.whitelabel.enabled", false);
        env.getPropertySources().addFirst(new MapPropertySource("error-config", props));
        return env;
    }
}