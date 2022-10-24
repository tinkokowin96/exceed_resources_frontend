package com.example.exceed_resources_frontend

import android.Manifest
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.os.PersistableBundle
import android.util.Log
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


class MainActivity : FlutterActivity() {
    private val CHANNEL = "exceed_resources"
    private lateinit var channelResult: MethodChannel.Result

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            channelResult = result
            when (call.method) {
                "location" -> {
                    requestPermission(Manifest.permission.ACCESS_FINE_LOCATION,  101)
                }
                "read"-> {
                    requestPermission(Manifest.permission.READ_EXTERNAL_STORAGE,  102)
                }
                "write" -> {
                    requestPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE,  103)
                }
                "mediaLocation" -> {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                        requestPermission(Manifest.permission.ACCESS_MEDIA_LOCATION,  105)
                    } else {
                        channelResult.success(mapOf("granted" to true, "message" to ""))
                    }
                }
            }
        }
    }

    private fun requestPermission(permission: String, requestCode: Int) {
        val status = ContextCompat.checkSelfPermission(this, permission)
         if (status == PackageManager.PERMISSION_DENIED) {
            ActivityCompat.requestPermissions(this, arrayOf(permission), requestCode)
        } else {
            channelResult.success(mapOf("granted" to true, "message" to ""))
         }
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if(grantResults[0] == PackageManager.PERMISSION_GRANTED){
            channelResult.success(mapOf("granted" to true, "message" to ""))
        }
        else {
            lateinit var name: String
            when(requestCode){
                101 -> name = "Location"
                102, 103, 104,105 -> name = "Storage"
            }
            channelResult.success(mapOf("granted" to false, "message" to "$name permission denied"))
        }

    }
}
