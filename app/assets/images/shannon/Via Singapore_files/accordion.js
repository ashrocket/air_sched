// update for accordion 
$('#rslt').ready(function() {

	inner_doc = this;

	 $(".accodion-section").hide();


	 $(document).on('click', '.get-info', function (e) {
		e.preventDefault();
		accordion_update($(this));
	  });

	 function change_name(element) {
	 	new_name = element.attr('data-name')
	 	element.attr('data-name', element.text())
	 	element.text(new_name) 
	 }

	 function setup_accordian_bundle(element, acc_grp) {
	 	bh = acc_grp.find('#'+element.attr('data-open')+' .branded-holder')
	 	res = element.closest('.orig-rslt')
	 	tab = res.find('.branded-table')
	 	sel_bundle = tab.attr('data-sel-bundle')

	 	bh.each(function() {
	 		$(this).empty();

	 		airline = $(this).attr('data-airline-parent')
	 		cat = $(this).attr('data-bundle-category')

	 		bunToCopy = $('#'+airline+'-'+sel_bundle+'-bundle')
	 		catToCopy = bunToCopy.find('.'+cat)
	 		$(this).html(catToCopy.html())
	 	});

	 }

	 

	 function accordion_update(element) {
	 	acc_grp = element.closest('.accordion-group')
	 	clos_col = acc_grp.find('.collapse')

	 	change_name(element)

	 	if ($('#'+element.attr('data-open')).is(':visible')) {
	 		clos_col.slideUp()
	 		element.removeClass('get-info-open')
	 	}else {
	 		setup_accordian_bundle(element, acc_grp)
	 		change_name(acc_grp.find('.get-info-open'))
	 		acc_grp.find('.get-info-open').removeClass('get-info-open')
	 		element.addClass('get-info-open')
		 	acc_grp.find('.close_accordian').show()
		 	clos_col.css('height', 'auto')
		 	clos_col.slideDown()
		}

	  var elm_class = element.attr('class').split(' ')[0]
	  var id = element.attr('data-parent').split('-')[1];

	  $("#info-" + id ).hide();
			        
	  if (elm_class == "flight-details") { $("#details-" + id ).show().siblings('.accodion-section').hide(); }
	  else if (elm_class  == "flight-rules") { $("#rules-" + id ).show().siblings('.accodion-section').hide(); }
	  else if (elm_class == "flight-fares") { $("#fares-" + id ).show().siblings('.accodion-section').hide(); }	
	 }


	window.setup_popovers();

 
	// $(function() {
 //    var isVisible = false;

 //    var hideAllPopovers = function() {
 //       $('.fareDetail').each(function() {
 //            $(this).popover('hide');
 //        });  
 //    };

    

});  


function setup_bundle_icons(element) {


	 	res = element.closest('.branded-result')
	 	sel_bundle = res.attr('data-bundle-name')

	 	popup = res.find('.benefits-popup')
	 	holders = popup.find('.branded-icons-holder')

	 	holders.each(function() {
	 		airline = $(this).attr('data-airline-parent')
	 		bunToCopy = $('#'+airline+'-icons-'+sel_bundle+'-bundle')
	 		$(this).html(bunToCopy.html())
	 	});

}

function setup_popovers() {

	$('.fareDetail').on('click', function(e) {
		e.preventDefault(); 

		window.setup_bundle_icons($(this))
		return true;
	});

	$('.fareDetail').popover({
        html: true,
        trigger: 'manual',
        content: function() {
          var id = '#popover-content-' + $(this).attr('id');	
	      return $(id).html();
	    }
   	 }).on('click', function(e) { 


        $(this).popover('show');

        $('.lead-tt').tooltip();

        // handle clicking on the popover itself
        $('.popover').off('click').on('click', function(e) {
            e.stopPropagation(); // prevent event for bubbling up => will not get caught with document.onclick
        });


	   $('.close-popover').on('click', function(e) { 
			$(this).closest(':has(.fareDetail)').find('.fareDetail').popover('hide');
	   		e.preventDefault();
	   	});


        isVisible = true;
        e.stopPropagation();
    });


	    $(document).on('click', function(e) {
	        window.hideAllPopovers();
	        isVisible = false;
	    });


}

function hideAllPopovers() {


	$('.fareDetail').each(function() {
	  $(this).popover('hide');
	});
} 
;
