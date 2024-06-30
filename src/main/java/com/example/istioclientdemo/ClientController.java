package com.example.istioclientdemo;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@RestController
public class ClientController {

    private final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
    private final RestTemplate restTemplate = new RestTemplate();

    @GetMapping("/initiate")
    public void initiate() {
        final Runnable poller = () -> {
            ResponseEntity<String> responseEntity =
                    restTemplate.getForEntity("http://istio-service-demo/demo", String.class);

            System.out.println("Response from istio-service-demo: " + responseEntity.getBody());
        };

        scheduler.scheduleAtFixedRate(poller, 0, 5, TimeUnit.SECONDS);
    }
}