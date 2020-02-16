package com.trading.quant.controller

import com.trading.quant.dto.jpa.Instrument
import com.trading.quant.service.InstrumentService
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/asset")
class InstrumentController (protected val instrumentService: InstrumentService) {
    @GetMapping
    fun getAll() : ResponseEntity<List<Instrument>> {
        return ResponseEntity(instrumentService.getAll(), HttpStatus.OK)
    }

    @GetMapping("/symbol/{symbol}")
    fun getAllSymbol(@PathVariable symbol: String) : ResponseEntity<List<Instrument>> {
        return ResponseEntity(instrumentService.getAllBySymbol(symbol), HttpStatus.OK)
    }

    @GetMapping("/cusip/{cusip}")
    fun getByCusip(@PathVariable cusip: String): ResponseEntity<*> {
        return try {
            ResponseEntity(instrumentService.getByCusip(cusip), HttpStatus.OK)
        } catch (e: Exception) {
            ResponseEntity("Failed to get instrument by cusip (${cusip})", HttpStatus.BAD_REQUEST)
        }
    }

    @PutMapping
    private fun put(@RequestBody instrument: Instrument): ResponseEntity<*> {
        return try {
            ResponseEntity(instrumentService.save(instrument), HttpStatus.OK)
        } catch (e: Exception) {
            ResponseEntity("Failed to save instrument", HttpStatus.BAD_REQUEST)
        }
    }
}