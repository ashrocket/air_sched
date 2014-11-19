(function() {
  window.App = typeof App !== "undefined" && App !== null ? App : {};

  App.Traveller = (function() {
    function Traveller(manager, customBags, container) {
      this.manager = manager;
      this.container = container;
      this.customBags = customBags;
      this.selector = this.container.find('.ad-checked-name .weight-selector');
      this.bagPrice = this.container.find('.ad-checked-bags-traveller-price');
      this.leaveWeight = "0kg";
      this.returnWeight = "0kg";
      this.selector.chosen({
        allow_single_deselect: true,
        width: "150px"
      });
      this.airlines = this.customBags.airlines;
      this.trips = [];
      this.trips_setup = null;
      this.initialiseTrips();
      this.setupChangeEvents();
    }

    Traveller.prototype.setupChangeEvents = function() {
      return this.selector.on('change', (function(_this) {
        return function(e) {
          if (_this.selector.val() !== 'select' && _this.selector.val() !== 'custom') {
            return _this.changeTrips();
          }
        };
      })(this));
    };

    Traveller.prototype.initialiseTrips = function() {
      if (!this.trips_setup) {
        this.trips.push(new App.TravellerTrip(this.manager, this, 'leave'));
        if (this.container.find(".ad-checked-return-cell").length === 1) {
          this.trips.push(new App.TravellerTrip(this.manager, this, 'return'));
        }
        return this.trips_setup = true;
      }
    };

    Traveller.prototype.changeTrips = function() {
      this.deSelect();
      return $.each(this.trips, (function(_this) {
        return function(index, trip) {
          return trip.changeTo(_this.selector.val());
        };
      })(this));
    };

    Traveller.prototype.changeTo = function(val) {
      this.selector.val(val).trigger("chosen:updated");
      return this.selector.trigger('change');
    };

    Traveller.prototype.changeTripTo = function(val, way) {
      this.setCustom();
      return $.each(this.trips, (function(_this) {
        return function(index, trip) {
          if (trip.way === way) {
            return trip.changeTo(val);
          }
        };
      })(this));
    };

    Traveller.prototype.changeAllTripsTo = function(val, way) {};

    Traveller.prototype.deSelect = function() {
      return $.each(this.trips, (function(_this) {
        return function(index, trip) {
          return trip.deSelect();
        };
      })(this));
    };

    Traveller.prototype.setCustom = function() {
      this.selector.val('custom').trigger("chosen:updated");
      return this.customBags.setCustom();
    };

    Traveller.prototype.setSelect = function() {
      return this.selector.val('select').trigger("chosen:updated");
    };

    Traveller.prototype.dirty = function() {
      return this.customBags.dirty();
    };

    Traveller.prototype.save = function(action) {
      var prices, tot;
      this.deSelect();
      prices = [];
      $.each(this.trips, (function(_this) {
        return function(index, trip) {
          var res;
          res = trip.save(action);
          if (res !== void 0) {
            return prices = prices.concat(res);
          }
        };
      })(this));
      if (prices.length > 1) {
        tot = prices.reduce(function(t, s) {
          return t + s;
        });
        return this.bagPrice.val(tot);
      } else {
        return this.bagPrice.val(prices.first);
      }
    };

    Traveller.prototype.getLeaveAndReturnWeights = function() {
      return $.each(this.trips, (function(_this) {
        return function(index, trip) {
          if (trip.way === 'return') {
            return _this.returnWeight = trip.weight;
          } else {
            return _this.leaveWeight = trip.weight;
          }
        };
      })(this));
    };

    Traveller.prototype.fetchBagsPrice = function() {
      return Number(this.bagPrice.val());
    };

    Traveller.prototype.zeroBags = function() {
      if (this.trips.length > 1) {
        if (this.leaveWeight === '0kg' && this.returnWeight === '0kg') {
          return true;
        }
      } else {
        if (this.leaveWeight === '0kg') {
          return true;
        }
      }
      return false;
    };

    Traveller.prototype.zeroReturnBags = function() {
      if (this.trips.length > 1) {
        if (this.leaveWeight !== '0kg' && this.returnWeight === '0kg') {
          return true;
        }
      }
      return false;
    };

    Traveller.prototype.zeroLeaveBags = function() {
      if (this.trips.length > 1) {
        if (this.leaveWeight === '0kg' && this.returnWeight !== '0kg') {
          return true;
        }
      }
      return false;
    };

    return Traveller;

  })();

}).call(this);
