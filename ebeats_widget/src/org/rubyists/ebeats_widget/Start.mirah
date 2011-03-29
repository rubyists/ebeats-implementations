package org.rubyists.ebeats_widget

import java.util.Calendar
import java.util.TimeZone

import android.app.Activity
import android.app.AlarmManager
import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.BroadcastReceiver
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.os.SystemClock
import android.util.Log
import android.widget.RemoteViews
import android.widget.TextView

class Start < AppWidgetProvider
  def onDisabled(context:Context)
    Log.d "EbeatsWidget", "onDisabled"

    intent = Intent.new(context, Start.class)
    pending = PendingIntent.getBroadcast(context, 0, intent, 0)
    manager = AlarmManager(context.getSystemService(Context.ALARM_SERVICE))
    manager.cancel(pending)

  rescue Exception => ex
    Log.e "EbeatsWidget", ex.getMessage
  end

  def onUpdate(context:Context, manager:AppWidgetManager, ids:int[])
    @context = context
    @manager = manager
    @ids = ids

    alarm = AlarmManager(context.getSystemService(Context.ALARM_SERVICE))
    intent = Intent.new(context, AlarmReceiver.class)

    pending = PendingIntent.getBroadcast(context, 0, intent, 0)
    alarm.setRepeating(AlarmManager.ELAPSED_REALTIME, SystemClock.elapsedRealtime, 10000, pending)

  rescue Exception => ex
    Log.e "EbeatsWidget", ex.getMessage
  end
end

class AlarmReceiver < BroadcastReceiver
  def onReceive(context:Context, intent:Intent)
    views = RemoteViews.new(context.getPackageName, R.layout.main)
    views.setTextViewText(R.id.beats, currentBeats)

    component = ComponentName.new(context, Start.class)
    manager = AppWidgetManager.getInstance(context) 
    ids = manager.getAppWidgetIds(component)
    ids.each do |id|
      manager.updateAppWidget(id, views)
    end
  rescue Exception => ex
    Log.e "EbeatsWidget", ex.getMessage
  end

  def currentBeats
    now = Calendar.getInstance(TimeZone.getTimeZone("UTC"))
    beats = now.get(Calendar.HOUR_OF_DAY) * (1000.0 / 24.0) +
            now.get(Calendar.MINUTE)      * (1000.0 / (24.0 * 60.0)) +
            now.get(Calendar.SECOND)      * (1000.0 / (24.0 * 60.0 * 60.0))

    String.format("@%.1f", [beats].toArray)
  end
end
