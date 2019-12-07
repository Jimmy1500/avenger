package com.demo.avenger.config

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.client.HttpClientErrorException
import org.springframework.web.bind.annotation.*

import com.demo.avenger.dto.jpa.Talent
import com.demo.avenger.repository.TalentRepository

@RestController
@RequestMapping("/talent")
class TalentController {
    @Autowired
    protected val talentRepository: TalentRepository? = null

    @GetMapping
    fun getAll() : ResponseEntity<Iterable<Talent>> {
        val talents = talentRepository?.findAll()!!
        return ResponseEntity(talents, HttpStatus.OK)
    }

}