package com.demo.avenger.dto.jpa

import com.fasterxml.jackson.annotation.JsonIgnore
import org.springframework.data.annotation.CreatedDate
import org.springframework.data.annotation.LastModifiedDate
import java.io.Serializable
import java.util.*
import javax.persistence.*


@Entity
data class Candidate (
        @Id
        @GeneratedValue(strategy = GenerationType.AUTO)
        // @org.hibernate.annotations.Type(type="org.hibernate.type.PostgresUUIDType")
        var id: UUID? = null,

        @Column(name = "first_name")
        var firstName: String = "",

        @Column(name = "middle_initial")
        var middleName: String? = null,

        @Column(name = "last_name")
        var lastName: String = "",

        @Column(name = "email")
        var email: String = "",

        @CreatedDate
        var created: Date? = null,

        @LastModifiedDate
        var updated: Date = Date()
) : Serializable