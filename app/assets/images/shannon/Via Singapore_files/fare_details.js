(function() {
  window.App = typeof App !== "undefined" && App !== null ? App : {};

  App.FareDetails = (function() {
    function FareDetails(manager, travellers) {
      this.manager = manager;
      this.travellers = travellers;
      this.setupSelectors();
    }

    FareDetails.prototype.setupSelectors = function() {
      var i, _results;
      this.topTripTotal = $('#addons-trip_total');
      this.tripAddonsTotal = $('#addons-total');
      this.tripTotal = $('#addons-total-price');
      this.tripFare = $('#addons-flight-price');
      this.tripTaxes = $('#addons-fees-price');
      this.tripInsurance = $('#addons-insurance-price');
      this.travellerSelectors = {};
      if (this.travellers > 1) {
        i = 0;
        _results = [];
        while (i < this.travellers) {
          this.travellerSelectors[i] = {};
          this.travellerSelectors[i]['fare-price'] = $("#addons-flight-" + i + "-price");
          this.travellerSelectors[i]['fees-price'] = $("#addons-fees-" + i + "-price");
          this.travellerSelectors[i]['insurance-price'] = $("#addons-insurance-" + i + "-price");
          this.travellerSelectors[i]['addons-price'] = $("#addons-traveller-" + i + "-price");
          this.travellerSelectors[i]['total-price'] = $("#addons-traveller-" + i + "-total-price");
          _results.push(i++);
        }
        return _results;
      }
    };

    FareDetails.prototype.update = function(val) {
      this.total_fare = 0;
      this.total_fees = 0;
      if (this.travellers > 1) {
        return this.updateMany(val);
      } else {
        return this.updateSingle(val);
      }
    };

    FareDetails.prototype.updateMany = function(prices) {
      var addons, fare, fees, i, insurance, total;
      this.total_fare = 0;
      this.total_fees = 0;
      i = 0;
      while (i < this.travellers) {
        this.updateFareAndFees(i, true);
        addons = prices[i];
        fare = Number(this.travellerSelectors[i]['fare-price'].text().replace(',', ''));
        fees = Number(this.travellerSelectors[i]['fees-price'].text().replace(',', ''));
        insurance = Number(this.travellerSelectors[i]['insurance-price'].text().replace(',', ''));
        total = this.toMoney(fare + fees + insurance + addons);
        this.travellerSelectors[i]['addons-price'].text(addons);
        this.travellerSelectors[i]['total-price'].text(total);
        if (addons > 0) {
          $("#addons-traveller-" + i + "-price-line").show();
        } else {
          $("#addons-traveller-" + i + "-price-line").hide();
        }
        i++;
      }
      return this.updateSummary(prices);
    };

    FareDetails.prototype.updateSingle = function(prices) {
      return this.updateSummary(prices);
    };

    FareDetails.prototype.updateSummary = function(prices) {
      var addons, fare, fees, insurance, total;
      if (prices.length > 0) {
        if (this.travellers === 1) {
          this.total_fare = 0;
          this.total_fees = 0;
          this.updateFareAndFees(0, null);
        }
        this.tripFare.text(this.toMoney(this.total_fare));
        this.tripTaxes.text(this.toMoney(this.total_fees));
        addons = prices.reduce(function(t, s) {
          return t + s;
        });
        this.tripAddonsTotal.text(addons);
        fare = Number(this.tripFare.text().replace(',', ''));
        fees = Number(this.tripTaxes.text().replace(',', ''));
        insurance = Number(this.tripInsurance.text().replace(',', ''));
        total = this.toMoney(fare + fees + insurance + addons);
        this.topTripTotal.text(total);
        this.tripAddonsTotal.text(addons);
        this.tripTotal.text(total);
      }
      if (addons > 0) {
        return $('#addons-total-line').show();
      } else {
        return $('#addons-total-line').hide();
      }
    };

    FareDetails.prototype.updateFareAndFees = function(num, update_trav) {
      var bundleName, fare, fees, lookupPrice, paxPrice, paxTax, paxType;
      paxType = $("#addons-pax-" + num + "-type").text();
      bundleName = this.manager.bundleName;
      lookupPrice = "#" + bundleName + "-bundle-prices";
      paxPrice = ".bundle-" + paxType + "-price";
      paxTax = ".bundle-" + paxType + "-tax";
      fare = Number($(lookupPrice).find(paxPrice).text());
      fees = Number($(lookupPrice).find(paxTax).text());
      this.total_fare = this.total_fare + fare;
      this.total_fees = this.total_fees + fees;
      if (update_trav) {
        $("#addons-flight-" + num + "-price").text(this.toMoney(fare));
        return $("#addons-fees-" + num + "-price").text(this.toMoney(fees));
      }
    };

    FareDetails.prototype.toMoney = function(num) {
      return "" + (num.formatMoney(2, ',', '.'));
    };

    return FareDetails;

  })();

}).call(this);
