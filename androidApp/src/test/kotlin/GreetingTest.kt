package org.konan.multiplatform

import org.greeting.Greeting
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4

@RunWith(JUnit4::class)
class GreetingTest {

    @Test
    fun should_print_hello_android_from_android_mpp() {
        assertEquals(Greeting().greeting(), "Hello, Android")
    }
}

// Note that common tests for calculator (i.e. `CalculatorTest`) can be run from `greeting`
// with `test` Gradle task.