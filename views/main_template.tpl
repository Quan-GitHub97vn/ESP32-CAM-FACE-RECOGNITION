<!DOCTYPE html>
<html>
<head>
	<title>Easy DE2 Pin assignments</title>
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="header" style="border-bottom: 1px solid #e5e5e5; margin-bottom: 20px;">
	        <h3 class="text-muted">Easy DE2 Pin assignments</h3>
      	</div>
	
	<form class="form-inline" action="/" method="post" style="margin-bottom: 20px;">
		<div class="form-group">
			<input name="loc" class="form-control" list="loc_list" placeholder="Enter location">
			<datalist id="loc_list">
				%for k in loc_pin_dict:
				<option value="{{ k }}">
				%end
			</datalist>
		</div>
		<span class="text-muted">OR</span>
		<div class="form-group">
			<input name="pin" class="form-control" list="pin_list" placeholder="Enter pin">
			<datalist id="pin_list">
				%for pin in pin_list:
				<option value="{{ pin }}">
				%end
			</datalist>
		</div>
		<button type="submit" class="btn btn-default">Go</button>
	</form>
	
	%if errors is not None:
		%for e in errors:
		<div class="alert alert-danger">{{ e }}</div>
		%end
	%end

	%if loc is not None:
	<table class="table">
		<tr>
			<td>To</td>
			<td>Location</td>
		</tr>
		<tr>
			%if len(loc_pin_dict[loc]) > 1:
			<td> {{! '<br>'.join([loc + "[" + str(i) + "]" for i in xrange(len(loc_pin_dict[loc])-1, -1, -1)]) }} </td>
			%else:
			<td> {{ loc }} </td>
			%end
			<td> {{! '<br>'.join(reversed(loc_pin_dict[loc])) }} </td>
		</tr>
	</table>
	% end

	<div class="footer" style="padding-top: 5px; color: #777; border-top: 1px solid #e5e5e5;">
        	<p>&copy; 2014 <a target="_blank" href="http://neelabhgupta.com/">Neelabh Gupta</a></p>
	</div>

	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	  ga('create', 'UA-39700861-3', 'easy-de2-pin-assignments.appspot.com');
	  ga('send', 'pageview');

	</script>
</div>
</body>
</html>

