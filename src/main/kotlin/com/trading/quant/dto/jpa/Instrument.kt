package com.trading.quant.dto.jpa

import java.io.Serializable
import java.util.*
import javax.persistence.*

@Entity
@Table(name = "instrument", schema = "public")
data class Instrument (
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    var id: UUID? = null,

    @Column(name = "symbol")
    var symbol: String = "",

    @Column(name = "cusip", nullable = false, unique = true)
    var cusip: String = "",

    @Column(name = "description")
    var description: String = "",

    @Column(name = "exchange", nullable = false)
    var exchange: String = "",

    @Column(name = "type")
    var type: String = ""
): Serializable
