package dev.ad.pigeon;

import static androidx.core.content.ContextCompat.getSystemService;
import static dev.ad.pigeon.TaskTestModuleNativeAPI.NOTIFICATION_CHANNEL_ID;


import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.widget.Toast;

import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;
import androidx.core.content.ContextCompat;

import com.example.task_reminder_app.MainActivity;
import com.example.task_reminder_app.R;

import java.util.Random;

public class TaskNotificationReceiver extends BroadcastReceiver {
    public static String NOTIFICATION_ID = "notification_id" ;
//
    public static String NOTIFICATION = "notification" ;
    public static final String NOTIFICATION_TITLE = "TITLE" ;
    public static final String NOTIFICATION_DESC = "DESC" ;
    NotificationManagerCompat notificationManager;



    @Override
    public void onReceive(Context context, Intent intent) {
        Toast.makeText(context, "Alarm triggered", Toast.LENGTH_LONG).show();
        int id = intent.getIntExtra( NOTIFICATION_ID, 0 ) ;
        //GET title and Desc from intent and create notification
        String title = intent.getStringExtra( NOTIFICATION_TITLE ) ;
        String desc = intent.getStringExtra( NOTIFICATION_DESC ) ;

        Intent broadcastIntent = new Intent(context, ActionReceiver.class);
        broadcastIntent.setAction("Mark As Done");

        //broadcastIntent.putExtra(NOTIFICATION_ID,id);
        broadcastIntent.putExtra(NOTIFICATION_TITLE,title);
        PendingIntent pendingIntent = PendingIntent.getBroadcast(context, 0, broadcastIntent, PendingIntent.FLAG_IMMUTABLE);


        notificationManager = NotificationManagerCompat.from(context);

        try {
            NotificationCompat.Builder builder = new NotificationCompat.Builder(context, String.valueOf(R.string.ChannelID));
            Notification notification = builder.setPriority(NotificationCompat.PRIORITY_MAX)
                        .setContentTitle(title)
                        .setContentText(desc)
                        .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
                        .setSmallIcon(R.drawable.ic_launcher_foreground)
                        .setVibrate(new long[]{1000, 2000})
                        .addAction(R.drawable.ic_launcher_foreground, "Mark As Done", pendingIntent)
                        .setAutoCancel(true)
                        .build();

                if (notificationManager != null) {
                    //assert notificationData != null;
                    notificationManager.notify(1, notification);
                }
        }
        catch (Exception e ) {
            System.out.println(e.getMessage());
        }



    }
}