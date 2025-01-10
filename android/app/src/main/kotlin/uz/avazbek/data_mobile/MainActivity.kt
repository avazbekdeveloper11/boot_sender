package uz.avazbek.data_mobile

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.Settings
import android.util.Log
import androidx.core.app.NotificationCompat
import io.flutter.embedding.android.FlutterFragmentActivity
import okhttp3.OkHttpClient
import okhttp3.Request
import okhttp3.Response
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import android.os.PowerManager


class MainActivity : FlutterFragmentActivity() {

    override fun onCreate(savedInstanceState: android.os.Bundle?) {
        super.onCreate(savedInstanceState)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            val packageName = applicationContext.packageName
            val pm = getSystemService(PowerManager::class.java) as PowerManager
            if (!pm.isIgnoringBatteryOptimizations(packageName)) {
                val intent = Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS).apply {
                    data = Uri.parse("package:$packageName")
                    addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                }
                try {
                    startActivity(intent)
                } catch (e: Exception) {
                    showErrorNotification(e.localizedMessage, this)
                }
            }
        }
    }

    private fun showErrorNotification(errorMessage: String, context: Context) {
        val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channelId = "error_notification_channel"
            val channelName = "Error Notification"
            val channel = NotificationChannel(
                channelId,
                channelName,
                NotificationManager.IMPORTANCE_HIGH
            )

            notificationManager.createNotificationChannel(channel)

            val notification: Notification = NotificationCompat.Builder(context, channelId)
                .setContentTitle("Xatolik yuz berdi")
                .setContentText(errorMessage)
                .setSmallIcon(R.mipmap.ic_launcher)
                .build()

            notificationManager.notify(1, notification)
        }
    }
}

class BootReceiver : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action == Intent.ACTION_BOOT_COMPLETED) {
            try {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                    val packageName = context.packageName
                    val pm = context.getSystemService(PowerManager::class.java) as PowerManager
                    if (!pm.isIgnoringBatteryOptimizations(packageName)) {
                        val batteryIntent = Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS).apply {
                            data = Uri.parse("package:$packageName")
                            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                        }
                        try {
                            context.startActivity(batteryIntent)
                        } catch (e: Exception) {
                            Log.e(e.localizedMessage, context)
                        }
                    }
                }

                CoroutineScope(Dispatchers.IO).launch {
                    getApiData(context)
                }

            } catch (e: Exception) {
                showErrorNotification(e.localizedMessage, context)
            }
        }
    }

    private suspend fun getApiData(context: Context) {
        val client = OkHttpClient()
        val request = Request.Builder()
            .url("https://nbu.uz/exchange-rates/json/")
            .build()

        try {
            val response: Response = client.newCall(request).execute()
            if (response.isSuccessful) {
                val responseData = response.code?.string()
                Log.d("BootReceiver", "API response: $responseData")
                showNotification(responseData ?: "No data", context)
            } else {
                Log.e("BootReceiver", "API request failed: ${response.code}")
                showNotification("API so'rovi xato bo'ldi.", context)
            }
        } catch (e: Exception) {
            Log.e("BootReceiver", "Error: $e")
            showNotification("Xatolik yuz berdi: $e", context)
        }
    }

    private suspend fun showNotification(message: String, context: Context) {
        withContext(Dispatchers.Main) {
            val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                val channelId = "api_response_channel"
                val channelName = "API Response"
                val channel = NotificationChannel(
                    channelId,
                    channelName,
                    NotificationManager.IMPORTANCE_HIGH
                )
                notificationManager.createNotificationChannel(channel)

                val notification: Notification = NotificationCompat.Builder(context, channelId)
                    .setContentTitle("API Response")
                    .setContentText(message)
                    .setSmallIcon(R.mipmap.ic_launcher)
                    .build()

                notificationManager.notify(1, notification)
            }
        }
    }

    private fun showErrorNotification(errorMessage: String, context: Context) {
        val notificationManager = context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channelId = "error_notification_channel"
            val channelName = "Error Notification"
            val channel = NotificationChannel(
                channelId,
                channelName,
                NotificationManager.IMPORTANCE_HIGH
            )

            notificationManager.createNotificationChannel(channel)

            val notification: Notification = NotificationCompat.Builder(context, channelId)
                .setContentTitle("Xatolik yuz berdi")
                .setContentText(errorMessage)
                .setSmallIcon(R.mipmap.ic_launcher)
                .build()

            notificationManager.notify(2, notification)
        }
    }
}
