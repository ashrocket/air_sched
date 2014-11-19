(function() {
  $(document).ready(function() {
    var path;
    path = window.location.pathname;
    if (path.indexOf('/voyages/add_ons') !== -1) {
      $('#addons-page-wrapper').hide();
      window.defaultBundle = $('.bundle-selected').attr('data-bundle-name');
      window.manager = new App.BagsManager(window.defaultBundle);
      window.manager.reset();
      window.manager.saveToInitialWeights();
      return $('#addons-page-wrapper').show();
    }
  });

  window.addonsChangeBundleTo = function(name) {
    return window.manager.changeTo(name);
  };

}).call(this);
