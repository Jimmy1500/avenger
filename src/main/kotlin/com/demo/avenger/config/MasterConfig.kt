package com.demo.avenger.config

import org.springframework.context.annotation.Configuration
import org.springframework.web.servlet.config.annotation.CorsRegistry
import org.springframework.web.servlet.config.annotation.EnableWebMvc
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer

// import com.amazonaws.regions.Regions
// import com.amazonaws.services.s3.AmazonS3
// import com.amazonaws.services.s3.AmazonS3ClientBuilder
// import org.springframework.beans.factory.annotation.Value
// import org.springframework.context.annotation.Bean

@Configuration
@EnableWebMvc
class RestConfiguration : WebMvcConfigurer {

    override fun addCorsMappings(registry: CorsRegistry) {
        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowedMethods("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS")
                .allowedHeaders("Content-Type", "Accept", "Origin")
    }
}


// @Configuration
// class AwsConfiguration {
//
//     @Value("\${app.aws.s3.bucketRegion}")
//     protected val awsBucketRegion: String? = null
//
//     @Bean
//     fun s3Client() : AmazonS3 {
//         return AmazonS3ClientBuilder.standard()
//                 .withRegion(getRegions())
//                 .build()
//     }
//
//     protected fun getRegions() : Regions {
//         return Regions.fromName(awsBucketRegion) ?: Regions.US_EAST_1
//     }
// }
