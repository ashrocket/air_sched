(function() {
  var __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  window.App = typeof App !== "undefined" && App !== null ? App : {};

  App.SimpleBags = (function() {
    function SimpleBags(airlines) {
      this.airlines = airlines;
      this.airlinesNum = this.airlines.length;
      this.airlinesTable = $('#ad-simple-tab-airlines');
      this.bagsTable = $('#ad-simple-bag-checked-tab');
      this.carryTable = $('#ad-simple-bag-carry-tab');
      this.jstarLogo = $('#ad-simple-airlines-jetstar-bags');
      this.jstarBags = $('#ad-simple-jetstar-bags');
      this.jstarCarry = $('#ad-simple-jetstar-carry');
      this.jetLogo = $('#ad-simple-airlines-jet-airways-bags');
      this.jetBags = $('#ad-simple-jet-airways-bags');
      this.jetCarry = $('#ad-simple-jet-airways-carry');
      this.container = $('#ad-simple-bags');
      this.jstarBagsPrice = this.jstarBags.find('.ad-simple-seg-price');
    }

    SimpleBags.prototype.setup = function() {
      this.setupLogos();
      this.setupBags();
      return this.setupCarry();
    };

    SimpleBags.prototype.setupLogos = function() {
      var item;
      if (this.airlinesNum === 1) {
        item = this.setOneCol(this.airlinesTable);
        return this.setOne('logo', item);
      } else {
        return this.setTwo('logo', this.airlinesTable);
      }
    };

    SimpleBags.prototype.setupBags = function() {
      var item;
      if (this.airlinesNum === 1) {
        item = this.setOneCol(this.bagsTable);
        return this.setOne('bags', item);
      } else {
        return this.setTwo('bags', this.bagsTable);
      }
    };

    SimpleBags.prototype.setupCarry = function() {
      var item;
      if (this.airlinesNum === 1) {
        item = this.setOneCol(this.carryTable);
        return this.setOne('carry', item);
      } else {
        return this.setTwo('carry', this.carryTable);
      }
    };

    SimpleBags.prototype.setOne = function(name, table) {
      this.setItems(name);
      if (this.airlines[0] === "9W") {
        table.prepend(this.item1);
        return this.item1.show();
      } else if (this.airlines[0] === "JQ") {
        table.prepend(this.item2);
        return this.item2.show();
      }
    };

    SimpleBags.prototype.setTwo = function(name, table) {
      var col1, col2;
      col1 = table.find('td:eq(1)');
      col2 = table.find('td:eq(2)');
      this.setItems(name);
      if (this.airlines[0] === "9W") {
        col1.prepend(this.item1);
        this.item1.show();
        col2.prepend(this.item2);
        return this.item2.show();
      } else {
        col1.prepend(this.item2);
        this.item2.show();
        col2.prepend(this.item1);
        return this.item1.show();
      }
    };

    SimpleBags.prototype.setItems = function(name) {
      if (name === 'logo') {
        this.item1 = this.jetLogo;
        return this.item2 = this.jstarLogo;
      } else if (name === 'bags') {
        this.item1 = this.jetBags;
        return this.item2 = this.jstarBags;
      } else {
        this.item1 = this.jetCarry;
        return this.item2 = this.jstarCarry;
      }
    };

    SimpleBags.prototype.setOneCol = function(table) {
      var item;
      table.find('td').last().remove();
      item = table.find('td:eq(1)');
      return item.addClass('col-md-8').removeClass('col-md-4');
    };

    SimpleBags.prototype.hasOneLogo = function() {
      return this.hasOneCol(this.airlinesTable);
    };

    SimpleBags.prototype.hasOneBags = function() {
      return this.hasOneCol(this.bagsTable);
    };

    SimpleBags.prototype.hasOneCarry = function() {
      return this.hasOneCol(this.carryTable);
    };

    SimpleBags.prototype.hasOneCol = function(table) {
      var item;
      item = table.find('td:eq(1)');
      return item.hasClass('col-md-8') && !item.hasClass('col-md-4') && table.find('td').length === 2;
    };

    SimpleBags.prototype.logos = function(num) {
      return this.airlinesTable.find("td:eq(" + num + ")").html();
    };

    SimpleBags.prototype.bags = function(num) {
      return this.bagsTable.find("td:eq(" + num + ")").html();
    };

    SimpleBags.prototype.carry = function(num) {
      return this.carryTable.find("td:eq(" + num + ")").html();
    };

    SimpleBags.prototype.bagsZeroVisible = function(num) {
      return this.bagsTable.find("td:eq(" + num + ") .ad-simple-none").is(":visible");
    };

    SimpleBags.prototype.bagsStandardVisible = function(num) {
      return this.bagsTable.find("td:eq(" + num + ") .ad-simple-has").is(":visible");
    };

    SimpleBags.prototype.setBags = function(val) {
      var n, s;
      if (val) {
        this.container.show();
      } else {
        this.container.hide();
      }
      s = this.bagsTable.find(".ad-simple-has");
      n = this.bagsTable.find(".ad-simple-none");
      if (val === '0') {
        s.hide();
        return n.show();
      } else {
        n.hide();
        return s.show();
      }
    };

    SimpleBags.prototype.update = function(prices) {
      if (__indexOf.call(this.airlines, 'JQ') >= 0) {
        return this.updatePrice(prices);
      }
    };

    SimpleBags.prototype.updatePrice = function(prices) {
      var tot;
      if (prices.length > 1) {
        tot = prices.reduce(function(t, s) {
          return t + s;
        });
      } else {
        tot = prices[0];
      }
      return this.jstarBagsPrice.text(" + S$" + tot);
    };

    return SimpleBags;

  })();

}).call(this);
