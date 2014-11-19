(function() {
  window.App = typeof App !== "undefined" && App !== null ? App : {};

  App.TravellerSegment = (function() {
    function TravellerSegment(manager, trip, airline, num) {
      this.manager = manager;
      this.trip = trip;
      this.container = this.trip.container.find(".ad-traveller-bags-segment-" + num);
      this.tripContainers = this.trip.container.find(".ad-traveller-bags-segment");
      this.field = this.container.find('.ad-checked-bags-field');
      this.priceField = this.container.find('.ad-checked-bags-price-field');
      this.noBags = this.container.find('.ad-weight-none');
      this.showBags = this.container.find('.ad-weight-val');
      this.bagsWeight = this.showBags.find('.ad-weight');
      this.bagsPrice = this.showBags.find('.ad-weight-price');
      this.bagsX1 = this.container.find('.ad-bags-icon:eq(1)');
      this.bagsX2 = this.container.find('.ad-bags-icon:eq(0)');
      this.selected = null;
      this.bundleName = this.manager.defaultBundle;
      this.setInitialWeight();
      this.weight = '';
      this.price = '';
      this.previousWeight = '';
      this.previousPrice = '';
      if (this.trip.way === 'leave') {
        this.cityPair = window.city_pairs_array_all[num];
      } else {
        this.cityPair = window.city_pairs_array_all[num + 2];
      }
      this.airline = airline;
      this.setupAirlineRules();
      this.setupWeight();
      this.setupPrice();
      this.changeTo(this.weight);
      this.setupClickEvents();
      this.setupOverEvents();
    }

    TravellerSegment.prototype.setInitialWeight = function() {
      return this.initialWeight = this.field.val();
    };

    TravellerSegment.prototype.rollbackToInitialWeight = function() {
      this.setupAirlineRules();
      if (this.initialWeight !== '' && this.initialWeight !== void 0) {
        this.changeTo(this.initialWeight);
        this.save();
        this.trip.setTravellerCustom();
      }
      return this.currentPrice;
    };

    TravellerSegment.prototype.setupAirlineRules = function() {
      if (this.manager.bundleName !== '' && this.manager.bundleName !== void 0) {
        this.bundleName = this.manager.bundleName;
      }
      if (this.airline === 'JQ') {
        return this.setupJQRules();
      } else if (this.airline === '9W') {
        return this.setup9WRules();
      }
    };

    TravellerSegment.prototype.setupJQRules = function() {
      return this.rules = window.jq_rules["" + this.bundleName + this.cityPair];
    };

    TravellerSegment.prototype.setup9WRules = function() {
      return this.rules = {
        "0kg": {
          'bags': 0,
          'weight': '0 kg',
          'price': 'S$ 0'
        },
        "15kg": {
          'bags': 1,
          'weight': '30 kg',
          'price': 'included'
        },
        "20kg": {
          'bags': 1,
          'weight': '30 kg',
          'price': 'included'
        },
        "25kg": {
          'bags': 1,
          'weight': '30 kg',
          'price': 'included'
        },
        "30kg": {
          'bags': 1,
          'weight': '30 kg',
          'price': 'included'
        },
        "35kg": {
          'bags': 2,
          'weight': '<a href="#" data-msg="note that the maximum weight allowed per bag is 32 kg" data-url="http://www.jetairways.com/EN/SG/Baggage/FreeBaggageAllowances.aspx" data-link="Learn about additional fees">35 kg</a>',
          'price': '<a href="#" data-msg="note that the maximum weight allowed per bag is 32 kg" data-url="http://www.jetairways.com/EN/SG/Baggage/FreeBaggageAllowances.aspx" data-link="Learn about additional fees">fees<br>apply</a>'
        },
        "40kg": {
          'bags': 2,
          'weight': '<a href="#" data-msg="note that the maximum weight allowed per bag is 32 kg" data-url="http://www.jetairways.com/EN/SG/Baggage/FreeBaggageAllowances.aspx" data-link="Learn about additional fees">40 kg</a>',
          'price': '<a href="#" data-msg="note that the maximum weight allowed per bag is 32 kg" data-url="http://www.jetairways.com/EN/SG/Baggage/FreeBaggageAllowances.aspx" data-link="Learn about additional fees">fees<br>apply</a>'
        }
      };
    };

    TravellerSegment.prototype.save = function() {
      this.setupAirlineRules();
      this.setupPrice();
      this.setupWeight();
      return this.currentPrice;
    };

    TravellerSegment.prototype.setupWeight = function() {
      var weight;
      if (this.field.val()) {
        weight = this.field.val();
      } else {
        this.field.val('0kg');
        weight = '0kg';
      }
      this.previousWeight = weight;
      return this.weight = weight;
    };

    TravellerSegment.prototype.setupPrice = function() {
      var prevP, rule, weight;
      if (this.field.val()) {
        weight = this.field.val();
      } else {
        weight = '0kg';
      }
      rule = this.rules[weight];
      this.previousPrice = rule['price'];
      prevP = this.getPriceValue(this.previousPrice);
      this.priceField.val(prevP);
      this.previousPriceValue = prevP;
      return this.currentPrice = prevP;
    };

    TravellerSegment.prototype.getPriceValue = function(price) {
      var num;
      if (price !== 'included' && price.indexOf("fees") === -1) {
        num = Number(price.split(' ')[1]);
      } else {
        num = 0;
      }
      return num;
    };

    TravellerSegment.prototype.setupClickEvents = function() {
      var that;
      that = this;
      this.container.on('click', (function(_this) {
        return function(e) {
          if (_this.selected === null) {
            return _this.select();
          }
        };
      })(this));
      this.bagsWeight.on("click", "a", function(e) {
        var l, m, u;
        e.preventDefault();
        m = $(this).attr('data-msg');
        l = $(this).attr('data-link');
        u = $(this).attr('data-url');
        if (l) {
          m = "" + m + "<Br><BR><a href='" + u + "' target='_blank'>" + l + "</a>";
        }
        that.showMsg(m);
        return false;
      });
      return this.bagsPrice.on("click", "a", function(e) {
        var l, m, u;
        e.preventDefault();
        m = $(this).attr('data-msg');
        l = $(this).attr('data-link');
        u = $(this).attr('data-url');
        if (l) {
          m = "" + m + "<Br><BR><a href='" + u + "' target='_blank'>" + l + "</a>";
        }
        that.showMsg(m);
        return false;
      });
    };

    TravellerSegment.prototype.setupOverEvents = function() {
      this.container.on('mouseover', (function(_this) {
        return function(e) {
          _this.tripContainers.addClass('ad-seg-bag-over');
          return _this.over = true;
        };
      })(this));
      return this.container.on('mouseout', (function(_this) {
        return function(e) {
          _this.tripContainers.removeClass('ad-seg-bag-over');
          return _this.over = false;
        };
      })(this));
    };

    TravellerSegment.prototype.select = function() {
      this.trip.edit(this.weight);
      return this.setSelected();
    };

    TravellerSegment.prototype.setSelected = function() {
      this.selected = true;
      return this.container.addClass('ad-seg-bag-selected');
    };

    TravellerSegment.prototype.isSelected = function() {
      return this.container.hasClass('ad-seg-bag-selected') && this.selected;
    };

    TravellerSegment.prototype.isOver = function() {
      return this.container.hasClass('ad-seg-bag-over') && this.over;
    };

    TravellerSegment.prototype.rollback = function() {
      this.setupAirlineRules();
      this.changeTo(this.previousWeight);
      return this.currentPrice;
    };

    TravellerSegment.prototype.changeTo = function(val) {
      var rule;
      this.setupAirlineRules();
      this.weight = val;
      this.field.val(val);
      rule = this.rules[this.weight];
      this.priceField.val(this.getPriceValue(rule['price']));
      this.trip.weight = val;
      if (val === '0kg') {
        this.displayNoBags();
      } else {
        this.displayShowBags();
        this.displayAccordingToRule(val);
      }
      return this.isDirty();
    };

    TravellerSegment.prototype.isDirty = function() {
      if (this.previousWeight !== this.weight) {
        return this.trip.dirty();
      }
    };

    TravellerSegment.prototype.displayAccordingToRule = function(val) {
      var rule;
      rule = this.rules[val];
      this.bagsWeight.html(rule['weight']);
      this.bagsPrice.html(rule['price']);
      this.currentPrice = this.getPriceValue(rule['price']);
      if (rule['bags'] === 1) {
        this.bagsX1.show();
        return this.bagsX2.hide();
      } else {
        this.bagsX1.hide();
        return this.bagsX2.show();
      }
    };

    TravellerSegment.prototype.displayNoBags = function() {
      this.noBags.show();
      this.showBags.hide();
      this.bagsX1.hide();
      return this.bagsX2.hide();
    };

    TravellerSegment.prototype.displayShowBags = function() {
      this.noBags.hide();
      return this.showBags.css('display', "inline");
    };

    TravellerSegment.prototype.deSelect = function() {
      this.selected = null;
      return this.container.removeClass('ad-seg-bag-selected');
    };

    TravellerSegment.prototype.showMsg = function(msg) {
      return this.trip.msg(msg);
    };

    TravellerSegment.prototype.noBagsDisplayed = function() {
      return this.noBags.is(':visible') && this.showBags.is(':hidden') && this.bagsX1.is(':hidden') && this.bagsX2.is(':hidden');
    };

    TravellerSegment.prototype.showBagsDisplayed = function() {
      return this.noBags.is(':hidden') && this.showBags.is(':visible');
    };

    TravellerSegment.prototype.bagsX1Displayed = function() {
      return this.noBags.is(':hidden') && this.showBags.is(':visible') && this.bagsX1.is(':visible') && this.bagsX2.is(':hidden');
    };

    TravellerSegment.prototype.bagsX2Displayed = function() {
      return this.noBags.is(':hidden') && this.showBags.is(':visible') && this.bagsX1.is(':hidden') && this.bagsX2.is(':visible');
    };

    return TravellerSegment;

  })();

}).call(this);
