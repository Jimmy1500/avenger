package com.demo.avenger.service

import com.demo.avenger.dto.jpa.Candidate
import com.demo.avenger.repository.CandidateRepository
import org.springframework.stereotype.Service
import javax.transaction.Transactional
import java.util.*

@Service
class CandidateService(protected val candidateRepository: CandidateRepository) {

    fun getAll() : Iterable<Candidate> {
        return candidateRepository.findAll()
    }

    @Transactional
    fun deleteAllByFirstName(firstName: String) {
        return candidateRepository.removeAllByFirstName(firstName)
    }

}
