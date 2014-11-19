(function() {
  window.App = typeof App !== "undefined" && App !== null ? App : {};

  App.CustomBags = (function() {
    function CustomBags(manager) {
      this.manager = manager;
      this.customise_container = $('#ad-bag-customise-table');
      this.container = $('#ad-bag-checked-tab');
      this.selector = this.container.find('#ad-checked-item-all .ad-checked-name .weight-selector');
      this.airlines = $('#addons-airlines-array').text().split(',');
      this.selector.chosen({
        allow_single_deselect: true,
        width: "150px"
      });
      this.travellers = [];
      this.travellers_setup = null;
      this.initialiseAllTravellers();
      this.initialiseTravellers();
      this.setupChangeEvents();
    }

    CustomBags.prototype.show = function(val) {
      if (val === 'standard') {
        val = '20kg';
        this.selector.val(val).trigger("chosen:updated");
        this.selector.trigger('change');
      }
      return this.customise_container.show();
    };

    CustomBags.prototype.hide = function(val) {
      this.customise_container.hide();
      if (val === 'standard') {
        val = '20kg';
      } else {
        val = '0kg';
      }
      this.selector.val(val).trigger("chosen:updated");
      return this.selector.trigger('change');
    };

    CustomBags.prototype.setupChangeEvents = function() {
      return this.selector.on('change', (function(_this) {
        return function(e) {
          if (_this.selector.val() !== 'select' && _this.selector.val() !== 'custom') {
            return _this.changeTravellers();
          }
        };
      })(this));
    };

    CustomBags.prototype.changeTravellers = function() {
      this.allTravellers.changeTrips(this.selector.val());
      return $.each(this.travellers, (function(_this) {
        return function(index, traveller) {
          return traveller.changeTo(_this.selector.val());
        };
      })(this));
    };

    CustomBags.prototype.changeTravellersTo = function(val, way) {
      return $.each(this.travellers, (function(_this) {
        return function(index, traveller) {
          return traveller.changeTripTo(val, way);
        };
      })(this));
    };

    CustomBags.prototype.initialiseAllTravellers = function() {
      if (!this.all_travellers_setup) {
        this.allTravellers = new App.AllTravellers(this.manager, this);
        return this.all_travellers_setup = true;
      }
    };

    CustomBags.prototype.initialiseTravellers = function() {
      if (!this.travellers_setup) {
        this.container.find('.ad-checked-traveller').each((function(_this) {
          return function(index, trav) {
            return _this.travellers.push(new App.Traveller(_this.manager, _this, $(trav)));
          };
        })(this));
        return this.travellers_setup = true;
      }
    };

    CustomBags.prototype.resetAll = function() {};

    CustomBags.prototype.saveAll = function() {};

    CustomBags.prototype.changeAllTo = function(val) {};

    CustomBags.prototype.deSelectAll = function() {
      $.each(this.travellers, (function(_this) {
        return function(index, traveller) {
          return traveller.deSelect();
        };
      })(this));
      return this.allTravellers.deSelect();
    };

    CustomBags.prototype.setCustom = function() {
      return this.selector.val('custom').trigger("chosen:updated");
    };

    CustomBags.prototype.dirty = function() {
      return this.manager.dirty();
    };

    CustomBags.prototype.save = function(action) {
      this.allTravellers.save(action);
      return $.each(this.travellers, (function(_this) {
        return function(index, traveller) {
          traveller.save(action);
          if (action === 'rollback') {
            traveller.setSelect();
            _this.selector.val('select').trigger("chosen:updated");
          }
          if (action === 'rollbackToInitial') {
            traveller.setSelect();
            return _this.selector.val('select').trigger("chosen:updated");
          }
        };
      })(this));
    };

    CustomBags.prototype.getAllBagPrices = function() {
      var prices;
      prices = [];
      $.each(this.travellers, (function(_this) {
        return function(index, traveller) {
          return prices.push(traveller.fetchBagsPrice());
        };
      })(this));
      return prices;
    };

    CustomBags.prototype.getAllBagWeights = function() {
      return $.each(this.travellers, (function(_this) {
        return function(index, traveller) {
          return traveller.getLeaveAndReturnWeights();
        };
      })(this));
    };

    CustomBags.prototype.allZeroBags = function() {
      var z;
      z = true;
      $.each(this.travellers, (function(_this) {
        return function(index, traveller) {
          if (!traveller.zeroBags()) {
            z = false;
          }
          return true;
        };
      })(this));
      if (z) {
        return this.travellers.length;
      } else {
        return 0;
      }
    };

    CustomBags.prototype.travellersWithZeroBags = function() {
      var t;
      t = 0;
      $.each(this.travellers, (function(_this) {
        return function(index, traveller) {
          if (traveller.zeroBags()) {
            return ++t;
          }
        };
      })(this));
      return t;
    };

    CustomBags.prototype.travellersWithZeroReturnBags = function() {
      var t;
      t = 0;
      $.each(this.travellers, (function(_this) {
        return function(index, traveller) {
          if (traveller.zeroReturnBags()) {
            return ++t;
          }
        };
      })(this));
      return t;
    };

    CustomBags.prototype.travellersWithZeroLeaveBags = function() {
      var t;
      t = 0;
      $.each(this.travellers, (function(_this) {
        return function(index, traveller) {
          if (traveller.zeroLeaveBags()) {
            return ++t;
          }
        };
      })(this));
      return t;
    };

    return CustomBags;

  })();

}).call(this);
