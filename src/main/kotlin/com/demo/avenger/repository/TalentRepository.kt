package com.demo.avenger.repository

import org.springframework.data.repository.CrudRepository
import org.springframework.stereotype.Repository
import java.util.UUID
import com.demo.avenger.dto.jpa.Talent

@Repository
interface TalentRepository : CrudRepository<Talent, UUID> {
    fun findByEmail(email: String) : Talent?
}