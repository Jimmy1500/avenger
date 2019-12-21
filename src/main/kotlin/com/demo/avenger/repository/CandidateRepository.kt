package com.demo.avenger.repository

import org.springframework.data.repository.CrudRepository
import org.springframework.stereotype.Repository

import java.util.UUID
import com.demo.avenger.dto.jpa.Candidate

@Repository
interface CandidateRepository : CrudRepository<Candidate, UUID> {
    fun findByEmail(email: String) : Candidate?
    fun findAllByFirstName(firstName: String): Iterable<Candidate?>
    fun removeAllByFirstName(firstName: String)
}