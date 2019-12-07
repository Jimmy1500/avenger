package com.demo.avenger.config

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.client.HttpClientErrorException
import org.springframework.web.bind.annotation.*

import com.demo.avenger.dto.jpa.Talent
import com.demo.avenger.service.TalentService

@RestController
@RequestMapping("/talent")
class TalentController(protected val talentService: TalentService) {

    @GetMapping
    fun getAll() : ResponseEntity<Iterable<Talent>> {
        val talents = talentService.getAll()
        return ResponseEntity(talents, HttpStatus.OK)
    }

    @DeleteMapping
    fun deleteAllByFirstName(firstName: String) {
        talentService.deleteAllByFirstName(firstName)
    }

}