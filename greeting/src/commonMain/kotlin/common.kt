package org.greeting

import com.soywiz.klock.DateTime
import com.suparnatural.core.fs.FileSystem

expect class Platform() {
    val platform: String
}

class Greeting {

    fun greeting(): String {
        val cacheDir = FileSystem.cachesDirectory.absolutePath
        val time = DateTime.nowLocal()
        return "Hello, ${Platform().platform} \nat $time cacheDir = $cacheDir"
    }
}
