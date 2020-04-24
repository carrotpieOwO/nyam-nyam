package com.carrot.nyam.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;

@Configuration
public class WebConfig implements WebMvcConfigurer {

//
//	@Value("${file.path}")
//	private String fileRealPath;
//	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		
		registry.addResourceHandler("/media/**").addResourceLocations("file:/var/media/").setCachePeriod(3600)
		.resourceChain(true).addResolver(new PathResourceResolver());

	}
	
	
}
