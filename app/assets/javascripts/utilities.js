function getCurrentStopId () {
  var id = location.pathname.match(/\d+$/);
  return id && id.length ? id[0] : null;
}

function getStopData (stopId, cb) {
  $.getJSON("/stops/" + getCurrentStopId(), cb);
}


