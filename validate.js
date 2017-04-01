$(document).ready(function() {
	$('.validate_object').click(function() {
		validate_input($('#object_action').val());
	});

	$(document).keypress(function(e) {
    	if(e.which == 13) {
    		validate_input();
		}
	});

	$('.first_input').focus();

	/* **************************************************************************************************** */
	/* *** Enforce a-z,A-Z,0-9,_ text input *************************************************************** */
	/* **************************************************************************************************** */

	$('#xml_name').keypress(function (e) {
		var allowedChars = new RegExp("^[a-zA-Z0-9_]*$");
		var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
		if (allowedChars.test(str)) {
		    return true;
		}
		e.preventDefault();
		return false;
	});

	/*
	$('#name').keypress(function (e) {
		var allowedChars = new RegExp("^[a-zA-Z0-9_]*$");
		var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
		if (allowedChars.test(str)) {
		    return true;
		}
		e.preventDefault();
		return false;
	});
	*/


	$('#name').keyup(function() {
		$('#xml_name').val($(this).val().toLowerCase().replace(/ /g, '_'));
		if (event.keyCode == 8 || event.keyCode == 46) {
			$('#xml_name').val($(this).val().toLowerCase().replace(/ /g, '_'));
		}
	});
});

/* ******************************************************************************************************** */
/* *** Check all forms for valid input and post to dB ***************************************************** */
/* ******************************************************************************************************** */

function validate_input(object_action) {
	var message = '';
	var name_type = $('#name_type').val();
	//console.log($('#object_class').val());
	if ($('#name').length > 0 && $('#name').val() == '') {
		message += '<p class="dark_contrast_text no_margin">Please enter ' + name_type + ' name.</p>';
	}
	if ($('#xml_name').length > 0 && $('#xml_name').val() == '') {
		message += '<p class="dark_contrast_text no_margin">Please enter ' + name_type + ' XML name.</p>';
	}
	if ($('#first_name').length > 0 && $('#first_name').val() == '') {
		message += '<p class="dark_contrast_text no_margin">Please enter ' + name_type + ' first name.</p>';
	}
	if ($('#last_name').length > 0 && $('#last_name').val() == '') {
		message += '<p class="dark_contrast_text no_margin">Please enter ' + name_type + ' last name.</p>';
	}
	if ($('#user_name').length > 0 && $('#user_name').val() == '') {
		message += '<p class="dark_contrast_text no_margin">Please enter a Username.</p>';
	}
	if ($('#email').length > 0 && $('#email').val() == '') {
		message += '<p class="dark_contrast_text no_margin">Please enter ' + name_type + ' email.</p>';
	}
	if ($('#ticket_module').length > 0 && $('#ticket_module').val() == 0) {
		message += '<p class="dark_contrast_text no_margin">Please select a module.</p>';
	}
	if ($('#ticket_issue').length > 0 && $('#ticket_issue').val() == '') {
		message += '<p class="dark_contrast_text no_margin">Please enter a ticket issue.</p>';
	}
	if ($('#tag_type').length > 0 && $('#tag_type').val() == '') {
		message += '<p class="dark_contrast_text no_margin">Please select a tag type.</p>';
	}
	if ($('#object_action').val() == 'change_password' || ($('#object_action').val() == 'Add' && $('#object_class').val() == 'users')) {
		if ($('#password').val() == '') {
			message += '<p class="dark_contrast_text no_margin">Please enter ' + name_type + ' password.</p>';
		}
		if ($('#verify').val() == '') {
			message += '<p class="dark_contrast_text no_margin">Please verify User password.</p>';
		}
		if ($('#verify').length > 0 && $('#verify').val() != $('#password').val()) {
			message += '<p class="dark_contrast_text no_margin">The passwords do not match.</p>';
		}
	}
	if ($('#action_list').length > 0) {
		var trigger_actions = $("input[name='trigger_action']:checked").map(function () {return this.value;}).get().join(",");
	} else {
		var trigger_actions = '';
	}
	if ($('#department_list').length > 0) {
		var departments = $("input[name='department']:checked").map(function () {return this.value;}).get().join(",");
	} else {
		var departments = '';
	}
	if ($('#execution_list').length > 0) {
		var executions = $("input[name='execution']:checked").map(function () {return this.value;}).get().join(",");
	} else {
		var executions = '';
	}
	if ($('#group_list').length > 0) {
		var groups = $("input[name='group']:checked").map(function () {return this.value;}).get().join(",");
	} else {
		var groups = '';
	}
	if ($('#relative_list').length > 0) {
		var relatives = $("input[name='relative']:checked").map(function () {return this.value;}).get().join(",");
	} else {
		var relatives = '';
	}
	if ($('#relative_number_list').length > 0) {
    	var selections = [];
		$('.relative_number').each(function() {
	    	var select_id	= $(this).prop('id').replace('relative_', '');
	    	var select_val	= $(this).val();
	    	if (select_val > 0) {
	    		selections.push({
	    			'object_id': select_id,
	    			'number': select_val
	    		});
	    	}
		});
   		var selections = selections;
	} else {
		var selections = '';
	}
	if ($('#site_object_list').length > 0) {
		var xml_names = [];
		$('.xml_name').each(function() {
			var object_val	= $(this).val();
			var object_id	= $(this).prop('id').replace('xml_name_', '');
	    	if (object_val != '') {
	    		xml_names.push({
	    			'object_id': object_id,
	    			'xml_name': object_val
	    		});
	    	}
	    });
	    //console.log(xml_names);
	    console.log(object_action);
	} else {
		var xml_names = '';
	}
	if ($('#trigger_list').length > 0) {
		var triggers = $("input[name='trigger']:checked").map(function () {return this.value;}).get().join(",");
	} else {
		var triggers = '';
	}
	if ($('#image_name').length > 0 && $('#image_name').val() == '') {
		message += '<p class="dark_contrast_text no_margin">Please select ' + name_type + ' full size file.</p>';
	}
	if ($('#thumb_name').length > 0 && $('#thumb_name').val() == '') {
		message += '<p class="dark_contrast_text no_margin">Please select ' + name_type + ' thumbnail file.</p>';
	}
	if (message != '') {
		//console.log(message);
		var top	= $('#object_top').val() + 'px';
		var left= $('#object_left').val() + 'px';
		$('.object_form *').disable();
		$('.action_button').addClass('disabled_button');
		$('.error_message').html(message);
		if (object_action == 'change_password') {
			$('#error_title').html('Change Password Error!');
		} else {
			object_action = object_action.replace("_", " ");
			$('#error_title').html(object_action + ' ' + $('#object_type').val() + ' Error!');
		}
		if (object_action == 'Edit' || object_action == 'change_password') {
			$('#message_popup').css({left: left, top: top}).show(300);
			console.log(object_action);
		} else {
			var top2	= ($('.validate_object').offset().top - 50) + 'px';
			var left2	= ($('.validate_object').offset().left - 275) + 'px';
			$('#message_popup').css({left: left2, top: top2}).slideDown(300);
			scroll_to('#message_popup');
		}
	} else {
		//console.log($('#man_name').val());
		formData = new Object;
		formData.id 			= $("#object_id").val();
		formData.image_id		= $("#image_id").val();
		formData.name 			= $('#name').val();
		formData.website		= $('#website').val();
		formData.primary_contact= $('#primary_contact').val();
		formData.xml_name		= $('#xml_name').val();
		formData.man_type		= $('#man_type').val();
		formData.man_id			= $('#man_id').val();
		formData.mod_id			= $('#mod_id').val();
		formData.first_name 	= $('#first_name').val();
		formData.last_name		= $('#last_name').val();
		formData.user_name		= $('#user_name').val();
		formData.email			= $('#email').val();
		formData.password		= $('#password').val();
		formData.account_num	= $('#account_num').val();
		formData.description	= $('#description').val();
		formData.manager_id		= $('#manager_id').val();
		formData.units_measured	= $('#units_measured').val();
		formData.latitude		= $('#latitude').val();
		formData.longitude		= $('#longitude').val();
		formData.class			= $('#class').val();
		formData.method			= $('#method').val();
		formData.active			= $('#active').val();
		formData.order_by		= $('#order_by').val();
		formData.units			= $('#units').val();
		formData.tag_type		= $('#tag_type').val();
		formData.threshold		= $('#threshold').val();		
		formData.ticket_module	= $('#ticket_module').val();
		formData.ticket_issue	= $('#ticket_issue').val();
		formData.ip_address		= $('#ip_address').val();
		formData.trigger_actions= trigger_actions;
		formData.departments	= departments;
		formData.executions		= executions;
		formData.groups			= groups;
		formData.relatives		= relatives;
		formData.triggers		= triggers;
		formData.selections		= selections;
		formData.xml_names		= xml_names;
		if ($('#object_class').val() == 'object_images') {
			$('#object_image').submit();
			location.reload();
		} else {
			var url = '/' + $('#object_class').val() + '/' + object_action;
			//console.log(url);
			$.ajax({
				url: url,
				type: 'POST',     
				data: formData,
				success: function(data) {
					if (object_action == 'submit_ticket') {
						$('#form').reset();
						$('#submission_type').html('Help Ticket Submitted');
						$('#submission_text').html('Your help ticket was successfully submitted');
						$('#subit_success').show(300);
					} else if ($('#object_class').val() == 'sites' && object_action == 'Add') {
						var site = $.parseJSON(data);
						//console.log(site);
						$.ajax({
							url: '/sites/show_site_objects/' + site,
							type: 'GET',
							dataType: 'html',
							success: function(data) {
								$('#object_action').val('Update_XML');
								$('#add_object').hide(300);
								$('#site_object_details').html(data);
								$('#site_objects').center().show(300);
							}
						});
					} else if ($('#object_class').val() == 'object_images') {
						location.reload();
					} else {
						location.reload();
					}
				}
			});
		}
	}
}
