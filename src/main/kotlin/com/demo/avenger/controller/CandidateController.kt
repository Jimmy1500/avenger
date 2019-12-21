package com.demo.avenger.config

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.client.HttpClientErrorException
import org.springframework.web.bind.annotation.*

import com.demo.avenger.dto.jpa.Candidate
import com.demo.avenger.service.CandidateService

@RestController
@RequestMapping("/candidate")
class CandidateController(protected val candidateService: CandidateService) {

    @GetMapping
    fun getAll() : ResponseEntity<Iterable<Candidate>> {
        val candidates = candidateService.getAll()
        return ResponseEntity(candidates, HttpStatus.OK)
    }

    @DeleteMapping
    fun deleteAllByFirstName(firstName: String) {
        candidateService.deleteAllByFirstName(firstName)
    }

}
