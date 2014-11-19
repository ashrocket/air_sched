(function() {
  window.App = typeof App !== "undefined" && App !== null ? App : {};

  App.BagsManager = (function() {
    function BagsManager(defaultBundle) {
      this.defaultBundle = defaultBundle;
      this.table = $('#ad-bag-simple-tab');
      this.options = this.table.find('.add-bag-sel1');
      this.options2 = this.table.find('.add-bag-sel2');
      this.saveButton = $('#ad-save-but');
      this.savedLabel = $('#ad-saved-label');
      this.dontSaveLink = $('#ad-dont-save');
      this.resetLink = $('#ad-reset-all');
      this.confirmSaveBox = $('#add-ons-confirmation');
      this.confirmSave = this.confirmSaveBox.find('.addon-do-save');
      this.confirmCancel = this.confirmSaveBox.find('.addon-dont-save');
      this.confirmLeaveBox = $('#add-ons-confirmation-leave');
      this.leaveSave = this.confirmLeaveBox.find('.addon-do-save');
      this.leaveDontSave = this.confirmLeaveBox.find('.addon-dont-save');
      this.continueButton = $('#addons-submit');
      this.bundleName = '';
      this.changed = false;
      this.simpleBags = new App.SimpleBags($('#addons-airlines-array-unique').text().split(','));
      this.simpleBags.setup();
      this.customBags = new App.CustomBags(this);
      this.fareDetails = new App.FareDetails(this, this.customBags.travellers.length);
      this.selected = 0;
      this.setupClickEvents();
      this.select(0);
    }

    BagsManager.prototype.setupClickEvents = function() {
      var manager;
      manager = this;
      this.options.on('click', function(e) {
        var id;
        id = $(this).attr('data-id');
        if (!(manager.isDisabled(id) || manager.isSelected(id))) {
          return manager.select(id);
        }
      });
      this.options2.on('click', function(e) {
        var id;
        id = $(this).attr('data-id');
        if (!(manager.isDisabled(id) || manager.isSelected(id))) {
          return manager.select(id);
        }
      });
      this.saveButton.on('click', (function(_this) {
        return function(e) {
          e.preventDefault();
          return _this.confirmSavePopup();
        };
      })(this));
      this.continueButton.on('click', (function(_this) {
        return function(e) {
          e.preventDefault();
          return _this.confirmContinuePopup();
        };
      })(this));
      this.dontSaveLink.on('click', (function(_this) {
        return function(e) {
          e.preventDefault();
          return _this.dontSave();
        };
      })(this));
      this.confirmCancel.on('click', (function(_this) {
        return function(e) {
          e.preventDefault();
          return _this.confirmSaveBox.modal('hide');
        };
      })(this));
      this.leaveDontSave.on('click', (function(_this) {
        return function(e) {
          e.preventDefault();
          _this.confirmLeaveBox.modal('hide');
          return _this.dontSaveAndContinue();
        };
      })(this));
      this.confirmSave.on('click', (function(_this) {
        return function(e) {
          e.preventDefault();
          _this.confirmSaveBox.modal('hide');
          return _this.save();
        };
      })(this));
      this.leaveSave.on('click', (function(_this) {
        return function(e) {
          e.preventDefault();
          _this.confirmLeaveBox.modal('hide');
          return _this.saveAndContinue();
        };
      })(this));
      this.resetLink.on('click', (function(_this) {
        return function(e) {
          e.preventDefault();
          return _this.reset();
        };
      })(this));
      this.options.on('mouseover', function(e) {
        var id;
        id = $(this).attr('data-id');
        if (!(manager.isDisabled(id) || manager.isSelected(id))) {
          return manager.over(id);
        }
      });
      this.options.on('mouseout', function(e) {
        var id;
        id = $(this).attr('data-id');
        if (!(manager.isDisabled(id) || manager.isSelected(id))) {
          return manager.notOver(id);
        }
      });
      this.options2.on('mouseover', function(e) {
        var id;
        id = $(this).attr('data-id');
        if (!(manager.isDisabled(id) || manager.isSelected(id))) {
          return manager.over(id);
        }
      });
      this.options2.on('mouseout', function(e) {
        var id;
        id = $(this).attr('data-id');
        if (!(manager.isDisabled(id) || manager.isSelected(id))) {
          return manager.notOver(id);
        }
      });
      $('#cancel-verify-baggage').on('click', (function(_this) {
        return function(e) {
          e.preventDefault();
          return $('#verify-baggage').modal('hide');
        };
      })(this));
      return $('#confirm-verify-baggage').on('click', (function(_this) {
        return function(e) {
          e.preventDefault();
          $('#verify-baggage').modal('hide');
          return $('#add_ons_form').submit();
        };
      })(this));
    };

    BagsManager.prototype.dontSaveAndContinue = function() {
      this.dontSave();
      return this.checkRules();
    };

    BagsManager.prototype.saveAndContinue = function() {
      this.save();
      return this.checkRules();
    };

    BagsManager.prototype.checkRules = function() {
      var allZeroBags, travellersWithZeroBags, travellersWithZeroLeaveBags, travellersWithZeroReturnBags;
      this.bagsRuleMsg = '';
      this.customBags.getAllBagWeights();
      allZeroBags = this.customBags.allZeroBags();
      if (allZeroBags > 0) {
        this.buildRuleOneMsg(allZeroBags);
      } else {
        travellersWithZeroBags = this.customBags.travellersWithZeroBags();
        if (travellersWithZeroBags > 0) {
          this.buildRuleTwoMsg(travellersWithZeroBags);
        } else {
          travellersWithZeroReturnBags = this.customBags.travellersWithZeroReturnBags();
          if (travellersWithZeroReturnBags > 0) {
            this.buildRuleThreeMsg(travellersWithZeroReturnBags);
          } else {
            travellersWithZeroLeaveBags = this.customBags.travellersWithZeroLeaveBags();
            if (travellersWithZeroLeaveBags > 0) {
              this.buildRuleFourMsg(travellersWithZeroLeaveBags);
            }
          }
        }
      }
      $('#verify-baggage-msg').text(this.bagsRuleMsg);
      $('#booking_bag_rules_verified').prop('checked', this.bagsRuleMsg !== "");
      if (this.bagsRuleMsg !== "") {
        $('#booking_bag_rules_verified').val('1');
        return $('#verify-baggage').modal('show').show();
      } else {
        $('#booking_bag_rules_verified').val('0');
        return $('#add_ons_form').submit();
      }
    };

    BagsManager.prototype.buildRuleOneMsg = function(paxWeightUpgrades) {
      var pax;
      if (paxWeightUpgrades.length === 0) {
        pax = "";
      } else {
        pax = " for any of the passengers";
      }
      return this.bagsRuleMsg = "You have elected not to check-in any bags" + pax + " for the full journey.";
    };

    BagsManager.prototype.buildRuleTwoMsg = function(num) {
      var pax;
      if (num === 0) {
        pax = "";
      } else if (num === 1) {
        pax = " for 1 passenger";
      } else {
        pax = " for " + num + " passengers";
      }
      return this.bagsRuleMsg = "You have elected not to check-in any bags" + pax + " for the full journey.";
    };

    BagsManager.prototype.buildRuleThreeMsg = function(num) {
      var pax;
      if (num === 0) {
        pax = "";
      } else if (num === 1) {
        pax = " for 1 passenger";
      } else {
        pax = " for " + num + " passengers";
      }
      return this.bagsRuleMsg = "You have elected to check-in bags for the leave trip, but not for the return trip" + pax + ".";
    };

    BagsManager.prototype.buildRuleFourMsg = function(num) {
      var pax;
      if (num === 0) {
        pax = "";
      } else if (num === 1) {
        pax = " for 1 passenger";
      } else {
        pax = " for " + num + " passengers";
      }
      return this.bagsRuleMsg = "You have elected to check-in bags for the return trip, but not for the leave trip" + pax + ".";
    };

    BagsManager.prototype.confirmSavePopup = function() {
      $.each(this.customBags.travellers, (function(_this) {
        return function(index, traveller) {
          return traveller.deSelect();
        };
      })(this));
      return this.confirmSaveBox.modal('show');
    };

    BagsManager.prototype.confirmContinuePopup = function() {
      $.each(this.customBags.travellers, (function(_this) {
        return function(index, traveller) {
          return traveller.deSelect();
        };
      })(this));
      if (this.changed) {
        return this.confirmLeaveBox.modal('show');
      } else {
        return this.checkRules();
      }
    };

    BagsManager.prototype.over = function(num) {
      num = parseInt(num);
      this.options.removeClass('ad-manager-option-over');
      this.options2.removeClass('ad-manager-option-over');
      $(this.options[num]).addClass('ad-manager-option-over');
      return $(this.options2[num]).addClass('ad-manager-option-over');
    };

    BagsManager.prototype.notOver = function(num) {
      num = parseInt(num);
      $(this.options[num]).removeClass('ad-manager-option-over');
      return $(this.options2[num]).removeClass('ad-manager-option-over');
    };

    BagsManager.prototype.select = function(num) {
      num = parseInt(num);
      this.options.removeClass('ad-manager-option-over');
      this.options2.removeClass('ad-manager-option-over');
      this.options2.text('Select');
      this.options.removeClass('ad-bag-selected');
      this.options2.removeClass('ad-bag-selected');
      $(this.options[num]).addClass('ad-bag-selected');
      $(this.options2[num]).addClass('ad-bag-selected');
      $(this.options2[num]).text('Selected');
      this.selected = num;
      if (num < 2) {
        this.options.removeClass('ad-bag-disabled');
        this.options2.removeClass('ad-bag-disabled');
      }
      if (num === 0) {
        this.changeValues('0');
      } else if (num === 1) {
        this.changeValues('standard');
      } else {
        this.changeValues(null);
      }
      this.save();
      return this.resetButtons('all');
    };

    BagsManager.prototype.changeValues = function(val) {
      this.simpleBags.setBags(val);
      if (val) {
        return this.customBags.hide(val);
      } else {
        if (this.bundleName === 'superior') {
          return this.customBags.show('standard');
        } else {
          return this.customBags.show('0');
        }
      }
    };

    BagsManager.prototype.isSelected = function(num) {
      return $(this.options[num]).hasClass('ad-bag-selected') && $(this.options2[num]).hasClass('ad-bag-selected');
    };

    BagsManager.prototype.onlySelected = function(num) {
      var only;
      only = true;
      this.options.each((function(_this) {
        return function(index, item) {
          if (num === index) {
            if (!_this.isSelected(index)) {
              return only = false;
            }
          } else {
            if (_this.isSelected(index)) {
              return only = false;
            }
          }
        };
      })(this));
      return only;
    };

    BagsManager.prototype.changeTo = function(name) {
      name = name.toLowerCase();
      this.bundleName = name;
      if (name === 'superior') {
        this.select(2);
        this.disable(0);
        return this.disable(1);
      } else {
        this.enable(0);
        this.enable(1);
        this.enable(2);
        return this.select(0);
      }
    };

    BagsManager.prototype.disable = function(num) {
      $(this.options[num]).addClass('ad-bag-disabled');
      return $(this.options2[num]).addClass('ad-bag-disabled');
    };

    BagsManager.prototype.enable = function(num) {
      $(this.options[num]).removeClass('ad-bag-disabled');
      return $(this.options2[num]).removeClass('ad-bag-disabled');
    };

    BagsManager.prototype.isDisabled = function(num) {
      return $(this.options[num]).hasClass('ad-bag-disabled') && $(this.options2[num]).hasClass('ad-bag-disabled');
    };

    BagsManager.prototype.dirty = function() {
      this.changed = true;
      this.saveButton.show();
      this.savedLabel.hide();
      this.dontSaveLink.show();
      return this.resetLink.show();
    };

    BagsManager.prototype.updateTotalAddonsPriceField = function() {
      var tot;
      if (this.bagPrices.length > 1) {
        tot = this.bagPrices.reduce(function(t, s) {
          return t + s;
        });
      } else {
        tot = this.bagPrices[0];
      }
      return $('#booking_add_ons_price').val(tot);
    };

    BagsManager.prototype.save = function() {
      this.changed = false;
      this.customBags.save(null);
      this.bagPrices = this.customBags.getAllBagPrices();
      this.previousBagPrices = this.bagPrices;
      this.fareDetails.update(this.bagPrices);
      this.simpleBags.update(this.bagPrices);
      this.updateTotalAddonsPriceField();
      this.saveButton.hide();
      this.savedLabel.show();
      return this.dontSaveLink.hide();
    };

    BagsManager.prototype.saveToInitialWeights = function() {
      this.changed = false;
      this.customBags.save('rollbackToInitial');
      this.bagPrices = this.customBags.getAllBagPrices();
      if (this.bagPrices.length > 0) {
        if (!isNaN(this.bagPrices[0])) {
          if (JSON.stringify(this.bagPrices) !== JSON.stringify(this.previousBagPrices)) {
            this.fareDetails.update(this.bagPrices);
            this.simpleBags.update(this.bagPrices);
            this.updateTotalAddonsPriceField();
            this.saveButton.hide();
            this.savedLabel.hide();
            this.dontSaveLink.hide();
            if (this.bundleName !== 'superior') {
              this.options.removeClass('ad-bag-selected');
              this.options2.removeClass('ad-bag-selected');
              $(this.options[2]).addClass('ad-bag-selected');
              $(this.options2[2]).addClass('ad-bag-selected');
              this.selected = 2;
              this.customBags.customise_container.show();
              return this.simpleBags.container.hide();
            }
          }
        }
      }
    };

    BagsManager.prototype.dontSave = function() {
      this.changed = false;
      this.customBags.save('rollback');
      this.saveButton.hide();
      this.savedLabel.hide();
      return this.dontSaveLink.hide();
    };

    BagsManager.prototype.reset = function() {
      var name;
      this.changed = false;
      name = this.defaultBundle.toLowerCase();
      $('.bundle-selected').removeClass('bundle-selected');
      window.selectThisBundle($("." + name + "-bundle"));
      return this.resetButtons('all');
    };

    BagsManager.prototype.resetButtons = function(which) {
      if (which === 'all') {
        this.saveButton.hide();
        this.savedLabel.hide();
        this.dontSaveLink.hide();
        return this.resetLink.hide();
      }
    };

    return BagsManager;

  })();

}).call(this);
