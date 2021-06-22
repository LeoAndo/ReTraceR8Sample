package com.example.retracer8sample.ui.main

import android.os.Bundle
import android.view.View
import android.widget.Button
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController
import com.example.retracer8sample.R
import com.example.retracer8sample.model.User

class MainFragment : Fragment(R.layout.main_fragment) {
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        view.findViewById<Button>(R.id.button_go_to_fragment).setOnClickListener {
            findNavController().navigate(
                MainFragmentDirections.actionMainFragmentToSecondFragment(
                    User(
                        name = "Leo",
                        age = 20
                    )
                )
            )
        }
    }
}