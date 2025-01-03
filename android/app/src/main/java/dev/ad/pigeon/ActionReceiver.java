package dev.ad.pigeon;

import static dev.ad.pigeon.TaskNotificationReceiver.NOTIFICATION_TITLE;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

import androidx.annotation.NonNull;

import com.example.task_reminder_app.TaskTestModuleNativeInterface;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;

public class ActionReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        String title = intent.getStringExtra(NOTIFICATION_TITLE);
        assert action != null;
        if(action.equals("Mark As Done")){
            performAction1(title);
        }
        //This is used to close the notification tray
//        Intent it = new Intent(Intent.ACTION_CLOSE_SYSTEM_DIALOGS);
//        context.sendBroadcast(it);
    }

    public void performAction1(String taskTitle){
        //Update
        try {
            FlutterEngine flutterEngine = FlutterEngineCache
                    .getInstance ()
                    .get("engine_id_task");
            assert flutterEngine != null;
            TaskTestModuleNativeInterface.NativeTaskConfig nativeTaskConfig = new TaskTestModuleNativeInterface.NativeTaskConfig.Builder()
                    .setTitle(taskTitle)
                    .setDescription("")
                    .setHour(5L)
                    .setMinute(5L)
                    .setReminderTime("")
                    .build();
            com.example.task_reminder_app.TaskTestModuleNativeInterface.TaskTestModuleFlutter taskTestModuleFlutter =
                    new com.example.task_reminder_app.TaskTestModuleNativeInterface.TaskTestModuleFlutter(
                    flutterEngine.getDartExecutor().getBinaryMessenger()
            );
            taskTestModuleFlutter.updateTask(nativeTaskConfig,
                    new TaskTestModuleNativeInterface.VoidResult() {

                        @Override
                        public void success() {
                            System.out.println("success");
                        }

                        @Override
                        public void error(@NonNull Throwable error) {
                            System.out.println(error.getMessage());
                        }

                    }
            );

        }catch(Exception e) {
            System.out.println(e.getMessage());
        }

    }

}