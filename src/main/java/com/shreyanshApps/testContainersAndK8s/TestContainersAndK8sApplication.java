package com.shreyanshApps.testContainersAndK8s;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class TestContainersAndK8sApplication {

	public static void main(String[] args) {
		SpringApplication.run(TestContainersAndK8sApplication.class, args);
	}

	@GetMapping("/")
	public String helloKubernetes() {
		return "Hello, Kubernetes! My CI/CD pipeline works!";
	}
}