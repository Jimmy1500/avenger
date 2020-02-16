package com.trading.quant.service

import com.trading.quant.dto.jpa.Instrument
import com.trading.quant.repository.InstrumentRepository
import org.springframework.http.HttpStatus
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import org.springframework.web.client.HttpClientErrorException
import java.util.*

@Service
class InstrumentService (protected val instrumentRepository: InstrumentRepository){

    fun getAll(): List<Instrument> {
        return instrumentRepository.findAll()
    }

    fun getAllBySymbol(symbol: String): List<Instrument> {
        return instrumentRepository.findAllBySymbol(symbol)
    }

    fun getByCusip(cusip: String): Instrument {
        return instrumentRepository.findByCusip(cusip).orElseThrow {
            HttpClientErrorException(HttpStatus.BAD_REQUEST, "cusip (${cusip}) not found.")
        }
    }

    fun save(instrument: Instrument): Instrument {
        return instrumentRepository.save(instrument)
    }
}