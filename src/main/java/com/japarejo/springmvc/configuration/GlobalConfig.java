package com.japarejo.springmvc.configuration;

import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@Configuration
public class GlobalConfig {

    private String globalVariable;

    @PostConstruct
    public void init() {
        try {
            // Using ipify API to get public IP
            URL url = new URL("https://api.ipify.org");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            // Read response from the API
            try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
                globalVariable = in.readLine(); // Set the globalVariable directly
            }
        } catch (Exception e) {
            e.printStackTrace();
            globalVariable = "Unable to determine public IP";
        }

        System.out.println("Global variable (public IP) set at startup: " + globalVariable);
    }

    // Getter for accessing the global variable
    public String getGlobalVariable() {
        return globalVariable;
    }
}
