<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="/css/bootstrap-iso.css">
	<link rel="stylesheet" type="text/css" href="/css/header.css">
	<link rel="stylesheet" type="text/css" href="/css/buttons.css">
	<link rel="stylesheet" type="text/css" href="/css/divisions.css">
	<link rel="stylesheet" type="text/css" href="/css/inputs.css">
	<link rel="stylesheet" type="text/css" href="/css/links.css">
	<link rel="stylesheet" type="text/css" href="/css/menu.css">
	<link rel="stylesheet" type="text/css" href="/css/misc.css">
	<link rel="stylesheet" type="text/css" href="/css/tables.css">
	<link rel="stylesheet" type="text/css" href="/css/tabs.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">
</head>
<body>
	<?php if ($header):
	echo $header;
	endif;
	echo $middle;
	if ($footer):
	echo $footer;
	endif; ?>
	<script type="text/javascript" src="/bower_components/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="/bower_components/jquery-ui/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/bower_components/bootstrap/dist/js/tether.min.js"></script>
	<script type="text/javascript" src="/javascript/acme.js"></script>
	<script type="text/javascript" src="/javascript/objects.js"></script>
	<script type="text/javascript" src="/javascript/validate.js"></script>
	<?php if (count($sites) > 0): ?>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=yadiyadiyadi"></script>
	<?php endif; ?>
</body>
</html>
