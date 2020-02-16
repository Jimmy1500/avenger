package com.trading.quant

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class QuantApplication

fun main(args: Array<String>) {
	runApplication<QuantApplication>(*args)
}
