package org.konan.multiplatform

import android.app.Application
import android.os.Bundle
import android.widget.LinearLayout
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import org.greeting.Greeting
import kotlin.properties.Delegates

class MyApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        println("Application init")
    }
}

class MainActivity : AppCompatActivity() {

    private var rootLayout: LinearLayout by Delegates.notNull()

    private val greeting: Greeting = Greeting()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        rootLayout = findViewById(R.id.main_view)
        rootLayout.removeAllViews()

        val tv = TextView(this)
/*
        val product = Factory.create(mapOf("user" to "JetBrains"))
        tv.text = product.toString()
*/
        tv.text = greeting.greeting()

        rootLayout.addView(tv)
    }
}