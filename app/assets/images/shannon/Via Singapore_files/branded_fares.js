(function() {
  var change_accordian_bundle, change_addons_included, openSwimlanes, selectABundle, selectSwimlane, selectThisBundle, setAvailableSwimlanes, setSwimlanePrices;

  $(document).ready(function() {
    var bun, path;
    path = window.location.pathname;
    if (path.indexOf('/voyages/add_ons') !== -1) {
      bun = $('#booking_selected_bundle').val().toLowerCase();
      $('.branded-result').removeClass('bundle-selected');
      $("." + bun + "-bundle:not(.bundle-not-available)").addClass('bundle-selected');
      $('.branded-table').attr('data-sel-bundle', bun);
      $('.bundle-select-addons').show();
      $('.bundle-selected-addons').hide();
      window.change_addons_included(bun);
      $('.branded-table > tbody > tr').each(function(index, element) {
        if (parseInt($(element).attr('data-avaiable')) < parseInt($('#seats-needed').text())) {
          return $(element).addClass('bundle-not-available');
        }
      });
      $("." + bun + "-bundle:not(.bundle-not-available)").each(function(index, element) {
        window.change_accordian_bundle($(element));
        $(element).find('.bundle-selected-addons').show();
        return $(element).find('.bundle-select-addons').hide();
      });
    }
    $('#search-rslt').on("mouseenter", ".branded-result", function() {
      if (!$(this).hasClass('bundle-not-available')) {
        return $(this).addClass('bundle-over');
      }
    });
    $('#search-rslt').on("mouseleave", ".branded-result", function() {
      if (!$(this).hasClass('bundle-not-available')) {
        return $(this).removeClass('bundle-over');
      }
    });
    $('#search-rslt').on("click", ".branded-result", function() {
      if (!$(this).hasClass('bundle-not-available')) {
        window.openSwimlanes($(this));
        return window.selectThisBundle($(this));
      }
    });
    $('#search-rslt').on("mouseenter", ".swimlane-table", function() {
      if (!($(this).hasClass('swimlane-not-available') || $(this).hasClass('swimlane-selected'))) {
        return $(this).addClass('swimlane-over');
      }
    });
    $('#search-rslt').on("mouseleave", ".swimlane-table", function() {
      if (!($(this).hasClass('swimlane-not-available') || $(this).hasClass('swimlane-selected'))) {
        return $(this).removeClass('swimlane-over');
      }
    });
    return $('#search-rslt').on("click", ".swimlane-table:not(.swimlane-selected)", function() {
      var name;
      if (!$(this).hasClass('swimlane-not-available')) {
        window.selectSwimlane($(this));
        name = $(this).attr('data-swimlane-name');
        return window.selectThisBundle($(".bundle-table-selected ." + name + "-bundle"));
      }
    });
  });

  openSwimlanes = function(bun) {
    var name, sl, tab;
    name = bun.attr('data-bundle-name');
    sl = $("#" + name + "-swimlane");
    tab = bun.closest('.branded-table');
    window.setSwimlanePrices(tab);
    window.setAvailableSwimlanes(tab);
    return window.selectSwimlane(sl);
  };

  setSwimlanePrices = function(tab) {
    var prices;
    prices = tab.find('.bundle-total');
    $("#cheapest-swimlane .swimplane-price").text("" + ($(prices[0]).text()));
    $("#choice-swimlane .swimplane-price").text("" + ($(prices[1]).text()));
    return $("#superior-swimlane .swimplane-price").text("" + ($(prices[2]).text()));
  };

  setAvailableSwimlanes = function(tab) {
    $(".swimlane-not-available").removeClass('swimlane-not-available');
    if (tab.find('.cheapest-bundle').hasClass('bundle-not-available')) {
      $("#cheapest-swimlane").addClass('swimlane-not-available');
    }
    if (tab.find('.choice-bundle').hasClass('bundle-not-available')) {
      $("#choice-swimlane").addClass('swimlane-not-available');
    }
    if (tab.find('.superior-bundle').hasClass('bundle-not-available')) {
      return $("#superior-swimlane").addClass('swimlane-not-available');
    }
  };

  selectSwimlane = function(sl) {
    $(".swimlane-table").removeClass('swimlane-selected');
    $('.swimlane-selecter div').text('SELECT');
    sl.removeClass('swimlane-over').addClass('swimlane-selected');
    sl.find('.swimlane-selecter div').text('SELECTED');
    if ($('#swimlanes').hasClass('modal')) {
      return $('#swimlanes').modal('show');
    }
  };

  selectABundle = function() {
    if ($('.btn-rslt:eq(1)').hasClass('btn-red')) {
      $('.branded-result').removeClass('bundle-selected');
      $('.choice-bundle:not(.bundle-not-available)').addClass('bundle-selected');
      $('.branded-table').attr('data-sel-bundle', 'choice');
      return $('.choice-bundle:not(.bundle-not-available)').each(function(index, element) {
        var new_href, res;
        window.change_accordian_bundle($(element));
        res = $(element).closest('.orig-rslt');
        new_href = res.find('.accordion-group .book-btn').attr('href').replace(/(b=)[a-zA-Z]+/ig, '$1' + 'Choice');
        new_href = new_href.replace(/(sa=)[0-9]+/ig, '$1' + $(element).attr('data-avaiable'));
        res.find('.accordion-group .book-btn').attr('href', new_href);
        if (parseInt($(element).attr('data-avaiable')) >= parseInt($('#seats-needed').text())) {
          return res.find('.accordion-group .book-btn').show();
        } else {
          return res.find('.accordion-group .book-btn').hide();
        }
      });
    }
  };

  selectThisBundle = function(bun) {
    var new_href, new_ref_text, path, res, tab;
    $('.bundle-table-selected').removeClass('bundle-table-selected');
    tab = bun.closest('.branded-table');
    tab.addClass('bundle-table-selected');
    tab.find('.branded-result').removeClass('bundle-selected');
    bun.addClass('bundle-selected');
    tab.attr('data-sel-bundle', bun.attr('data-bundle-name'));
    res = bun.closest('.orig-rslt');
    new_href = res.find('.accordion-group .book-btn');
    if (new_href.length > 0) {
      new_ref_text = new_href.attr('href').replace(/(b=)[a-zA-Z]+/ig, '$1' + bun.attr('data-bundle-name'));
      new_ref_text = new_ref_text.replace(/(sa=)[0-9]+/ig, '$1' + bun.attr('data-avaiable'));
      res.find('.accordion-group .book-btn').attr('href', new_ref_text);
      if (parseInt(bun.attr('data-avaiable')) >= parseInt($('#seats-needed').text())) {
        res.find('.accordion-group .book-btn').show();
      } else {
        res.find('.accordion-group .book-btn').hide();
      }
    }
    window.change_accordian_bundle(bun);
    path = window.location.pathname;
    if (path.indexOf('/voyages/add_ons') !== -1) {
      $('#booking_selected_bundle').val(bun.attr('data-bundle-name').charAt(0).toUpperCase() + bun.attr('data-bundle-name').slice(1));
      $('.bundle-select-addons').show();
      $('.bundle-selected-addons').hide();
      bun.find('.bundle-selected-addons').show();
      bun.find('.bundle-select-addons').hide();
      window.addonsChangeBundleTo(bun.attr('data-bundle-name'));
      return window.change_addons_included(bun.attr('data-bundle-name'));
    }
  };

  change_accordian_bundle = function(element) {
    var bh, res, sect, sel_bundle, tab;
    res = element.closest('.orig-rslt');
    sect = res.find('.accodion-section:visible');
    if (sect.length > 0) {
      bh = sect.find('.branded-holder');
      tab = res.find('.branded-table');
      sel_bundle = tab.attr('data-sel-bundle');
      return bh.each(function() {
        var airline, bunToCopy, cat, catToCopy;
        $(this).empty();
        airline = $(this).attr('data-airline-parent');
        cat = $(this).attr('data-bundle-category');
        bunToCopy = $('#' + airline + '-' + sel_bundle + '-bundle');
        catToCopy = bunToCopy.find('.' + cat);
        return $(this).html(catToCopy.html());
      });
    }
  };

  change_addons_included = function(bundle) {
    var bagsCopy, carryCopy, jaBunToCopy, jsBunToCopy, weightCopy;
    jsBunToCopy = $('#jetstar-' + bundle + '-bundle');
    carryCopy = jsBunToCopy.find('.bundle-default-carry-ons');
    bagsCopy = jsBunToCopy.find('.bundle-default-bags');
    weightCopy = jsBunToCopy.find('.bundle-default-weight');
    $('#jetstar-bundle-default-carry').html(carryCopy.html());
    $('#jetstar-bundle-default-bags').html(bagsCopy.html());
    $('#jetstar-bundle-default-weight').html(weightCopy.html());
    jaBunToCopy = $('#jet_airways-' + bundle + '-bundle');
    carryCopy = jaBunToCopy.find('.bundle-default-carry-ons');
    bagsCopy = jaBunToCopy.find('.bundle-default-bags');
    weightCopy = jaBunToCopy.find('.bundle-default-weight');
    $('#jet-airways-bundle-default-carry').html(carryCopy.html());
    $('#jet-airways-bundle-default-bags').html(bagsCopy.html());
    return $('#jet-airways-bundle-default-weight').html(weightCopy.html());
  };

  window.selectABundle = selectABundle;

  window.change_accordian_bundle = change_accordian_bundle;

  window.change_addons_included = change_addons_included;

  window.openSwimlanes = openSwimlanes;

  window.selectSwimlane = selectSwimlane;

  window.selectThisBundle = selectThisBundle;

  window.setAvailableSwimlanes = setAvailableSwimlanes;

  window.setSwimlanePrices = setSwimlanePrices;

}).call(this);
