package com.trading.quant.repository

import com.trading.quant.dto.jpa.Instrument
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository
import java.util.*

@Repository
interface InstrumentRepository: JpaRepository<Instrument, UUID>{
    fun findAllBySymbol(symbol: String): List<Instrument>
    fun findByCusip(symbol: String): Optional<Instrument>
}
