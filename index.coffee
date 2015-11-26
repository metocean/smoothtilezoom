module.exports = (range) ->
  zooms = []
  (zoom) ->
    now = new Date().getTime()
    langolier = 0
    total = zoom
    for z, i in zooms
      if z.t < now - range
        # clip any values that are older than range
        langolier = i
      else
        # average values within range
        total += z.z
    # langoliers eat time
    zooms.splice 0, langolier
    # only apply smoothing if we have values in range
    if zooms.length > 0
      # average the last zooms
      averaged = Math.floor total / zooms.length
      # and make sure the zoom is within 1 of current zoom
      zoom = Math.max zoom - 1, Math.min zoom + 1, averaged
    zooms.push
      t: now
      z: zoom
    zoom
