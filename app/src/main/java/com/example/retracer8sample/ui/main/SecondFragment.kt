package com.example.retracer8sample.ui.main

import android.os.Bundle
import android.view.View
import android.widget.TextView
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.navArgs
import com.example.retracer8sample.R

class SecondFragment : Fragment(R.layout.fragment_second) {
    private val safeArgs: SecondFragmentArgs by navArgs()

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        view.findViewById<TextView>(R.id.name).text = safeArgs.user.name
        view.findViewById<TextView>(R.id.age).text = safeArgs.user.age.toString()
    }
}