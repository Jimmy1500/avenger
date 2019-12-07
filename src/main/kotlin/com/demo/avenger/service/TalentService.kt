package com.demo.avenger.service

import com.demo.avenger.dto.jpa.Talent
import com.demo.avenger.repository.TalentRepository
import org.springframework.stereotype.Service
import javax.transaction.Transactional
import java.util.*

@Service
class TalentService(protected val talentRepository: TalentRepository) {

    fun getAll() : Iterable<Talent> {
        return talentRepository.findAll()
    }

    @Transactional
    fun deleteAllByFirstName(firstName: String) {
        return talentRepository.removeAllByFirstName(firstName)
    }

}
