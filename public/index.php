<?php
	/*
	 * All scripting, HTML code, and CSS styles copyright 2012 Steven Petryk. All rights reserved.
	 */
	
	require('./api/bjs.lib.php');
	
	$reservation = getReservation();
	if($reservation && $reservation['timescheduled'] > time()) {
		require('./placereservation.php');
		die();
	} 
	
?>
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>BJ's Order &amp; Reserve &ndash; Sign In</title>
		<link rel="stylesheet" type="text/css" href="/css/main.css" />
		<link rel="stylesheet" type="text/css" href="/css/tooltip.css" />
		<link rel="stylesheet" type="text/css" href="/scripts/blitzer/jquery-ui-1.8.20.custom.css" />
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.js"></script>
		<script type="text/javascript" src="https://raw.github.com/carhartl/jquery-cookie/master/jquery.cookie.js"></script>
		<script type="text/javascript" src="/scripts/datetimepicker.jqueryui.js"></script>
		<script type="text/javascript" src="/api/json2.js"></script>
		<script type="text/javascript" src="/api/menu.js"></script>
		<script type="text/javascript" src="/scripts/tooltip.js"></script>
	</head>

	<body <?php if(!$customerData) echo 'class="login"'; ?>>

		<?php if(!$customerData) { ?>
			<div id="login">
				<a id="loginLogo" href="http://bjsbrewhouse.com/"><img alt="" src="/images/logo-bjs.png" /></a>
				<?php
					if(isset($_GET['error'])) {
						if($_GET['error'])
						echo '<p style="margin:10px; color: white;">Incorrect username or password.</p>';
					}
				?>
				<form action="/login.php?return_uri=<?php echo $_SERVER['REQUEST_URI']; ?>" method="post">
					<input type="text" name="login_email" placeholder="E-mail" />
					<input type="password" name="login_password" placeholder="Password" />
					<input type="submit" name="login_submit" id="login_submit" value="Sign In" />
					<a id="clickToRegister" href="/register.php">create account</a>
				</form>
			</div> </body></html>
		<?php die(); } ?>
		
		<div id="header">
			<a href="/"><img alt="" src="/images/logo-bjs.png" /></a>
		</div>
	
	<div id="wrapper">
	
		<div id="sectionPane">
			<ul>
				<?php
					foreach(getCategories() as $category) {
						echo('
							<li><a href="#'.$category['id'].'"><!--<img src="'.$category['photo'].'" /> -->'.$category['name'].'</a></li>
						');
					}
				?>
			</ul>
			<ul>
				<li><a href="#favorites">Favorites <img style="float: right;" alt="Favorites Star" src="/images/favorites.png" /></a></li>
			</ul>
			
			<ul>
				<li><a id="doNotSelect" href="/logout.php?return_uri=<?php echo $_SERVER['REQUEST_URI']; ?>">Log out</a></li>
			</ul>
		</div>
		
		<div id="menuOptionsPane">
			
		</div>
		
		<div id="aboutReservation"><div>
			<h1>Your Order</h1>
				<form id="reservationform" action="/placereservation.php">
				<div class="reservationCard">
					<h2><?php echo $customerData['firstname'].' '.$customerData['lastname'] ?></h2>
					<p class="partyOf">Party of
						<select name="partysize" id="partysize">
							<option disabled="disabled" selected="selected" value="#">--</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
						</select>
					</p>
					<input placeholder="Date and Time" type="text" id="timescheduled" name="timescheduled" />
					<div style="clear:both;display:block;"> </div>
						<select name="location" id="locationPicker">
							<?php foreach(getLocations() as $distance=>$location) { ?>
								<option value="<?php echo $location['id']; ?>"><?php echo $location['name'].' ('.(int)$distance.' miles)'; ?> </option>
							<?php } ?>
						</select>
					</div>
					</form>
			<div id="order">
				<h2 id="mealsHeader">Your Order<span> <a href="#" onclick="updateOrder();">update</a></span></h2>
				<div id="orderbox">
				
				</div>
			</div>
			
			<button id="submitReservation">Place Order and Reservation</button>
		</div></div>
	</div>

	<div id="footer">
		<p>All code and design &copy; <?php echo date('Y') ?> Restaurant Operation Services, Inc. All rights reserved.</p>
	</div>
	
	<script type="text/javascript">
		var menu = <?php echo json_encode(getMenu()); ?>;
	</script>
	

	<!--[if lte IE 8]>
	
	<script>
		$(document).ready();
	</script>

	<![endif]-->

	</body>
</html>