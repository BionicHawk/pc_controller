package com.bionichawk.pc_controller

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.PrintWriter
import java.net.Socket

class MainActivity: FlutterActivity() {

    private val channel = "bionichawk.com/sendData"
    private lateinit var socket: Socket
    private lateinit var socketWriter: PrintWriter

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler {
            call, result ->

            when (call.method) {
                "openConnection" -> {
                    val address = call.argument<String>("address")
                    val port = call.argument<UShort>("port")

                    if (address != null && port != null) {
                        openSocketChannel(address, port)
                        result.success("connected!")
                    } else {
                        result.error("2",
                            "Lack of arguments",
                            "address or port were not given"
                        )
                    }
                }

                "sendPosition" -> {
                    val x = call.argument<Double>("x")
                    val y = call.argument<Double>("y")
                    val z = call.argument<Double>("z")

                    if (x != null && y != null && z != null) {
                        sendPosition(x, y, z)
                        result.success("sent!")
                    } else {
                        result.error("2",
                            "Lack of arguments",
                            "x, y, and or z were not given"
                        )
                    }
                }

                "closeConnection" -> {
                    closeSocketChannel()
                    result.success("closed!")
                }

                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun openSocketChannel(address: String, port: UShort) {
        socket = Socket(address, port.toInt())
        socketWriter = PrintWriter(socket.getOutputStream())
    }

    private fun closeSocketChannel() {
        socket.close()
    }

    private fun sendPosition(x: Double, y: Double, z: Double) {
        socketWriter.println("/set_pos ${formatPosition(x, y, z)}")
    }

    private fun formatPosition(x: Double, y: Double, z: Double): String {
        return "{x:$x} {y:$y} {z:$z}"
    }

}
