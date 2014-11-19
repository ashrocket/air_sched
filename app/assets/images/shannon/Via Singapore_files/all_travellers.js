(function() {
  window.App = typeof App !== "undefined" && App !== null ? App : {};

  App.AllTravellers = (function() {
    function AllTravellers(manager, customBags) {
      this.manager = manager;
      this.container = $('#ad-checked-item-all');
      this.customBags = customBags;
      this.airlines = this.customBags.airlines;
      this.trips = [];
      this.trips_setup = null;
      this.initialiseTrips();
    }

    AllTravellers.prototype.initialiseTrips = function() {
      if (!this.trips_setup) {
        this.trips.push(new App.TravellerTrip(this.manager, this, 'leave'));
        if (this.container.find(".ad-checked-return-cell").length === 1) {
          this.trips.push(new App.TravellerTrip(this.manager, this, 'return'));
        }
        return this.trips_setup = true;
      }
    };

    AllTravellers.prototype.deSelect = function() {
      return $.each(this.trips, (function(_this) {
        return function(index, trip) {
          return trip.deSelect();
        };
      })(this));
    };

    AllTravellers.prototype.setCustom = function() {
      return this.customBags.setCustom();
    };

    AllTravellers.prototype.dirty = function() {
      return this.customBags.dirty();
    };

    AllTravellers.prototype.changeAllTripsTo = function(val, way) {
      return this.customBags.changeTravellersTo(val, way);
    };

    AllTravellers.prototype.save = function(action) {
      this.deSelect();
      $.each(this.trips, (function(_this) {
        return function(index, trip) {
          var res;
          return res = trip.save(action);
        };
      })(this));
      return [];
    };

    AllTravellers.prototype.changeTrips = function(val) {
      this.deSelect();
      return $.each(this.trips, (function(_this) {
        return function(index, trip) {
          return trip.changeTo(val);
        };
      })(this));
    };

    return AllTravellers;

  })();

}).call(this);
