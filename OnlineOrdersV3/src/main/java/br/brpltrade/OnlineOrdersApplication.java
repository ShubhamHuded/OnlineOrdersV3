package br.brpltrade;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"br.jpa.entity.*", "br.brpltrade.*", "br.brpltrade.config"})
@EntityScan(basePackages = {"br.jpa.*", "br.brpltrade.jpa.*", "br.brpltrade.entity"})
public class OnlineOrdersApplication {

	public static void main(String[] args) {
		SpringApplication.run(OnlineOrdersApplication.class, args);
	}
}
        

