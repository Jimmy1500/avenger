package com.trading.quant.dto.jpa

import com.fasterxml.jackson.annotation.JsonIgnore
import java.io.Serializable
import java.util.*
import javax.persistence.*

@Entity
@Table(name = "quote", schema = "public")
data class Quote (
        @Id
        @GeneratedValue(strategy = GenerationType.AUTO)
        var id: UUID? = null,

        @ManyToOne
        @JoinColumn(name = "instrument_id")
        var instrument: Instrument? = null
): Serializable
