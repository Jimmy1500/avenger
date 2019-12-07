package com.demo.avenger

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class AvengerApplication

fun main(args: Array<String>) {
	runApplication<AvengerApplication>(*args)
}
