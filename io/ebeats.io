Date beats := method(
  rate := method(r,
    1000 / (24 * r)
  )
  now  := self convertToUTC
  
  "@" .. ( (now hour   * rate(      1)) +
           (now minute * rate(     60)) +
           (now second * rate(60 * 60))
         ) asString(0 , 2)
)

Date beats println