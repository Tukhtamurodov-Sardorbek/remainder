//package com.example.remainder
//
//import android.app.AlarmManager
//import android.content.Context
//import android.content.Intent
//import android.net.Uri
//import android.os.Build
//import android.provider.Settings
//import io.flutter.embedding.engine.plugins.FlutterPlugin
//import io.flutter.plugin.common.MethodCall
//import io.flutter.plugin.common.MethodChannel
//
//class AlarmPermissionHelper: FlutterPlugin, MethodChannel.MethodCallHandler {
//    private lateinit var channel: MethodChannel
//    private lateinit var context: Context
//
//    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
//        channel = MethodChannel(binding.binaryMessenger, "alarm_permission")
//        channel.setMethodCallHandler(this)
//        context = binding.applicationContext
//    }
//
//    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
//        channel.setMethodCallHandler(null)
//    }
//
//    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
//        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
//
//        when (call.method) {
//            "canScheduleExactAlarms" -> {
//                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
//                    result.success(alarmManager.canScheduleExactAlarms())
//                } else {
//                    result.success(true) // always allowed pre-Android 12
//                }
//            }
//            "openExactAlarmSettings" -> {
//                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
//                    val intent = Intent(Settings.ACTION_REQUEST_SCHEDULE_EXACT_ALARM).apply {
//                        data = Uri.parse("package:" + context.packageName)
//                        addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
//                    }
//                    context.startActivity(intent)
//                }
//                result.success(null)
//            }
//            else -> result.notImplemented()
//        }
//    }
//}
