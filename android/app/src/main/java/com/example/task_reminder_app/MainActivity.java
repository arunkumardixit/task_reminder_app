package com.example.task_reminder_app;

import android.app.NotificationChannel;
import android.app.NotificationManager;

import androidx.annotation.NonNull;
import androidx.core.app.NotificationManagerCompat;

import dev.ad.pigeon.TaskTestModuleNativeAPI;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;

public class MainActivity extends FlutterActivity {
    String ChannelName = "ChannelName";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        com.example.task_reminder_app.TaskTestModuleNativeInterface.TaskTestModuleNative.setUp(flutterEngine.getDartExecutor().getBinaryMessenger(), new TaskTestModuleNativeAPI(getContext()));
        FlutterEngineCache
                .getInstance ()
                .put("engine_id_task", flutterEngine);
        NotificationManagerCompat notificationManager = NotificationManagerCompat.from(this);
        NotificationChannel notificationChannel = null;
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
            notificationChannel = new NotificationChannel(String.valueOf(R.string.ChannelID),
                    ChannelName,
                    NotificationManager.IMPORTANCE_DEFAULT);
            notificationManager.createNotificationChannel(notificationChannel);
        }

    }
}
