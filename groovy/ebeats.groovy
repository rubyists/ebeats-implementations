now = Calendar.getInstance(TimeZone.getTimeZone("UTC"))
beats = now.get(Calendar.HOUR_OF_DAY) * (1000.0 / 24.0) +
        now.get(Calendar.MINUTE) * (1000.0 / (24.0 * 60.0)) + 
        now.get(Calendar.SECOND) * (1000.0 / (24.0 * 60.0 * 60.0))

println String.format("@%.2f", beats)