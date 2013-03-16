$(document).ready(function () {
  // For stop page
  if (isFavorited(getCurrentStopId())) {
    updateFavoriteLink("a.favorite", true);
  }

  $("a.favorite").click(function () {
    var favorited = !$(this).hasClass("favorited");
    updateFavoriteLink(this, favorited)
    saveFavoriteStatus(getCurrentStopId(), favorited);
  });

  // List of favorites on home page
  var favIds = getFavorites();
  $(".favorites-headline").each(function (idx) {
    var stopId = favIds[idx];
    $(this).text(stopId);
    $(this).closest("a").attr("href", "/stops/" + stopId);
  });

  // Helpers
  function getCurrentStopId () {
    var id = location.pathname.match(/\d+$/);
    return id && id.length ? id[0] : null;
  }

  function updateFavoriteLink (el, favorited) {
    if (favorited) {
      $(el).addClass("favorited").find(".text").text("favorited");
    } else {
      $(el).removeClass("favorited").find(".text").text("favorite");
    }
  }

  function getFavorites () {
    var favs = JSON.parse(localStorage.getItem("favorites"));
    return favs || [];
  }

  function isFavorited (stopId) {
    return getFavorites().indexOf(stopId) !== -1;
  }

  function saveFavoriteStatus (stopId, favorited) {
    var favs = getFavorites();
    if (favorited) {
      favs.push(stopId);
    } else {
      var idx = favs.indexOf(stopId);
      if (idx !== -1) {
        favs.splice(idx, 1);
      }
    }
    localStorage.setItem("favorites", JSON.stringify(favs));
  }
});
