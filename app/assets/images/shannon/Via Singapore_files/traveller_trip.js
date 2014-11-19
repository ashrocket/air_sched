(function() {
  window.App = typeof App !== "undefined" && App !== null ? App : {};

  App.TravellerTrip = (function() {
    function TravellerTrip(manager, traveller, way) {
      this.manager = manager;
      this.way = way;
      this.traveller = traveller;
      this.container = this.traveller.container.find(".ad-checked-" + way + "-cell");
      this.editPopup = this.container.find('.ad-checked-select');
      this.editPopupX = this.editPopup.find('.ad-checked-bags-edit-close:eq(0)');
      this.editPopupClose = this.editPopup.find('.ad-checked-bags-edit-close:eq(1)');
      this.editPopupRemove = this.editPopup.find('.ad-checked-bags-edit-remove');
      this.editPopupRemoveOr = this.editPopup.find('.ad-checked-bags-edit-remove-or');
      this.msgPopup = this.container.find('.ad-checked-link');
      this.msgPopupX = this.msgPopup.find('.ad-checked-bags-link-close:eq(0)');
      this.msgPopupClose = this.msgPopup.find('.ad-checked-bags-link-close:eq(1)');
      this.msgPopupText = this.msgPopup.find('.ad-checked-edit-msg');
      this.selector = this.container.find('.weight-selector');
      this.selector.chosen({
        allow_single_deselect: true,
        width: "150px"
      });
      if (way === "leave") {
        this.airlines = this.traveller.airlines.slice(0, 2);
      } else {
        this.airlines = this.traveller.airlines.slice(2);
      }
      this.segments = [];
      this.segments_setup = null;
      this.initialiseSegments();
      this.setupClickEvents();
      this.setupChangeEvents();
    }

    TravellerTrip.prototype.initialiseSegments = function() {
      if (!this.segments_setup) {
        this.container.find('.ad-traveller-bags-segment').each((function(_this) {
          return function(index, segment) {
            return _this.segments.push(new App.TravellerSegment(_this.manager, _this, _this.airlines[index], index));
          };
        })(this));
        return this.segments_setup = true;
      }
    };

    TravellerTrip.prototype.setupClickEvents = function() {
      this.editPopupClose.on('click', (function(_this) {
        return function(e) {
          e.preventDefault();
          return _this.deSelect();
        };
      })(this));
      this.editPopupX.on('click', (function(_this) {
        return function(e) {
          return _this.deSelect();
        };
      })(this));
      this.editPopupRemove.on('click', (function(_this) {
        return function(e) {
          e.preventDefault();
          _this.deSelect();
          _this.setCustom('0kg');
          return _this.selector.val('0kg').trigger("chosen:updated");
        };
      })(this));
      this.msgPopupClose.on('click', (function(_this) {
        return function(e) {
          e.preventDefault();
          return _this.deSelect();
        };
      })(this));
      return this.msgPopupX.on('click', (function(_this) {
        return function(e) {
          return _this.deSelect();
        };
      })(this));
    };

    TravellerTrip.prototype.setupChangeEvents = function() {
      var that;
      that = this;
      return this.selector.on('change', function(e) {
        return that.setCustom(this.value);
      });
    };

    TravellerTrip.prototype.setCustom = function(val) {
      this.traveller.changeAllTripsTo(val, this.way);
      this.changeTo(val, this.way);
      return this.traveller.setCustom();
    };

    TravellerTrip.prototype.setTravellerCustom = function() {
      return this.traveller.setCustom();
    };

    TravellerTrip.prototype.changeTo = function(val) {
      this.weight = val;
      this.showHideRemoveLink(val);
      return $.each(this.segments, (function(_this) {
        return function(index, segment) {
          return segment.changeTo(val);
        };
      })(this));
    };

    TravellerTrip.prototype.showHideRemoveLink = function(val) {
      if (val === '0kg') {
        this.editPopupRemove.hide();
        return this.editPopupRemoveOr.hide();
      } else {
        this.editPopupRemove.show();
        return this.editPopupRemoveOr.show();
      }
    };

    TravellerTrip.prototype.edit = function(val) {
      this.selector.val(val).trigger("chosen:updated");
      this.traveller.customBags.deSelectAll();
      this.showHideRemoveLink(val);
      this.editPopup.show();
      return $.each(this.segments, (function(_this) {
        return function(index, segment) {
          return segment.setSelected();
        };
      })(this));
    };

    TravellerTrip.prototype.deSelect = function() {
      this.editPopup.hide();
      this.msgPopup.hide();
      return $.each(this.segments, (function(_this) {
        return function(index, segment) {
          return segment.deSelect();
        };
      })(this));
    };

    TravellerTrip.prototype.msg = function(val) {
      this.traveller.customBags.deSelectAll();
      this.msgPopupText.html(val);
      return this.msgPopup.show();
    };

    TravellerTrip.prototype.dirty = function() {
      return this.traveller.dirty();
    };

    TravellerTrip.prototype.save = function(action) {
      var prices;
      prices = [];
      if (action === 'rollback') {
        $.each(this.segments, (function(_this) {
          return function(index, segment) {
            return prices.push(segment.rollback());
          };
        })(this));
      } else if (action === 'rollbackToInitial') {
        this.traveller.setCustom();
        $.each(this.segments, (function(_this) {
          return function(index, segment) {
            return prices.push(segment.rollbackToInitialWeight());
          };
        })(this));
      } else {
        $.each(this.segments, (function(_this) {
          return function(index, segment) {
            return prices.push(segment.save());
          };
        })(this));
      }
      return prices;
    };

    return TravellerTrip;

  })();

}).call(this);
