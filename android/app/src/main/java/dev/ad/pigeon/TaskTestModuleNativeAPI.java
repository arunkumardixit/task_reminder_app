package dev.ad.pigeon;

import static android.app.Notification.EXTRA_NOTIFICATION_ID;
import static androidx.core.content.ContextCompat.getSystemService;

import static dev.ad.pigeon.TaskNotificationReceiver.NOTIFICATION;
import static dev.ad.pigeon.TaskNotificationReceiver.NOTIFICATION_DESC;
import static dev.ad.pigeon.TaskNotificationReceiver.NOTIFICATION_ID;
import static dev.ad.pigeon.TaskNotificationReceiver.NOTIFICATION_TITLE;

import android.app.AlarmManager;
import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.core.app.NotificationCompat;

import com.example.task_reminder_app.R;
import com.example.task_reminder_app.TaskTestModuleNativeInterface;

import java.util.Calendar;
import java.util.Random;

public class TaskTestModuleNativeAPI implements TaskTestModuleNativeInterface.TaskTestModuleNative {

    public static final String NOTIFICATION_CHANNEL_ID = "10001" ;


    private final static String default_notification_channel_id = "default" ;

    private final Context mContext;

    public TaskTestModuleNativeAPI(Context mContext) {
        this.mContext = mContext;
    }
    @Override
    public void addNotification(@NonNull TaskTestModuleNativeInterface.NativeTaskConfig task) {
        int hour = task.getHour().intValue();
        int minute = task.getMinute().intValue();
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(System.currentTimeMillis());
        calendar.set(Calendar.HOUR_OF_DAY, task.getHour().intValue());
        calendar.set(Calendar.MINUTE, task.getMinute().intValue());
        Toast.makeText(mContext,"Picked time: "+ hour +":"+minute, Toast.LENGTH_LONG).show();
        scheduleNotification(task.getTitle(),task.getDescription(),calendar);

    }

    private void scheduleNotification (String title, String desc, Calendar calendar) {
        Intent notificationIntent = new Intent( mContext, TaskNotificationReceiver.class ) ;
        Random r = new Random();
        notificationIntent.putExtra (NOTIFICATION_ID , r.nextInt() ) ;
        notificationIntent.putExtra( NOTIFICATION_TITLE , title) ;
        notificationIntent.putExtra( NOTIFICATION_DESC , desc) ;
        PendingIntent pendingIntent = PendingIntent.getBroadcast ( mContext, 0 , notificationIntent , PendingIntent.FLAG_IMMUTABLE ) ;
        AlarmManager alarmManager = (AlarmManager)mContext.getSystemService(Context.ALARM_SERVICE);
        assert alarmManager != null;
        alarmManager.set(AlarmManager. RTC_WAKEUP , calendar.getTimeInMillis() , pendingIntent) ;
    }

}