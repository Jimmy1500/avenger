package com.demo.avenger.config

import org.springframework.web.bind.annotation.*
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/")
class BaseController {
    @GetMapping
    fun base(): ResponseEntity<HashMap<String, String>> {
        val response = HashMap<String, String>()
        response["message"] = "AVENGER MAIN"
        response["status"] = "OK"
        return ResponseEntity.ok(response)
    }

    @GetMapping("/health")
    fun health(): ResponseEntity<HashMap<String, String>> {
        val response = HashMap<String, String>()
        response["status"] = "OK"
        return ResponseEntity.ok(response)
    }
}