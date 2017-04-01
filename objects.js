$(document).ready(function() {

	$.fn.extend({
		verticalScroll: function() {
			return this.get(0) ? this.get(0).scrollHeight > this.innerheight() : false;
		}
	});

	/* ***************************************************************************************************** */
	/* *** Close Option Menus ****************************************************************************** */
	/* ***************************************************************************************************** */

	$(document).dblclick(function() {
		$('.object_menu').hide(300);
		$('.sub_object_menu').hide(300);
	});

	/* ***************************************************************************************************** */
	/* *** Add object ************************************************************************************** */
	/* ***************************************************************************************************** */

	$(document).on('click', '.add_object', function (e) {
		$('#object_top').val(70);
		var params = $(this).prop('id').split('|');
		var object_class = $('#object_class').val();
		$('#object_class').val()
		$('#object_type').val(params[0]);
		$('#object_action').val('Add');
		if ($('#object_id').val() == '') {
			var id = 0;
		} else {
			var id = $('#object_id').val();
		}
		console.log(object_class + ' ' + params[0]);
		var url = '/common_develop/add/' + id + '/' + object_class + '/' + params[0];
		$.ajax({
			url: url,
			type: 'GET',
			async: true,
			dataType: 'html',
			success: function(data) {
				$('#add_object_form').html(data);
				$('.object_menu').hide(300);
				//$('.menu_option').hide(300);
				$('#add_object').center().slideDown(300);
				scroll_to('#add_object');
			}
		});
		e.stopImmediatePropagation();
	});

	/* **************************************************************************************************** */
	/* *** Show object options **************************************************************************** */
	/* **************************************************************************************************** */

	$(document).on('click', '.show_object_options', function (e) {
		var params = $(this).prop('id').split('|');
		//console.log('ID: '+params[0]+' '+params[1]+' '+params[2]+' '+params[3]);
		var top	= ($(this).offset().top + 18);
		var left= ($(this).offset().left + 2);
		$('#object_top').val(top);
		$('#object_left').val(left);
		$('.menu').hide();
		$('.hidden_div').hide(300);
		$('.sub_object_menu').hide(300);
		$('#object_id').val(params[0]);
		$('#object_name').val(params[1]);
		$('#object_type').val(params[3]);
		$('#object_active').val(params[2]);
		//console.log($('.object_menu').css('display'));
		if ($('.object_menu').css('display') == 'block') {
			$('.object_menu').hide(300);
		} else {
			$('.object_menu').css({left: left, top: top}).show(300);
			scroll_to('.object_menu');
		}
		e.stopImmediatePropagation();
	});

	$(document).on('click', '.show_sub_object_options', function (e) {
		var params = $(this).prop('id').split('|');
		//console.log(params);
		var top	= ($(this).offset().top + 15);
		var left= ($(this).offset().left);
		$('#object_top').val(top);
		$('#object_left').val(left);
		$('.menu').hide();
		$('.object_menu').hide();
		$('.hidden_div').hide(300);
		$('#object_id').val(params[0]);
		$('#object_name').val(params[1]);
		$('#object_type').val(params[2]);
		if ($('.sub_object_menu').css('display') == 'block') {
			$('.sub_object_menu').hide(300);
		} else {
			$('.sub_object_menu').css({left: left, top: top}).slideDown(300);
		}
		e.stopImmediatePropagation();
	});

	/* **************************************************************************************************** */
	/* *** Object Options ********************************************************************************* */
	/* **************************************************************************************************** */

	$(document).on('click', '.object_options', function () {
		//$('.object_menu').hide(300);
		var object_id = $('#object_id').val();
		var params = $(this).prop('id').split("|");
		//console.log(params);
		if (params[0] == 'change_password') {
			change_password(params[0], object_id);
		} else if (params[0] == 'change_status') {
			change_status();
		} else if (params[0] == 'edit') {
			edit_object(object_id, params[0], params[2]);
		} else if (params[0] == 'delete') {
			delete_object(params[0], params[1], params[2]);
		} else if (params[0] == 'remove') {
			remove_object(params[1]);
		} else if (params[0] == 'fetch_object_relatives') {
			fetch_object_relatives(object_id, params[1], params[2]);
		} else if (params[0] == 'edit_site_objects') {
			edit_site_objects(object_id);
		}
		console.log('ID: '+object_id+' '+params[0]+' '+params[1]+' '+params[2]);
	});

	/* **************************************************************************************************** */
	/* *** Show object details **************************************************************************** */
	/* **************************************************************************************************** */

	$(document).on('click', '.show_object_details', function () {
		var params	= $(this).prop('id').split('_');
		//var vertical = verticalScroll();
		//console.log(vertical);
		//console.log(params[1] + '--' + $('#object_class').val());
		//console.log(params);
		//var name = format_object_name();
		$('.hidden_div').hide(300);
		if ($('#show_object_details').css('display') == 'none') {
			$('.menu').hide(300);
			$('.object_menu').hide(300);
			$('.display_name').html($('#object_name').val() + ' Details');
			var top		= ($(this).offset().top - 7) + 'px';
			var left	= ($(this).offset().left - 292) + 'px';
			//console.log(top+' '+left);
			var data_el = show_el = '#show_object_details';
			var url		= '/common_develop/details/' + params[1] + '/' + $('#object_class').val();
			//console.log(url);
			ajax_get_html(url, data_el, show_el, left, top);
		} else {
			//$('#show_object_details').hide();
		}
	});

	$(document).on('click', '.show_secondary_object_details', function () {
		var params = $(this).prop('id').split('_');
		//console.log(params);
		var name = format_object_name();
		if ($('#show_object_details').css('display') == 'none') {
			$('.menu').hide(300);
			$('.object_menu').hide(300);
			$('.display_name').html($('#object_name').val() + ' Details');
			var top		= ($(this).offset().top - 7) + 'px';
			var left	= ($(this).offset().left - 292) + 'px';
			var data_el = show_el = '#show_object_details';
			var url		= '/common_develop/details/' + params[0] + '/' + params[1];
			//console.log(url);
			ajax_get_html(url, data_el, show_el, left, top);
			$('#secondary_' + params[1]).prop('title', 'Hide ' + name + ' Details');
		} else {
			$('#show_object_details').hide();
			$('#secondary_' + params[1]).prop('title', 'Show ' + name + ' Details');
		}
	});
	
	$(document).on('click', '.image_link', function (e) {
		var params	= $(this).prop('id').split('|');
		var top		= ($(this).offset().top + 20) + 'px';
		var left	= ($(this).offset().left - 80) + 'px';
		//console.log(params[1]);
		if ($('#object_hover_image').css('display') == 'block') {
			$('#object_hover_image').hide(300);
		} else {
			$.ajax({
				url: '/common_develop/details/' + params[1] + '/object_image',
				type: 'GET',
				async: true,
				dataType: 'html',
				success: function(data2) {
					$('#object_hover_image').html(data2);
					$('#object_hover_image').css({left: left, top: top}).slideDown(300);
				}
			});
		}
		e.stopImmediatePropagation();
	});


	$(document).on('click', '.object_children', function (e) {
		var id = $(this).prop('id');
		var params = id.split('_');
		$('#account_id').val(params[1]);
		if ($('#object_class').val() == 'users') {
			var source = 'object_children';
		} else {
			var source = 'objects';
		}
		//console.log(params[1]);
		$('.object_menu').hide(300);
		console.log(params[1] + ' ' + $('#show_' + params[1]).css('display'));
		if ($('#show_' + params[1]).css('display') == 'none') {
			$('.hidden_div').hide();
			$('#children_' + params[1]).hide();
			$('#hide_' + params[1]).hide();
			$('#show_' + params[1]).show();
		} else {
			$('#show_' + params[1]).hide();
			$('#hide_' + params[1]).show();
			var url = '/common_develop/object_relatives/' + params[1] + '/' + $('#object_class').val();
			//console.log(url);
			$.ajax({
				url: url,
				type: 'GET',
				async: true,
				dataType: 'html',
				success: function(data) {
					$('#children_' + params[1]).html(data);
					$('#children_' + params[1]).slideDown();
				}
			});
		}
		e.stopImmediatePropagation();
	});

	$(document).on('click', '#super_group', function () {
		if ($('#super_group').prop('checked') == true) {
			$('.grp_child').prop('checked', false);
			$('.grp_child').prop("disabled", true);
		} else {
			$('.grp_child').prop("disabled", false);
		}
	});

	/* **************************************************************************************************** */
	/* *** Execute status change ************************************************************************** */
	/* **************************************************************************************************** */

	$(document).on('click', '#commit_status_change', function () {
		//console($('#object_class').val());
		var status_change = 1;
		if ($('#object_active').val() == 1) {
			var status_change = 0;
		}
		formData = new Object;
		formData.id 	= $('#object_id').val();
		formData.active	= status_change;
		url = '/utilities/change_status/' + $('#object_class').val();
		$.ajax({
			url: url,
			type: 'POST',     
			data: formData,
			success: function(data) {
				location.reload();
			}
		});
	});

	/* **************************************************************************************************** */
	/* *** Save children ********************************************************************************** */
	/* **************************************************************************************************** */

	$(document).on('click', '#save_children', function () {
		var selected = [];
		$.each($("input[name='child']:checked"), function(){
			selected.push($(this). val());
		});
		var formData = new Object;
		formData.id		= $('#object_id').val();
		formData.objects= selected;
		formData.parent	= $('#parent').val()
		formData.child	= $('#child').val()
		$.ajax({
			type: 'POST',
			data: formData,
			url: '/object_children/insert',
			success: function(data) {
				location.reload();
			}
		});
	});

	$(document).on('click', '.group_users', function () {
		if ($('#object_users').css('display') == 'block') {
			$('#object_users').hide();
			$(this).prop('title', 'Show Group Users');
		} else {
			$(this).prop('title', 'Hide Group Users');
			var top	= $(this).offset().top + 'px';
			var left= ($(this).offset().left + 20) + 'px';
			var id 	= $(this).prop('id').replace('object_', '');
			$.ajax({
				url: '/user_groups/group_users/' + id,
				type: 'GET',
				async: true,
				dataType: 'html',
				success: function(data) {
					$('#object_users').html(data);
					$('#object_users').css({left: left, top: top}).slideDown();
				}
			});
		}
	});

	$(document).on('click', '.close_secondary_popup', function () {
		$('.action_button').removeClass('disabled_button');
		$('.secondary_hidden_div').hide();
		$('.object_form *').enable();
	});

	$(document).on('click', '.info_popup', function () {
		//alert($('#object_name_disp').val()+' '+$('#child_name_disp').val());
		$('.' + $('#child_name_disp').val()).prop('title', 'Show ' + $('#object_name_disp').val() + ' ' + $('#child_name_disp').val());
		$('.group_users').prop('title', 'Show Group Members');
		$('.info_popup').hide();
	});

	/* **************************************************************************************************** */
	/* *** Group Permission Functions ********************************************************************* */
	/* **************************************************************************************************** */

	$(document).on('click', '#group_permissions', function () {
		var top	= $('#object_top').val() + 'px';
		var left= $('#object_left').val() + 'px';
		var url = '/common_develop/group_permissions/' + $('#object_id').val();
		//console.log(url);
		$.ajax({
			url: url,
			type: 'GET',
			async: true,
			dataType: 'html',
			success: function(data) {
				$('#group_permissions_form').html(data);
				$('#show_group_permissions').css({left:left, top:top}).slideDown(300);
			}
		});
	});

	$(document).on('click', '.parent_module', function () {
		var params = $(this).prop('id').split('_');
		if ($(this).is(':checked')) {
			$('.child_' + params[1]).prop('checked', true);
		} else {
			$('.child_' + params[1]).prop('checked', false);
		}
	});

	$(document).on('click', '.child_module', function () {
		var params = $(this).prop('id').split('_');
		if ($(this).is(':checked')) {
			$('.child_' + params[1]).prop('checked', true);
		} else {
			$('.child_' + params[1]).prop('checked', false);
		}
	});

	$(document).on('click', '#commit_group_permissions', function () {
		var modules = $("input[name='module']:checked").map(function () {return this.value;}).get().join(",");
		formData 		= new Object;
		formData.modules= modules;
		formData.id 	= $('#object_id').val();
		$.ajax({
			url: '/groups/save_group_permissions',
			type: 'POST',
			data: formData,
			dataType: 'html',
			success: function(data) {
				location.reload();
			}
		});
	});

	/* **************************************************************************************************** */
	/* *** Execute delete object ************************************************************************** */
	/* **************************************************************************************************** */

	$(document).on('click', '#delete_object', function () {
		formData = new Object;
		formData.id = $('#object_id').val();
		//console.log($('#object_class').val());
		if ($('#object_class').val() == 'object_images') {
			var url = '/objects/delete_image';
		} else {
			var url = '/utilities/delete/' + $('#object_class').val();
		}
		$.ajax({
			url: url,
			type: 'POST',
			data: formData,
			dataType: 'html',
			success: function(data) {
				location.reload();
			}
		});
	});

	/* **************************************************************************************************** */
	/* *** Execute remove object ************************************************************************** */
	/* **************************************************************************************************** */

	$(document).on('click', '#remove_object', function () {
		//alert($('#data_model').val());
		formData = new Object;
		formData.id = $('#object_id').val();
		$.ajax({
			url: '/utilities/delete/' + $('#object_action').val(),
			type: 'POST',
			data: formData,
			dataType: 'html',
			success: function(data) {
				location.reload();
			}
		});
	});
	
	$('.object_image_hover').hover(
		function() {
			var params	= $(this).prop('id').split('|');
			var top		= ($(this).offset().top + 22) + 'px';
			var left	= ($(this).offset().left + 28) + 'px';
			var details	= 'details_' + params[1];
			//console.log($(this).offset());
			//console.log(top+' '+left);
			console.log(params[0]);
			t = setTimeout(function() {
				$.ajax({
					url: '/common_develop/details/' + params[0] + '/object_full_image',
					type: 'GET',
					async: true,
					dataType: 'html',
					success: function(data) {
						$('.object_menu').hide();
						$('#object_hover_image').html(data);
						$('#object_hover_image').css({left: left, top: top}).show(300);
					}
				});
			}, 500);
		},
		function() {
			clearTimeout(t);
			$('#object_hover_image').hide(300);
		}
	);
});

/* **************************************************************************************************** */
/* *** Position Modal ********************************************************************************* */
/* **************************************************************************************************** */

function position_modal() {
	var css 	= new Array();
	var top		= $('#object_top').val();
	var left	= $('#object_left').val();
	css.left	= left;
	css.top		= top;
	return css;
}

/* **************************************************************************************************** */
/* *** Scroll to DIV ********************************************************************************** */
/* **************************************************************************************************** */

function scroll_to(div) {
	$('html, body').animate({
		scrollTop: $(div).offset().top
	},1000);
}

/* **************************************************************************************************** */
/* *** Change password ******************************************************************************** */
/* **************************************************************************************************** */

function change_password(action, id) {
	//console.log(action+' '+id);
	var top = position_modal().top + 'px';
	var left= position_modal().left + 'px';
	$('#object_id').val(id);
	$('#password_action, #object_action').val(action);
	$('.display_name').html('(' + $('#object_name').val() + ')');
	$('#user_password').css({left:left, top:top}).slideDown(300);
}

/* **************************************************************************************************** */
/* *** Change object status warning ******************************************************************* */
/* **************************************************************************************************** */

function change_status() {
	var top = position_modal().top;
	var left= position_modal().left;
	//console.log(left+' '+top);
	if ($('#object_active').val() == 1) {
		var disp_object_val = 'Inactive';
	} else {
		var disp_object_val = 'Active';
	}
	$('.display_name').html('(' + $('#object_name').val() + ')');
	$('#disp_object_val').text(disp_object_val);
	$('#object_action').val('change_status');
	$('#change_status_warning').center().css({left:left, top:top}).slideDown(300);
}

/* **************************************************************************************************** */
/* *** Edit object ************************************************************************************ */
/* **************************************************************************************************** */

function edit_object(id, source) {
	var top	= parseInt(position_modal().top) + 'px';
	var left= parseInt(position_modal().left) - 0 + 'px';
	$('#object_id').val(id);
	$('#object_action').val('Edit');
	var url = '/common_develop/edit/' + id + '/' + $('#object_class').val();
	//console.log(url);
	$.ajax({
		url: url,
		type: 'GET',
		async: true,
		dataType: 'html',
		success: function(data) {
			$('#edit_object_form').html(data);
			$('#edit_object').css({left:left, top:top}).slideDown(300);
			scroll_to('#edit_object');
		}
	});
}

/* **************************************************************************************************** */
/* *** Delete object warning ************************************************************************** */
/* **************************************************************************************************** */

function delete_object(method) {
	//console.log(method);
	var top	= parseInt(position_modal().top) + 'px';
	var left= parseInt(position_modal().left) - 0 + 'px';
	//console.log(left+' '+top);
	$('#object_action').val(method);
	$('.display_name').html('(' + $('#object_name').val() + ')');
	$('#delete_object_warning').center().slideDown(300);
}

/* **************************************************************************************************** */
/* *** Remove object warning ************************************************************************** */
/* **************************************************************************************************** */

function remove_object(table) {
	//console.log(table);
	var top = position_modal().top + 'px';
	var left= position_modal().left + 'px';
	$('.sub_object_menu').hide();
	$('#object_action').val(table);
	$('.display_name').html('(' + $('#object_name').val() + ')');
	$('#remove_object_warning').css({left:left, top:top}).slideDown(300);
}

/* **************************************************************************************************** */
/* *** Fetch and display object children ************************************************************** */
/* **************************************************************************************************** */

function fetch_object_relatives(id, parent, child) {
	var top	= parseInt(position_modal().top) + 0 + 'px';
	var left= parseInt(position_modal().left) - 0 + 'px';
	//console.log(id+' '+parent+' '+child);
	$('.object_name').val(name);
	$('#object_id').val(id);
	$('#child').val(child);
	$('#parent').val(parent);
	$('#source').val('object_children');
	if (parent == 'user_departments') {
		var child_name = 'Departments';
	} else if (parent == 'user_groups') {
		var child_name = 'Groups';
	}
	var url = '/common_develop/object_relatives/' + id + '/' + parent + '/' + child;
	//console.log(url);
	$.ajax({
		url: url,
		type: 'GET',
		dataType: 'html',
		success: function(data) {
			//console.log('fred');
			$('#child_name').text(child_name);
			$('#children_list').html(data);
			$('#object_children').css({left:left, top:top}).slideDown(300);
		}
	});
}

/* **************************************************************************************************** */
/* *** Format object name ***************************************************************************** */
/* **************************************************************************************************** */

function format_object_name() {
	var params = $('#name_type').val().split(' ');
	return params[1];
}

/* **************************************************************************************************** */
/* *** Edit site objects ****************************************************************************** */
/* **************************************************************************************************** */

function edit_site_objects(site) {
	$('#object_action').val('Update_XML');
	var top = position_modal().top + 'px';
	var left= position_modal().left + 'px';
	$.ajax({
		url: '/sites/show_site_objects/' + site,
		type: 'GET',
		dataType: 'html',
		success: function(data) {
			$('#site_object_details').html(data);
			$('#site_objects').css({left:left, top:top}).slideDown(300);
		}
	});
}

