package com.demo.avenger.config

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.client.HttpClientErrorException
import org.springframework.web.bind.annotation.*

import com.demo.avenger.dto.jpa.Talent
import com.demo.avenger.service.TalentService
// import com.demo.avenger.repository.TalentRepository

@RestController
@RequestMapping("/talent")
class TalentController {
    @Autowired
    protected val talentService: TalentService? = null

    @GetMapping
    fun getAll() : ResponseEntity<Iterable<Talent>> {
        val talents = talentService?.getAll()!!
        return ResponseEntity(talents, HttpStatus.OK)
    }

}