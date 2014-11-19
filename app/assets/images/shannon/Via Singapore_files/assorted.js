$('body').css('display', 'none');

$(document).ready(function(){

	$('.lead-tt').tooltip();

	$('body').css('display', '');

	$(".bkit-btn-all").click(function (e) {
	   e.stopPropagation() 
	});

	if (($('#voyage_search_sizes').length > 0) || ($('#voyage_search_sizes_chosen').length > 0)) {
		if ($('#voyage_search_sizes').length > 0) {
			setupPaxDropDowns($('#voyage_search_sizes'));
		}else {
			setupPaxDropDowns($('#voyage_search_sizes_chosen'));
		}
	}

	$('#voyage_search_sizes, #voyage_search_sizes_chosen').change(function(){
		if ($('#voyage_search_sizes').length > 0) {
			$('#voyage_search_children').val('');
			$('#voyage_search_infants').val('');
		}else {
			$('#voyage_search_children_chosen').val('');
			$('#voyage_search_infants_chosen').val('');
		}
		setupPaxDropDowns(this);
	});

	$('#voyage_search_children, #voyage_search_children_chosen').change(function(){
		//$('#voyage_search_infants').val('')
		setupPaxDropDowns(this);
	});

	$('#voyage_search_infants, #voyage_search_infants_chosen').change(function(){
		//$('#voyage_search_children').val('')
		setupPaxDropDowns(this);
	});

	function setupPaxDropDowns (item) {

		adults_field = $('#voyage_search_sizes');
		children_field = $('#voyage_search_children');
		children_options = $('#voyage_search_children option');
		infants_field = $('#voyage_search_infants');
		infants_options = $('#voyage_search_infants option');

		if (adults_field.length == 0) {
			adults_field = $('#voyage_search_sizes_chosen');
			children_field = $('#voyage_search_children_chosen');
			children_options = $('#voyage_search_children_chosen option');
			infants_field = $('#voyage_search_infants_chosen');
			infants_options = $('#voyage_search_infants_chosen option');
		}
		
		a = parseInt(adults_field.val());
		
		if (children_field.val() == '') {
			c = 0;
		}else {
			c = parseInt(children_field.val());
		}

		if (infants_field.length > 0) {
			has_infants = true;
			if (infants_field.val() == '') {
				i = 0;
			}else {
				i = parseInt(infants_field.val());
			}
		}else {
			has_infants = null;
			i = 0;
		}

		c1 = 7 - a - i;
		c2 = a * 2 - i;
		c3 = a * 2 ;
		if (c1 > c2) {
			nc = c2;
		}else {
			nc = c1;
		}

		if (c3 < nc) {
			nc = c3;
		}
		
		children_options.each(function(){
			val = this.value;
			if ((this.value == '') || (this.value == undefined)) {
				val = 0
			}

			if (nc >= parseInt(val)) {
				$(this).prop('disabled', false);
			}else{
				$(this).prop('disabled', true);
			}
		}); 


		if (has_infants) {
			i1 = 7 - a - c;
			i2 = a * 2 - c;
			i3 = a;

			if (i1 > i2) {
				ni = i2;
			}else {
				ni = i1;
			}

			if (i3 < ni) {
				ni = i3;
			}


			infants_options.each(function(){
				val = this.value;
				if ((this.value == '') || (this.value == undefined)) {
					val = 0
				}

				if (ni >= parseInt(val)) {
					$(this).prop('disabled', false);
				}else{
					$(this).prop('disabled', true);
				}
			}); 

		}

		if ($('#voyage_search_sizes').length == 0) {
			$('#voyage_search_children_chosen, #voyage_search_infants_chosen').trigger("chosen:updated");
		}else {
			$('#voyage_search_children, #voyage_search_infants').trigger("chosen:updated");
		}
	}
	

	$("#display-debugging").click(function (e) {
	   e.preventDefault();
	   $('#display-debugging').hide();
	   $('#hide-debugging').show();
	   $('#debug-xml').show();
	});

	$("#hide-debugging").click(function (e) {
	   e.preventDefault();
	   $('#display-debugging').show();
	   $('#hide-debugging').hide();
	   $('#debug-xml').hide();
	});

	$(".print_page").click(function (e) {
	   e.preventDefault();
	   window.print();
	});

	$(window).bind("pageshow", function() {
	    var form = $('#new_payment_detail'); 
	    if (form.length > 0) {
	    	form[0].reset();
	    	$('select').trigger("chosen:updated");
	    }
	});

	$( "form" ).submit(function( event ) {
	  $('.rails-error').hide();
	  $('.orig-dest, .orig-dest-mod').removeAttr("autocomplete");
	});

	$( '#add_ons_form' ).submit(function( event ) {
	  $('#addons-checking-price-variance').modal({
        backdrop: 'static',
        keyboard: false,
        show: true    
      });
	});


	$("input").click(function () {
	   $(this).select();
	});

	$("#new_voyage_search, #new_test_result").validate({
		onfocusout: false,
		onkeyup: false,
		focusCleanup: true,
		errorElement: "div",
		errorPlacement: function(error, element) {
			error.prependTo( element.parent().parent() );
		},
		errorClass: "error alert alert-danger abb-error",
		highlight: function(element) {
			$(element).parent().parent().find('.abb-error').remove();
		},
		rules: {
			"voyage_search[origin]": {
				required: true,
				remote: {
					url: fetchPath() + "/valid_origin"
				}
			},
			"voyage_search[dest]": {
				required: true,
				remote: {
					url: fetchPath() + "/valid_destination"
				}
			}
		},
		messages: {
			"voyage_search[origin]": {
				remote: 'Please verify your point of departure'
			},
			"voyage_search[dest]": {
				remote: 'Please verify your destination'
			}
		}
	});


	$('#search-home, #search-modify').submit(function () {
		if (path.indexOf('/test_results') == -1) {
	    	showHide();
	   	}
	});

	function showHide() {
	    $('.navbar').css('visibility', 'hidden');
	    $('#main-content').hide();  
	    $('.panel-footer').hide();   
	    //$('#background-image').css('background', 'none')   
	    $('#interstitial-container').show()
	}

	function notyet() {
	    $('#notYet').modal('show')
	    return false;
	}


	if ($('#way_selection  input[type=radio]:checked').val() == 'OneWay') {
		$('#modifyReturn').hide();
		$('#voyage_search_return').parent().parent().hide();
		$('#voyage_search_return').val('')
		$('#way_selection .active').removeClass('active');
		$('#way_selection label:eq(1)').addClass('active');
	}

	// Bootstrap radio button
	$("#way_selection input:radio").change(function(){

		$(this).parent().addClass('active').siblings().removeClass('active');
		if ($(this).val() == 'OneWay') {
			$('#modifyReturn').hide();
			$('#voyage_search_return').parent().parent().hide();
			$('#voyage_search_return').val('')

			if ($('#new_test_result').length > 0) {
				$('#test_result_return').parent().parent().hide();
				$('#test_result_return').val('')
				$('#test_result_addons_in_carry1').parent().parent().hide();
				$('#test_result_addons_in_carry1').val('')
				$('#test_result_addons_in_bags1').parent().parent().hide();
				$('#test_result_addons_in_bags1').val('')
				$('#test_result_addons_in_weight1').parent().parent().hide();
				$('#test_result_addons_in_weight1').val('')
				$('#test_result_in_day').parent().hide();
				$('#test_result_in_day').val('')
				$('select').trigger("chosen:updated");
				$('#test_in_b_title').hide();
			}
		}else {
			//var date2 = $('#voyage_search_leave').datepicker('getDate', '+1d'); 
			//if (date2) {
			//	date2.setDate(date2.getDate()+2); 
			//	$('#voyage_search_return').datepicker('setDate', date2);
			//}
			$('#modifyReturn').show();
			$('#voyage_search_return').parent().parent().show();

			if ($('#new_test_result').length > 0) {
				$('#test_result_return').parent().parent().show();
				$('#test_result_addons_in_carry1').parent().parent().show();
				$('#test_result_addons_in_bags1').parent().parent().show();
				$('#test_result_addons_in_weight1').parent().parent().show();
				$('#test_result_in_day').parent().show();
				$('#test_in_b_title').show();
			}
		}
	});

	$.datepicker._updateDatepicker_original = $.datepicker._updateDatepicker;
    $.datepicker._updateDatepicker = function(inst) {
        $.datepicker._updateDatepicker_original(inst);
        var afterShow = this._get(inst, 'afterShow');
        if (afterShow)
            afterShow.apply((inst.input ? inst.input[0] : null));  // trigger custom callback
    }


	$('.date_picker_leave').datepicker({ 
		numberOfMonths: [1, 2], 
		minDate: 2,
	    dateFormat: 'd-M-yy',
	    beforeShow: function(dateText) {
	    	if ($('#voyage_search_leave').datepicker('getDate', '+0d') == null) {
	    		$('#voyage_search_leave').datepicker( "setDate", 14);
	    	}
	    },
	    afterShow : function(dataText) {
	    	//$('*[data-handler="selectDay"]:eq(0)').addClass('ui-datepicker-today');
	    	//$('*[data-handler="selectDay"]:eq(0)').find('a').addClass('ui-state-highlight');
	    },
	    onSelect: function(dateText) {
	    	//setDefaultDates();
	    } 
	});

	
	$('#voyage_search_return').datepicker({ 
		numberOfMonths: [1, 2], 
	    dateFormat: 'd-M-yy',
	    beforeShow: function(dateText) { 
	    	setDefaultDates();
	    	setDefaultDates();
	    }

	});

	function setDefaultDates() {
		if (!$('#voyage_search_return').attr('disabled')) {
	    	var date2 = $('#voyage_search_leave').datepicker('getDate', '+0d'); 
	    	
	    	if (date2 != null) {
	    		return_date = new Date(date2.getTime() + 7 * 24 * 60 * 60 * 1000)
				$('#voyage_search_return').datepicker('setDate', return_date);
				$('#voyage_search_return').datepicker('option', 'minDate', date2);
			}else {
				$('#voyage_search_return').datepicker('option', 'minDate', 2);
			}
		}
	}

	$('#test_result_return').datepicker({ 
		numberOfMonths: [1, 2], 
	    dateFormat: 'd-M-yy',
	    beforeShow: function(dateText) { 
	    	setDefaultDatesTest();
	    	setDefaultDatesTest();
	    }

	});

	function setDefaultDatesTest() {
		if (!$('#test_result_return').attr('disabled')) {
	    	var date2 = $('#test_result_leave').datepicker('getDate', '+0d'); 
	    	
	    	if (date2 != null) {
	    		return_date = new Date(date2.getTime() + 7 * 24 * 60 * 60 * 1000)
				$('#test_result_return').datepicker('setDate', return_date);
				$('#test_result_return').datepicker('option', 'minDate', date2);
			}else {
				$('#test_result_return').datepicker('option', 'minDate', 2);
			}
		}
	}

	

	//$('.date_picker').datepicker({ 
	//	numberOfMonths: [1, 2], 
	//	minDate: 0,
	//    dateFormat: 'd-M-yy'
	//});

	//$('.date_picker_s').datepicker({ 
	//	numberOfMonths: [1, 2], 
	//	minDate: 2,
	//	dateFormat: 'd-M-yy',
	//	afterShow : function(dataText) {
	//    	//$('*[data-handler="selectDay"]:eq(0)').addClass('ui-datepicker-today');
	//    	//$('*[data-handler="selectDay"]:eq(0)').find('a').addClass('ui-state-highlight');
	//    } 
	//});

	


	// $('.time-select').timepicker({ 
	// 	'timeFormat': 'h:i A', 
	// 	'scrollDefaultNow': true });

	//$('.combobox').combobox();

	
	// Popover on payments page
 	$('#whatis_this').on('click', function(e) {
		e.preventDefault(); 

		$(this).popover({
        	html: true,
            content: function() {
   	        return $('#card_popover').html();
	       }
   	    }).on('click', function(e) {

   	    	$('.close-card-popover').on('click', function(e) { 
				$('#whatis_this').popover('hide');
		   		e.preventDefault();
		   	});
			
		});

   	});    

 	function fetchPath() {
 		path = window.location.pathname
 		href = window.location.href;
 		parts = href.split('/');

 		if (href.indexOf('/voyages/search') != -1  || href.indexOf('/voyages/manage') != -1 || href.indexOf('/voyages/success') != -1 || href.indexOf('/voyages/?open_survey') != -1 || href.indexOf('?manage') != -1)	 {
	 		pathname = "../voyages";
	 	}else if (path.indexOf('/admin/test_results') != -1) {
	 		pathname = "../../voyages";
	 	}else {
	 		if ((parts[3] == "voyages") || (parts[3] == "") || (parts[3] == "#")) {
 				pathname = "/voyages";
	 		}else {
	 			pathname = path + "/voyages";
	 		}
	 	}
 		
 		return pathname;
 	}

	 // Typeahead

	 $('.orig-dest').typeahead({
	    		remote : {
		        	url: fetchPath() + '/airports?q=%QUERY'
		    	}
			
	  });

	 $('.orig-dest-mod').typeahead({
				remote : {
		         url:  fetchPath() + '/airports?q=%QUERY'}
                      
	  });

	 

    // Cherry buttons 
    $('.btn-rslt').on('click', function(e) {

    	that = this;

    	$('#rslt').hide();

    	$('#sorting-results').modal({
	        backdrop: 'static',
	        keyboard: false,
	        display: true      
	      });

      	e.preventDefault();
        
		var order = $(this).text();
	

		//if (order == 'recommended' || order == 'cheapest') {
		//  $('.recommend').removeClass('btn-sand').addClass('btn-red');
		//  $(this).siblings().not('.recommend').removeClass('btn-red').addClass('btn-sand');
		//}
//
		//else {
			 $(this).removeClass('btn-sand').addClass('btn-red');
		  	 $(this).siblings().removeClass('btn-red').addClass('btn-sand');
		//}

		if (order == 'recommended') {
			$('#sorting-results').modal('hide');
			$('#rslt').show();
			selectABundle()
		}else {
			$.ajax({
				url : "../voyages/flight_sort/?order=" + order + '&sid=' + getParameterByName('sid'),
				type: "POST",
				dataType : "script"


			}).done(function() {
			  	$('#sorting-results').modal('hide');
			  	$('#rslt').show();
			  	$('.lead-tt').tooltip();

			  	window.setup_popovers();
			
			}).fail(function() {
			  	$('#sorting-results').modal('hide');
			  	$('#rslt').show();
			  	$('.lead-tt').tooltip();

			  	window.setup_popovers();
			});
		}
	});
 
    // payment
    $('#payment-cancel').on('click', function(e) {
      	e.preventDefault();
    	$('#payment-confirmation').modal('hide');
    	$('input[id=payment_detail_terms1]').attr('checked', false);
    	$('input[id=payment_detail_terms2]').attr('checked', false);
    	$('input[id=payment_detail_terms3]').attr('checked', false);
	});

	// payment
    $('#retry-payment').on('click', function(e) {
      	e.preventDefault();
    	$('#payment-failed').modal('hide');
    	$('input[id=payment_detail_terms1]').attr('checked', false);
    	$('input[id=payment_detail_terms2]').attr('checked', false);
    	$('input[id=payment_detail_terms3]').attr('checked', false);
	});

	$('.payment-re-search').on('click', function(e) {
      	e.preventDefault();
      	$('#payment-pnr-failed').modal('hide');
    	$("#search-modify form").submit();
	});

	$('.payment-re-search-re-cache').on('click', function(e) {
      	e.preventDefault();
      	$('#major-variance-failed').modal('hide');
      	$("#voyage_search_destroy_cache").val('1');
    	$("#search-modify form").submit();
	});

	$('#re-submit-booking').on('click', function(e) {
      	e.preventDefault();
      	$('#major-variance-failed').modal('hide');

      	$('#new_payment_detail').append(
	        $(document.createElement('input'))
	            .attr('type', 'hidden')
	            .attr('name', 'ignore_variance')
	            .attr('value', 'true')
	    );

    	$("#new_payment_detail").submit();
	});

	$('#payment-book').on('click', function(e) {
      	e.preventDefault();
    	$('#payment-confirmation').modal('hide');
    	$('#new_payment_detail').append(
	        $(document.createElement('input'))
	            .attr('type', 'hidden')
	            .attr('name', 'payment_confirmed')
	            .attr('value', 'true')
	    );
    	$('#new_payment_detail').submit();
	});

	$('.cancel-booking').on('click', function(e) {
      	e.preventDefault();
    	$('#cancel-reservation').modal('hide');
    	$('#booking_cancel_verification').val(true);
    	$('#booking-cancel-form').submit();
	});

	$('#cancel-booking-cancel').on('click', function(e) {
      	e.preventDefault();
    	$('#cancel-reservation').modal('hide');
	});

	$('#cancel-booking-confirm').on('click', function(e) {
      	e.preventDefault();
    	$('#payment-confirmation').modal('hide');
    	$('#booking-cancel-form').append(
	        $(document.createElement('input'))
	            .attr('type', 'hidden')
	            .attr('name', 'cancel_confirmed')
	            .attr('value', 'true')
	    );
    	$('#booking-cancel-form').submit();
	});

	$('.send-booking-again').on('click', function(e) {
      	e.preventDefault();
    	$('#send-booking-email').modal({
	        backdrop: 'static',
	        keyboard: false,
	        display: true      
	      });
	});

	$('#open-survey').on('click', function(e) {
      	e.preventDefault();

      	$('#survey_browser').val($.browser.name);

    	$('#survey-email').modal({
	        backdrop: 'static',
	        keyboard: false,
	        display: true      
	      });
	});

	$('.open-an-issue').on('click', function(e) {
      	e.preventDefault();

      	$('#issue_browser').val($.browser.name);

      	that = this;
      	$(this).text('Creating a screenshot ...')
      	$('#sending-issue-message').modal({
		   backdrop: 'static',
		   keyboard: false,
		   display: true      
		});

      	html2canvas($('body > .container'), {
		  onrendered: function(canvas) {

		    var img = canvas.toDataURL("image/png");
	        var output = img.replace(/^data:image\/(png|jpg);base64,/, "");
	        //var output = encodeURIComponent(img);

	        $('#issue_screenshot').val(output);

	        $(that).text('Report An Issue')
	        $('#sending-issue-message').modal('hide');
	        
	        $('#open-issue').modal({
	    	  backdrop: 'static',
	    	  keyboard: false,
	    	  display: true      
	    	});

		  }
		});


	});

	$('.send-issue-button').on('click', function(e) {
		e.preventDefault();


		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

		if (!re.test($('#issue_email').val())) {
			$('#issue-email-error').show()
		}else {
			$('#issue-email-error').hide()

			$('#open-issue').modal('hide');
			
			$('#sending-issue-message').modal({
			   backdrop: 'static',
			   keyboard: false,
			   display: true      
			});

			$('#issue-reported').hide();

			$.ajax({
				url : fetchPath()+ "/send_issue/?sid=" + getParameterByName('sid'),
				type: "POST",
				data: {
			      page: $('#issue_page').val(),
			      browser: $('#issue_browser').val(),
			      criteria: $('#issue_criteria').val(),
			      email: $('#issue_email').val(),
			      feedback: $('#issue_feedback').val(),
			      screenshot: $('#issue_screenshot').val()
			  },
			  dataType: 'json'


			}).done(function() {
			  	$('#sending-issue-message').modal('hide');
			  	$('#issue_feedback').val('');
			  	$('#issue-reported').show();
			
			}).fail(function() {
				$('#sending-issue-message').modal('hide');
				$('#issue_feedback').val('');
			  	alert('The was an error sending your issue.');
			});
		}
	});

	$('.send-survey-button').on('click', function(e) {
		e.preventDefault();

		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

		if (!re.test($('#survey_email').val())) {
			$('#survey-email-error').show()
		}else {
			$('#survey-email-error').hide()

			$('#survey-email').modal('hide');
			$('#sending-issue-message').modal({
			   backdrop: 'static',
			   keyboard: false,
			   display: true      
			});

			$('#survey-reported').hide();

			$.ajax({
				url : fetchPath()+ "/send_survey/?sid=" + getParameterByName('sid'),
				type: "POST",
				data: {
					survey: {
			          email: $('#survey_email').val(),
			          browser: $('#survey_browser').val(),
			          q1: $('input[name="survey[q1]"]:checked').val(),
			          q2: $('input[name="survey[q2]"]:checked').val(),
			          q3: $('input[name="survey[q3]"]:checked').val(),
			          q4: $('input[name="survey[q4]"]:checked').val(),
			          q5: $('input[name="survey[q5]"]:checked').val(),
			          q6: $('input[name="survey[q6]"]:checked').val(),
			          q7: $('input[name="survey[q7]"]:checked').val(),
			          feedback: $('#survey_feedback').val()
			        }
			  },
			  dataType: 'json'


			}).done(function() {
			  	$('#sending-issue-message').modal('hide');
			  	$('#survey_email').val('');
			  	$('input[name="survey[q1]"]').attr('checked', false);
				$('input[name="survey[q2]"]').attr('checked', false);
				$('input[name="survey[q3]"]').attr('checked', false);
				$('input[name="survey[q4]"]').attr('checked', false);
				$('input[name="survey[q5]"]').attr('checked', false);
				$('input[name="survey[q6]"]').attr('checked', false);
				$('input[name="survey[q7]"]').attr('checked', false);
			  	$('#survey_feedback').val('');
			  	$('#survey-reported').show();
			
			}).fail(function() {
				$('#sending-issue-message').modal('hide');
				$('#survey_feedback').val('');
			  	alert('The was an error sending your survey.');
			});
		}
	});





	

});

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

Number.prototype.formatMoney = function(decPlaces, thouSeparator, decSeparator) {
    var n = this,
    decPlaces = isNaN(decPlaces = Math.abs(decPlaces)) ? 2 : decPlaces,
    decSeparator = decSeparator == undefined ? "." : decSeparator,
    thouSeparator = thouSeparator == undefined ? "," : thouSeparator,
    sign = n < 0 ? "-" : "",
    i = parseInt(n = Math.abs(+n || 0).toFixed(decPlaces)) + "",
    j = (j = i.length) > 3 ? j % 3 : 0;
    return sign + (j ? i.substr(0, j) + thouSeparator : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thouSeparator) + (decPlaces ? decSeparator + Math.abs(n - i).toFixed(decPlaces).slice(2) : "");
};
