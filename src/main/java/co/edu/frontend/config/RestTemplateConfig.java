// src/main/java/co/edu/frontend/config/RestTemplateConfig.java
package co.edu.frontend.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import org.springframework.context.annotation.*;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;

@Configuration
public class RestTemplateConfig {

    @Bean
    public RestTemplate restTemplate() {
        // Configuramos Jackson para fechas ISO
        ObjectMapper mapper = new ObjectMapper()
                .registerModule(new JavaTimeModule())
                .disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);

        MappingJackson2HttpMessageConverter conv = new MappingJackson2HttpMessageConverter(mapper);
        RestTemplate rest = new RestTemplate();
        // Lo ponemos al principio para que lo use en JSON
        rest.getMessageConverters().add(0, conv);
        return rest;
    }
}
