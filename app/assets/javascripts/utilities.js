function getCurrentStopId () {
  var id = location.pathname.match(/\d+$/);
  return id && id.length ? id[0] : null;
}

function getStopData (stopId, cb) {
  if (typeof stopId === "object") {
    stopId = stopId.join(",");
  }
  $.getJSON("/stops/" + stopId, cb);
}


