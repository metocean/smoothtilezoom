module.exports = (range) ->
  zooms = []
  (zoom) ->
    now = new Date().getTime()
    langolier = 0
    total = zoom
    for z, i in zooms
      if z.t < now - range
        langolier = i
      else
        total += z.z
    zooms.splice 0, langolier
    if zooms.length > 0
      averaged = Math.floor total / zooms.length
      zoom = Math.max zoom - 1, Math.min zoom + 1, averaged
    zooms.push
      t: now
      z: zoom
    zoom
