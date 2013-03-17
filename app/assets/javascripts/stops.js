$(document).ready(function () {
  Handlebars.registerHelper('arrivingClass', function (train) {
    return train.time < 1 ? 'arriving' : '';
  });

  if ($("#wrapper.stop").length) {
    getStopData(getCurrentStopId(), function (stopData) {
      var markup = HandlebarsTemplates['stops/arriving_trains']({
        direction: "UPTOWN",
        upcoming_trains: stopData.uptown
      });
      markup += HandlebarsTemplates['stops/arriving_trains']({
        direction: "DOWNTOWN",
        upcoming_trains: stopData.downtown
      });
      $("#wrapper.stop").append(markup);
    });
  }
});
