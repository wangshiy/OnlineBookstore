<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title> Home </title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type = "text/css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/book2.css" />
	<link href="${pageContext.request.contextPath}/css/demo.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
	<!--  <script src="${pageContext.request.contextPath}/js/script.js"></script> -->
	<base href="http://localhost:8080/Project_Bookstore_XML/">
	<link href="css/yansan.css" rel="stylesheet" type="text/css">
	<script src="js/angular.min.js"></script>
	<script src="js/ImageDisplay.js"></script>
</head>
<body>

	<p style = "display:none;" id = "loggedInUser">${loggedInUser}</p>
	<p style = "display:none;" id = "loggedInPassword">${loggedInPassword}</p>

	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Advanced Search</h4>
				</div>
				<div class="modal-body"> 
					<form action = "querybook.html" method = "get" id = "advancedSearchForm" class="form-horizontal" role="form" enctype = "multipart/form-data">
						<div class="form-group">
							<label class="control-label col-sm-2" for="ISBN">ISBN:</label>
							<div class="col-sm-10">
								<input name="isbn" type="text" class="form-control modal-form" id="ISBN" placeholder="Enter ISBN...">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Bookname">Bookname:</label>
							<div class="col-sm-10"> 
								<input name="bookname" type="text" class="form-control modal-form" id="Bookname" placeholder="Enter Bookname...">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Author">Author:</label>
							<div class="col-sm-10">
								<input name="author" type="text" class="form-control modal-form" id="Author" placeholder="Enter Author...">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Author">Category:</label>
							<div class="col-sm-10">
								<input name="category" type="text" class="form-control modal-form" id="Category" placeholder="Enter Category(Seperated by ~)...">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Press">Press:</label>
							<div class="col-sm-10">
								<input name="press" type="text" class="form-control modal-form" id="Press" placeholder="Enter Press...">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Issue Date">Issue Date:</label>
							<div class="col-sm-5">
								Min:<input name="releasedMin" type="date" class="form-control modal-form" id="Issue_min" placeholder="Enter Min Issue Date (MM/DD/YYYY)...">
							</div>
							<div class="col-sm-5">
								Max:<input name="releasedMax" type="date" class="form-control modal-form" id="Issue_max" placeholder="Enter Max Issue Date (MM/DD/YYYY)...">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Price">Price:</label>
							<div class="col-sm-5">
								Min:<input name="priceMin" type="number" min="0" max="500" class="form-control modal-form" id="minPrice" placeholder="Enter Min Price(0~500)...">
							</div>
							<div class="col-sm-5">
								Max:<input name="priceMax" type="number" min="0" max="500" class="form-control modal-form" id="maxPrice" placeholder="Enter Max Price(0~500)...">
							</div>
						</div>
						<!-- <div class="form-group">
							<label class="control-label col-sm-2" for="Rating">Rating:</label>
							<div class="col-sm-5">
								<input type="number" min="0" max="10" class="form-control modal-form" id="minRating" placeholder="Enter Min Rating(0~10)...">
							</div>
							<div class="col-sm-5">
								<input type="number" min="0" max="10" class="form-control modal-form" id="maxRating" placeholder="Enter Max Rating(0~10)...">
							</div>
						</div>  -->
					</form>
				</div>
				<div class="modal-footer">
					<button form = "advancedSearchForm" type="submit" class="btn btn-default go" id = "advancedSearchSubmit">Submit</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- Modal Sign Up -->
	<div id="myModal-signUp" class="modal fade" role="dialog">
		<div class="modal-dialog">


			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Sign Up</h4>
				</div>
				<div class="modal-body">					
					<form action = "saveuser.html" method = "post" id = "signUpForm" class="form-horizontal" role="form" enctype = "multipart/form-data">
						<div id = "signUpUsernameInfo">
							<p style = "display:none; color:green;"> Username is approved </p>
							<p style = "display:none; color:red;"> Username already exists </p>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Username">Username:</label>
							<div class="col-sm-10">
								<input name = "username" type="text" class="form-control modal-form" id="signupUsername" placeholder="Enter Username..." required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Password">Password:</label>
							<div class="col-sm-10"> 
								<input name = "password" type="password" class="form-control modal-form" id="signupPassword" placeholder="Enter Password..." required>
							</div>
						</div>
						<div id = "signUpPasswordInfo">
							<p style = "display:none; color:green;"> Password is consistent </p>
							<p style = "display:none; color:red;"> Password is not consistent </p>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Password">Re-enter Password:</label>
							<div class="col-sm-10"> 
								<input type="password" class="form-control modal-form" id="Password" placeholder="Enter Password..." required>
							</div>
						</div>
						<div id = "signUpEmailInfo">
							<p style = "display:none; color:green;"> Email address is approved </p>
							<p style = "display:none; color:red;"> Email address already exists </p>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Email">Email:</label>
							<div class="col-sm-10">
								<input name = "email" type="email" class="form-control modal-form" id="signupEmail" placeholder="Enter Email..." required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Headshot">Headshot:</label>
							<div class="col-sm-10">
								<input name = "image" type="file" class="form-control modal-form" id="signupHeadshot" data-show-preview="true" data-show-upload="true" data-show-caption="true" placeholder="Upload Headshot..." required>
							</div>
							<div id="profileImag"></div>
							<script>
								var profile=Image("#signupHeadshot","#profileImag")
								profile.displayImage();
								$("#profileImag").delegate("img", "click", function() {
									$("#signupHeadshot")[0].click();
								});
							</script>
						</div>						
					</form>
				</div>
				<div class="modal-footer">
					<button form = "signUpForm" type="submit" class="btn btn-default go" id = "signupSubmit">Sign Up</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- Modal Log In -->
	<div id="myModal-logIn" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Log In</h4>
				</div>
				<div class="modal-body">
					<div id = "logInErrorInfo">
						<p style = "display:none; color:red;"> Invalid username or password </p>
						<p style = "display:none; color:red;"> Account is not activated </p>
					</div>
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label class="control-label col-sm-2" for="Username">Username:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control modal-form" id="loginUsername" placeholder="Enter Username...">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Password">Password:</label>
							<div class="col-sm-10"> 
								<input type="password" class="form-control modal-form" id="loginPassword" placeholder="Enter Password...">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default go" id = "loginSubmit">Log In</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" id = "loginClose">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- Modal Check Out -->
	<div id="myModal-checkOut" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Check Out</h4>
				</div>
				<div class="modal-body container-fluid">
					<ul class = "checkOutBookEntryUl" style = "list-style-type: none;">
						<li class = "container-fluid col-lg-12 col-md-12 col-sm-12 col-xs-12 checkOutbook-entry">
							<!-- <div class = "col-lg-3 col-md-3 col-sm-3 col-xs-12">
								<img class = "img-responsive book-picture" src = "img/img-6.jpg" style = "top:0;">
							</div> -->
							<div class = "col-lg-3 col-md-3 col-sm-3 col-xs-12">
								<figure class='Flip_book' style = "width:120px; height:165px;">
								<!-- Front -->
								<ul class='Flip_paperback_front'>
									<li>
										<span style = "display:none;" class="Flip_ribbon">Nº1</span>
										<img src="img/img6.jpg" alt="" width="100%" height="100%">
									</li>
									<li></li>
								</ul>
								<!-- Pages -->
								<ul class='Flip_ruled_paper'>
									<li></li>
									<li>
										<a class="Flip_btn" href="#" style = "margin-top:50px;" data-toggle="modal" data-target="#myModal-lookInside" id = "checkOutLookInsideButton" >Look Inside</a>
									</li>
									<li></li>
									<li></li>
									<li></li>
								</ul>
								<!-- Back -->
								<ul class='Flip_paperback_back'>
									<li>
										<img src="img/bg.jpg" alt="" width="100%" height="100%">
									</li>
									<li></li>
								</ul>
								</figure>
							</div>
							<div class = "col-lg-5 col-md-5 col-sm-5 col-xs-12">
								<h3> {{book.bookname}} </h3>
								<p> Author: {{book.author}} </p>	
								<p style = "display: none;"> Issue Date: {{book.released}} </p>												
								<p style = "display: none;"> Press: {{book.press}} </p>
								<p> ISBN: {{book.isbn}} </p>
								<p style = "display: none;"> {{book.isbn}} </p>
								<p> Price: {{book.price}} </p>
								<p> Quantity: {{book.quantity}} </p>
								<p style = "display:none;">{{book.quantity}}</p>
							</div>
							<div class = "col-lg-4 col-md-4 col-sm-4 col-xs-12">								
								<p style = "display:none;">{{book.price}} </p>
								<button type="button" class="btn btn-default navbar-btn remove-button">Remove</button>
								<p> Amount: <input style = "margin-top: 10px;" type="number" class="form-control modal-form amountInput" placeholder="1..." value = "1"/> </p>								
								<h3> Subtotal: {{book.price}} </h3>	
								<h3 style = "display:none;"> Subtotal: {{book.price}} </h3>	
								<p class = "checkOutErrorInfo" style = "display:none; color:red;"> Input too more </p>				
							</div>
						</li>				
					</ul>
					<hr>
					<h3 style = "float:right; margin-right:30px;" id = "totalPrice">Total: 100.8</h3>
					<h3 style = "float:right; margin-right:30px; display:none;"></h3>
					<h3 style = "float:left; margin-left:30px;" class = "balance"> Your Balance: 1000</h3> 
					<h3 style = "float:left; margin-left:30px; display:none;" id = "calBalance"></h3> 
					<h3 class = "checkOutErrorInfo" style = "float:right; margin-right:30px; display:none; color:red;" id = "priceTooMore"> Please add more balance </h3> 
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default go" id = "checkOutSubmit">Check Out</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" id = "checkOutClose">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- Modal Log In Welcome -->
	<div id="myModal-logInWelcome" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Welcome Back!</h4>
					<h4 class="modal-title" id = "logInWelcomeUsername"></h4>
				</div>
				<div class="modal-body">
					<img class = "userHeadshot" src = "img/img-6.jpg" style = "width: 150px; height:200px; margin:0 auto; display:block; border-radius:15%;"/>
					<h3 style = "text-align:center; margin-top: 20px;" class = "balance"> Your Balance: 1000</h3>
					<div style = "display:block; text-align:center; margin-top: 20px;">						
						<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal-addBalance">Add More Balance</button>
						<button type="button" class="btn btn-default" id = "cartSubmit">Check Out</button>
						<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal-transactionsHistory" id = "checkTransactionsHistory">Transactions History</button>
						<!-- <button style = "margin-top:10px;" type="button" class="btn btn-default" id = "logOutButton">Log Out</button> -->
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id = "logInWelcomeClose">Close</button>
				</div>
			</div>

		</div>
	</div>
	<button style = "display:none;" type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#myModal-logInWelcome" id = "logInWelcomeProfile" >Profile</button>
	
	<!-- Modal Add Balance -->
	<div id="myModal-addBalance" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Add Balance</h4>
				</div>
				<div class="modal-body">
					<h3 style = "text-align:center; margin-top: 20px;" class = "balance"> Your Balance: 1000</h3>
					<div style = "display:block; text-align:center; margin-top: 20px;">						
						<input style = "margin-top: 10px; margin: 0 auto; width: 20px;" type="number" class="form-control modal-form" placeholder="100..." value = "100"/>
						<button style = "margin-top: 20px;" type="button" class="btn btn-default" id = "addBalanceSubmit">Add</button>						
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- Modal Transactions History  -->
	<div id="myModal-transactionsHistory" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Transactions History</h4>
				</div>
				<div class="modal-body">
					<h3 class = "balance"> Your Balance: 1000</h3>
					<table class="table table-striped">
					    <thead>
					      <tr>
					        <th>Username</th>
					        <th>ISBN</th>
					        <th>Bookname</th>
					        <th>Orderdate</th>
					        <th>Quantity</th>
					        <th>Total</th>
					      </tr>
					    </thead>
					    <tbody class = "transactionEntries">
					      <tr>
					        <td></td>
					        <td></td>
					        <td></td>
					        <td></td>
					        <td></td>
					        <td></td>
					      </tr>
					    </tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- Modal Dashboard Books  -->
	<div id="myModal-dashboardBooks" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Dashboard Books</h4>
				</div>
				<div class="modal-body container-fluid">
					<ol class = "dashboardLi">
						<li class = "container-fluid col-lg-12 col-md-12 col-sm-12 col-xs-12 book-entry">
							<!--  <div class = "col-lg-2 col-md-2 col-sm-12 col-xs-12">
								<a data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "img-responsive book-picture" src = "img/img-6.jpg" style = "top:0;"></a>
							</div> -->
							<div class = "col-lg-3 col-md-3 col-sm-12 col-xs-12">
								<figure class='Flip_book'>
									<!-- Front -->
									<ul class='Flip_paperback_front'>
										<li>
											<span style = "display:none;" class="Flip_ribbon">Nº1</span>
											<img src="img/img6.jpg" alt="" width="100%" height="100%">
										</li>
										<li></li>
									</ul>
									<!-- Pages -->
									<ul class='Flip_ruled_paper'>
										<li></li>
										<li>
											<a class="Flip_btn" href="#" data-toggle="modal" data-target="#myModal-lookInside" id = "lookInsideButton">Look Inside</a>
										</li>
										<li></li>
										<li></li>
										<li></li>
									</ul>
									<!-- Back -->
									<ul class='Flip_paperback_back'>
										<li>
											<img src="img/bg.jpg" alt="" width="100%" height="100%">
										</li>
										<li></li>
									</ul>
								</figure>
							</div>
							<div class = "col-lg-4 col-md-4 col-sm-12 col-xs-12">
								<a href = "#" style = "font-size:24px;" class = "book-title"> {{book.bookname}} </a>
								<p style = "display:none;"></p>
								<p style = "display:none;"></p>
								<p>	Price: {{book.price}} </p>
								<p> Transaction Amount: {{book.quantity}} </p>
								<div class="book-rating">
									<span class = "star">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;<span class = "score">0.0</span>&nbsp;<span class = "score-people">(0)</span>							
								</div>
								<p> Author: {{book.author}} </p>													
								<p> Issue Date: {{book.released}} </p>
								<p> Press: {{book.press}} </p>
								<p> ISBN: {{book.isbn}} </p>
								<p style = "display: none;"> {{book.isbn}} </p>
								<div class = "book-tag">
									<ul>
										<li class="tag"><a class = "searchTag" href="#"></a></li>
									</ul>
								</div>
							</div>
							<div class = "col-lg-5 col-md-5 col-sm-12 col-xs-12">
								<h3> Comments </h3>
								<hr>
								<div class = "commentsDiv">
									<div class = "moreDisplayComments">
										<h4> {{comment.username}}:</h4>&nbsp;&nbsp;&nbsp;<span class = "star">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;<span class = "score">{{comment.rate}}</span>&nbsp;&nbsp;&nbsp;<span>{{comment.time}}</span>
										<p>{{comment.context}}</p>
										<p style = "display:none;" class = "filterDisplayComments">{{comment.isbn}}</p>
										<p style = "display:none;">{{comment.cid}}</p>
									</div>
								    <!--  <button style = "display:none;" type="button" class="btn btn-default navbar-btn filterDisplay">Filter Display</button> -->
								</div>
								<button type="button" class="btn btn-default navbar-btn filterCommentsSubmit" data-toggle="modal" data-target="#myModal-more">More</button>
								<button type="button" class="btn btn-default navbar-btn buy-button">Buy</button>
							</div>
						</li>				
					</ol>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- Modal More -->
	<div id="myModal-more" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Comments</h4>
				</div>
				<div class="modal-body commentsLi" >
					<li style = "list-style-type: none;" class = "moreComments alert">
						<h4> {{comment.username}}:</h4>&nbsp;&nbsp;&nbsp;<span class = "star">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;<span class = "score">{{comment.rate}}</span>&nbsp;&nbsp;&nbsp;<span>{{comment.time}}</span>
						<p>{{comment.context}}</p>
						<p style = "display:none;">Aug/07/2015</p>
						<p style = "display: none;" class = "filterComments">{{comment.isbn}}</p>
						<p style = "display:none;">{{comment.cid}}</p>
						<button title = "report" type="button" class="close commentHide" style="margin-top:-50px;" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true">&#9888;</span>
						</button>						
					</li>
				</div>
				<script>
					$('li.alert').on("close.bs.alert", function(event){
						$(this).children().eq(8).css("color","red");
						$.post( "/Project_Bookstore_XML/comment/reportByUser.html", $(this).children()[7].innerText);
						event.preventDefault();
					});
				</script>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal Look Inside -->
	<div id="myModal-lookInside" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Look Inside</h4>
				</div>
				<div class="modal-body">
					<h3 style = "text-align:center;"> {{book.bookname}} </h3>
					<p> Lorem ipsum dolor sit amet, vestibulum et, eros bibendum est. Vestibulum nunc numquam, odio accumsan malesuada quisque sollicitudin vehicula viverra, duis sit fusce suspendisse eget, nulla sodales at pellentesque. Etiam lorem lorem sed ultricies vel. Mollis faucibus ac iaculis augue non ullamcorper, blandit nullam integer varius, ante id lorem sollicitudin massa pede justo. Quis feugiat odio in odio. Id viverra etiam nec odio nibh arcu, praesent libero rutrum tempor ipsum. Ac turpis, tincidunt phasellus suspendisse non lacus erat integer, condimentum sed id, pharetra sit in aut dictum erat luctus, ut suscipit auctor. Id viverra deserunt proin, fusce nostrud leo habitant sed blandit fringilla, praesent arcu ut, orci felis cursus in, justo leo. Amet amet ut tempus ultricies et ipsum. Sollicitudin volutpat lobortis ex justo magna. Non in dolor duis morbi feugiat lacus, pellentesque rutrum, sed blandit nulla in taciti gravida, urna tincidunt egestas. Orci voluptates quam, dui pede ut et netus. </p>
					<ul id="sortable" class = "lookInsideLi">
						<li style = "text-align:center; margin: 20px;"><img style = "width:70%;" src="" alt="Sorry, this book has no pre-view."></li>
						<li style = "text-align:center; margin: 20px;"><img style = "width:70%;" src="" alt="Sorry, this book has no pre-view."></li>
						<li style = "text-align:center; margin: 20px;"><img style = "width:70%;" src="" alt="Sorry, this book has no pre-view."></li>
					</ul>
				</div>
				<script>
			   		$(function() {
					    $( "#sortable" ).sortable();
					    $( "#sortable" ).disableSelection();
				  	});
			    </script>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<div class = "header container-fluid">

		<nav class="navbar navbar-default col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
					<a class="navbar-brand" href="http://localhost:8080/Project_Bookstore_XML/home.html"><img id="logo" src="img/logo.png" /></a>
				</div>
				<div id="yansanAdminButtons" ng-app="ysApp" ng-controller="ysBookForm">
					<!-- Button trigger modal -->
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li>
								<div class="dropdown">
									<button id="adminBooks" class="btn btn-default navbar-btn nav-button dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Books <span class="caret"></span> </button>
									<ul class="dropdown-menu" aria-labelledby="dLabel">
										<li><a role="button" data-toggle="modal" data-target="#ysBookModal" ng-click="setModalType('add')">Add</a></li>
										<li><a role="button" data-toggle="modal" data-target="#ysBookModal" ng-click="setModalType('edit')">Edit</a></li>
										<li><a role="button" data-toggle="modal" data-target="#ysBookModal" ng-click="setModalType('delete')">Delete</a></li>
										<li role="separator" class="divider"></li>
										<li><a role="button" data-toggle="modal" data-target="#ysBookModal" ng-click="setModalType('all')">All</a></li>
									</ul>
								</div>
							</li>
							<li>
								<div class="dropdown">
									<button id="adminComments" class="btn btn-default navbar-btn nav-button dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Comments <span class="caret"></span> </button>
									<ul class="dropdown-menu" aria-labelledby="dLabel">
										<li><a role="button" data-toggle="modal" data-target="#ysCommentModal" ng-click="commentDropdown.reportedComments.getAllReportedComments()">Reported
											Comments <span class="badge">{{commentDropdown.reportedComments.reportedNumber}}</span>
									</a></li>
									</ul>
								</div>
							</li>
							<li>
								<button type="button" class="btn btn-default navbar-btn nav-button" data-toggle="modal" data-target="#myModal-signUp" id="signUpButton">Sign up</button>
							</li>
							<li>
								<button type="button" class="btn btn-default navbar-btn nav-button" data-toggle="modal" data-target="#myModal-logIn" id="logInButton">Log in</button>
							</li>
							<li>
								<button type="button" class="btn btn-default navbar-btn nav-button" data-toggle="modal" data-target="#myModal-logIn" id="logOutButton">Log out</button>
							</li>
							<li>
								<button type="button" class="btn btn-default navbar-btn nav-button" data-toggle="modal" data-target="#myModal-checkOut" id="checkOutButton"> <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;(<span id="indicator">0</span>) </button>
							</li>
							<li>
								<a href="#"><img id="mainUserHeadshot" class="userHeadshot" src="img/img6.jpg" width="80px" height="100px" style="margin-left: 30px; border-radius: 15%;" /></a>
							</li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
					<!-- /.container-fluid -->
					<!--Book Modal -->
					<div class="modal fade" id="ysBookModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
									<h4 class="modal-title" id="myModalLabel">{{modal.title}}</h4> </div>
								<div class="modal-body">
									<section ng-show="modal.searchSectionShow">
										<form class="form-inline" action="book/get.html" method="get" enctype="multipart/form-data">
											<div class="form-group">
												<input style="font-size:100%;" type="text" class="form-control" ng-change="process('Search')" ng-model="isbn" ng-autoFocus="modal.searchSectionShow" name="isbn" id="inputISBN" list="isbn" placeholder="ISBN">
												<datalist id="isbn">
													<option ng-repeat="book in books" value="{{book.isbn}}">
												</datalist>
											</div>
											<input style="font-size:100%;border-color:rgba(32,178,170,1.0);background-color: rgba(32,178,170,1.0);color:white;" type="submit" class="btn btn-default" ng-click="process('Get')($event)" id="inputSubmit" value="Search"> 
										</form>
										<hr ng-show="modal.formSectionShow">
										<p id="noResult"></p>
									</section>
									<section ng-show="modal.formSectionShow">
										<form id="ysForm" name="ysBookForm1" enctype="multipart/form-data">
											<div class="form-group">
												<label>ISBN</label>
												<input type="text" class="form-control" name="isbn" value="{{book.isbn}}" id="isbnInput">
												<div class="view" id="isbnValidation"></div>
												<script type="text/javascript">
												var success = "green";
												var danger = "red";
												$("#isbnInput").blur(function() {
													if ($(this).val().length === 0) {
														$(this).css({
															"border-color": danger
														});
														$("#isbnValidation").html("<span style='color:red;margin-top:10px;'>ISBN is required!</span>");
													} else {
														$("#isbnValidation").empty();
														$(this).css({
															"border-color": success
														});
													}
												});

												</script>
											</div>
											<div class="form-group">
												<label>Name</label>
												<input type="text" class="form-control" name="bookname" id="booknameInput" value="{{book.bookname}}">
												<div class="view" id="booknameValidateion"></div>
												<script type="text/javascript">
												$("#booknameInput").blur(function() {
													if ($(this).val().length === 0) {
														$(this).css({
															"border-color": danger
														});
														$("#booknameValidateion").html("<span style='color:red;margin-top:10px;'>Book name is required!</span>");
													} else {
														$("#booknameValidateion").empty();
														$(this).css({
															"border-color": success
														});
													}
												});

												</script>
											</div>
											<div class="form-group">
												<label>Series</label>
												<input type="text" class="form-control" name="series" value="{{book.series}}">
												<div id="booknameValidateion"></div>
											</div>
											<div class="form-group">
												<label>Tags</label>
												<br>
												<label class="checkbox-inline">
													<input type="checkbox" class="checkbox" name="tagNames[]" value="Literature" ng-checked="tagInputChecked('Literature')">Literature </label>
												<label class="checkbox-inline">
													<input type="checkbox" name="tagNames[]" value="Popular" ng-checked="tagInputChecked('Popular')">Popular </label>
												<label class="checkbox-inline">
													<input type="checkbox" name="tagNames[]" value="Culture" ng-checked="tagInputChecked('Culture')">Culture </label>
												<label class="checkbox-inline">
													<input type="checkbox" name="tagNames[]" value="Economics" ng-checked="tagInputChecked('Economics')">Economics </label>
												<label class="checkbox-inline">
													<input type="checkbox" name="tagNames[]" value="Science" ng-checked="tagInputChecked('Science')">Science </label>
												<label id="btnMoreTags" class="checkbox-inline" style="color: rgba(32,178,170,1.0);" role="button"> 
													<span ng-click="more=true"  ng-hide="more" >+More...</span> 
													<span ng-click="more=false" ng-show="more">-Less...</span> 
												</label>
												<div id="moreTags" ng-show="more">
													<label style="width:30%;" class="checkbox-inline" ng-repeat="tag in moreTags | orderBy:'tagname' ">
														<input type="checkbox" name="tagNames[]" value="{{tag.tagname}}" ng-checked="tagInputChecked(tag.tagname)">{{tag.tagname}} </label>
												</div>
											</div>
											<div class="form-group">
												<label>Author</label>
												<input type="text" class="form-control" name="author" id="authorInput" value="{{book.author}}">
												<div class="view" id="authorValidateion"></div>
												<script type="text/javascript">
												$("#authorInput").blur(function() {
													if ($(this).val().length === 0) {
														$(this).css({
															"border-color": danger
														});
														$("#authorValidateion").html("<span style='color:red;margin-top:10px;'>Author is required!</span>");
													} else {
														$("#authorValidateion").empty();
														$(this).css({
															"border-color": success
														});
													}
												});

												</script>
											</div>
											<div class="form-group">
												<label>Press</label>
												<input type="text" class="form-control" name="press" id="pressInput" value="{{book.press}}">
												<div class="view" id="pressValidateion"></div>
												<script type="text/javascript">
												$("#pressInput").blur(function() {
													if ($(this).val().length === 0) {
														$(this).css({
															"border-color": danger
														});
														$("#pressValidateion").html("<span style='color:red;margin-top:10px;'>Press is required!</span>");
													} else {
														$("#pressValidateion").empty();
														$(this).css({
															"border-color": success
														});
													}
												});

												</script>
											</div>
											<div class="form-group">
												<label>Released</label>
												<input type="date" class="form-control" name="releasedSql" id="releasedInput" value="{{book.released}}">
												<div class="view" id="releasedValidateion"></div>
												<script type="text/javascript">
												$("#releasedInput").blur(function() {
													if ($(this).val().length === 0) {
														$(this).css({
															"border-color": danger
														});
														$("#releasedValidateion").html("<span style='color:red;margin-top:10px;'>Released date is required!</span>");
													} else {
														$("#releasedValidateion").empty();
														$(this).css({
															"border-color": success
														});
													}
												});

												</script>
											</div>
											<div class="form-group">
												<label>Price</label>
												<input type="number" class="form-control" name="price" id="priceInput" value="{{book.price}}" min="0">
												<div class="view" id="priceValidateion"></div>
												<script type="text/javascript">
												$("#priceInput").blur(function() {
													if ($(this).val().length === 0) {
														$(this).css({
															"border-color": danger
														});
														$("#priceValidateion").html("<span style='color:red;margin-top:10px;'>Price is required!</span>");
													} else if (!$.isNumeric($(this).val())) {
														$(this).css({
															"border-color": danger
														});
														$("#quantityValidateion").html("<span style='color:red;margin-top:10px;'>Price should be a number!</span>");
													} else if ($(this).val() < 0) {
														$("#priceValidateion").empty();
														$(this).css({
															"border-color": danger
														});
														$("#priceValidateion").html("<span style='color:red;margin-top:10px;'>Price should be greater than or equal to 0!</span>");
													} else {
														$("#priceValidateion").empty();
														$(this).css({
															"border-color": success
														});
													}
												});

												</script>
											</div>
											<div class="form-group">
												<label>Quantity</label>
												<input type="number" class="form-control" name="quantity" id="quantityInput" value="{{book.quantity}}" min="0">
												<div class="view" id="quantityValidateion"></div>
												<script type="text/javascript">
												$("#quantityInput").blur(function() {
													if ($(this).val().length === 0) {
														$(this).css({
															"border-color": danger
														});
														$("#quantityValidateion").html("<span style='color:red;margin-top:10px;'>Quantity is required!</span>");
													} else if (!$.isNumeric($(this).val())) {
														$(this).css({
															"border-color": danger
														});
														$("#quantityValidateion").html("<span style='color:red;margin-top:10px;'>Quantity should be a number!</span>");
													} else if ($(this).val() < 0) {
														$("#quantityValidateion").empty();
														$(this).css({
															"border-color": danger
														});
														$("#quantityValidateion").html("<span style='color:red;margin-top:10px;'>Quantity should be greater than or equal to 0!</span>");
													} else {
														$("#quantityValidateion").empty();
														$(this).css({
															"border-color": success
														});
													}
												});

												</script>
											</div>
											<div class="form-group">
												<label>Cover</label>
												<input type="file" name="coverImage" ng-show="book.cover==null" id="imageInput">
												<div id="imagePreview"></div>
											</div>
											<div class="form-group">
												<label>Content</label>
												<input type="file" name="contentImages[]" multiple ng-show="book.content1==null" id="imagesInput">
												<div id="imagesPreview"></div>
											</div>
											<div class="form-group">
												<label>Description</label>
												<textarea class="form-control" name="description" rows="3">{{book.description}}</textarea>
											</div>
										</form>
										<script type="text/javascript">
										$('#ysBookModal').on('hidden.bs.modal', function() {
											$('input').css("border-color", "");
											$("input").show();
											$("form div.view ").empty();
										});
										$('#ysBookModal').on('shown.bs.modal', function() {
											$('#isbnInput').focus();
										});

										</script>
									</section>
									<section ng-show="modal.tableSectionShow">
										<div class="form-inline form-group">
											<label>Search: </label>
											<input type="text" class="form-control" ng-model="query" list="books">
											<datalist id="books">
												<div ng-repeat="book in books">
													<option value="{{book.bookname}}">
														<option value="{{book.isbn}}">
															<option value="{{book.author}}">
												</div>
											</datalist>
										</div>
										<table class="table table-hover">
											<tr>
												<th><a role="button" ng-click="order('isbn')">ISBN</a> <span class="glyphicon glyphicon-triangle-bottom" ng-show="predicate==='isbn' && reverse===false"></span> <span class="glyphicon glyphicon-triangle-top" ng-show="predicate==='isbn' && reverse===true"></span></th>
												<th><a role="button" ng-click="order('bookname')">Name</a> <span class="glyphicon glyphicon-triangle-bottom" ng-show="predicate==='bookname' && reverse===false"></span> <span class="glyphicon glyphicon-triangle-top" ng-show="predicate==='bookname' && reverse===true"></span></th>
												<th><a role="button" ng-click="order('author')">Author</a> <span class="glyphicon glyphicon-triangle-bottom" ng-show="predicate==='author' && reverse===false"></span> <span class="glyphicon glyphicon-triangle-top" ng-show="predicate==='author' && reverse===true"></span></th>
												<th><a role="button" ng-click="order('price')">Price</a> <span class="glyphicon glyphicon-triangle-bottom" ng-show="predicate==='price' && reverse===false"></span> <span class="glyphicon glyphicon-triangle-top" ng-show="predicate==='price' && reverse===true"></span></th>
												<th></th>
											</tr>
											<tr ng-mouseover="showglyphicon=true" ng-mouseleave="showglyphicon=false" ng-repeat="book in books  | filter: query | orderBy: predicate:reverse" class="alert" role="alert">
												<td><a style="color:black;" href="querybook.html?isbn={{book.isbn}}">{{book.isbn}}</a></td>
												<td><a style="color:black;" href="querybook.html?bookname={{book.bookname}}">{{book.bookname}}</a></td>
												<td><a style="color:black;" href="querybook.html?author={{book.author}}">{{book.author}}</a></td>
												<td>{{book.price}}</td>
												<td style="text-align: center;">
													<button ng-show="showglyphicon" ng-click="process('DeleteOneOfBooks')(book.isbn)" type="button" class="close" data-dismiss="alert" aria-label="Close" title="Delete the book"> <span style="color: red;" aria-hidden="true">&times;</span> </button>
												</td>
											</tr>
										</table>
									</section>
								</div>
								<div class="modal-footer">
									<button type="button"  style="font-size:100%;"  class="btn btn-default" data-dismiss="modal">Close</button>
									<button id="actionBtn"  style="font-size:100%; border-color:rgba(32,178,170,1.0); background-color: rgba(32,178,170,1.0);color:white;"  type="button" class="btn btn-primary" ng-show="modal.formSectionShow" ng-click="process(modal.btnText)('#ysForm')" data-dismiss="modal">{{modal.btnText}}</button>
								</div>
							</div>
						</div>
					</div>
					<!-- Comment Modal -->
					<div class="modal fade" id="ysCommentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
									<h4 class="modal-title" id="myModalLabel">Reported Comments</h4> </div>
								<div class="modal-body">
									<table class="table table-striped">
										<tr>
											<th>
												<a role="button"></a>
											</th>
											<th><a role="button">Comment</a></th>
											<th></th>
											<th></th>
										</tr>
										<tr ng-mouseover="showglyphicon=true" ng-mouseleave="showglyphicon=false" ng-repeat="comment in commentModal.content |orderBy: 'isbn'" class="alert" role="alert">
											<td>{{$index+1}}</td>
											<td>{{comment.context}}</td>
											<td style="text-align: center;">
												<button ng-show="showglyphicon" ng-click="commentModal.process('HIDE')(comment.c_id)" type="button" class="close" data-dismiss="alert" aria-label="Close"> <span style="color: red;" class="glyphicon glyphicon-ok" title="Hide" aria-hidden="true"></span> </button>
											</td>
											<td style="text-align: center;">
												<button ng-show="showglyphicon" ng-click="commentModal.process('SHOW')(comment.c_id)" type="button" class="close" data-dismiss="alert" aria-label="Close"> <span class=" glyphicon glyphicon-remove" title="Show" aria-hidden="true"></span> </button>
											</td>
										</tr>
									</table>
								</div>
								<div class="modal-footer">
									<button type="button"  style="font-size:100%;" class="btn btn-default" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
					<script type="text/javascript">
					//display images
					var image = Image("#imageInput", "#imagePreview");
					image.displayImage();
					$("#imagePreview").delegate("img", "click", function() {
						$("#imageInput")[0].click();
					});
					var images = Image("#imagesInput", "#imagesPreview");
					images.displayImage();
					$("#imagesPreview").delegate("img", "click", function() {
						//$("#imagesPreview").empty();
						$("#imagesInput")[0].click();
					});

					</script>
					<script>
					var ysModule = angular.module("ysApp", []);
					ysModule.controller("ysBookForm", function($scope, $http) {
						$scope.commentModal = {
							title: null,
							content: null,
							process: function(type) {
								return function(commentId) {
									switch (type) {
										case "HIDE":
											$http.post("comment/hide.html", commentId).success(function(response) {
												var temple = $scope.commentDropdown.reportedComments.reportedNumber;
												if (temple > 0) {
													temple--;
												} else {
													temple = 0;
												}
												$scope.commentDropdown.reportedComments.reportedNumber = temple;
											});
											break;
										case "SHOW":
											$http.post("comment/show.html", commentId).success(function(response) {
												var temple = $scope.commentDropdown.reportedComments.reportedNumber;
												if (temple > 0) {
													temple--;
												} else {
													temple = 0;
												}
												$scope.commentDropdown.reportedComments.reportedNumber = temple;
											});
											break;
										case "REPORT":
											$http.post("comment/report.html", commentId);
											break;
									}
								};
							}
						};
						$scope.commentDropdown = {
							init: (function() {
								$http.get("comment/numberOfReportedComments.html").success(function(response) {
									$scope.commentDropdown.reportedComments.reportedNumber = response;
								});
							})(),
							reportedComments: {
								reportedNumber: 0,
								getAllReportedComments: function() {
									$http.get("comment/getAllReportedComments.html").success(function(response) {
										$scope.commentModal.content = response;
									});
								}
							},
						};
						$scope.books = null;
						$scope.setModalType = function(type) {
							//initalize data
							//start
							image.removeAll();
							images.removeAll();
							$scope.isbn = null;
							$scope.book = {};
							//$scope.books = null;
							$scope.tagInputChecked = false;
							document.getElementById("noResult").innerHTML = "";
							document.getElementById("ysForm").reset();
							//end
							$scope.modal = (function(type) {
								if(!$scope.moreTags){
									$http.get("tag/all.html").success(function(resopnse) {
										$scope.moreTags = resopnse;
									});
								}
								switch (type) {
									case "add":
										//modal add page
										return modalInit("Add a Book", false, true, false, "Add");
										break;
									case "edit":
										//modal edit page
										return modalInit("Edit a Book", true, false, false, "Update");
										break;
									case "delete":
										//modal delete page
										return modalInit("Delete a Book", true, false, false, "Delete");
										break;
									case "all":
										//all the books info
										if( !$scope.books){
									    	$http.get("book/all.html").success(function(resopnse) {
									    		$scope.books =resopnse;
											});
									    }
										//modal tabel page
										return modalInit("All Books", false, false, true, "");
										break;
								};
							})(type);
						};
						$scope.process = function(type) {
							//trigger different events based on the button txt
							switch (type) {
								case "Add":
									//used for form section
									//click the Add btn, add a book to database
									return function(formId) {
										doPost(formId, "book/add.html", function(response) {
											//alert(response + " has been saved!");
										});
									};
									break;
								case "Update":
									//used for form section
									//click the Update btn, update the book
									return function(formId) {
										doPost(formId, "book/update.html", function(response) {
											//alert(response);
										});
									};
									break;
								case "Delete":
									//used for form seciton
									//click the delete btn, delete a book
									return function() {
										$http.get("book/delete.html?isbn=" + $scope.isbn).success(function(resopnse) {
											$scope.book = null;
										});
									};
									break;
								case "DeleteOneOfBooks":
									//used for form seciton
									//click the delete btn, delete a book
									return function(isbn) {
										$http.get("book/delete.html?isbn=" + isbn).success(function(resopnse) {
											for (var i = 0; i < $scope.books.length; i++) {
												if ($scope.books[i].isbn === isbn) {
													$scope.books.splice(i, 1);
													break;
												}
											}
										});
									};
									break;
								case "Get":
									//used for the search section, when the submit btn is clicked, 
									//it will get a book by the input,which id is inputISBN, value 
									return function($event) {
										document.getElementById("noResult").innerHTML = "";
										$scope.book = null;
										$http.get("book/get.html?isbn=" + $scope.isbn).success(function(resopnse) {
											if (resopnse) {
												$scope.book = resopnse;
												//here has a bug for the date
												$scope.book.released = parseDate($scope.book.released);
												//$scope.date="2014-05-06";
												$scope.tagInputChecked = function(value) {
													return isChecked(value, $scope.book.tags);
												};
												document.getElementById("imagePreview").innerHTML = "<img class='img-thumbnail yansanImg' src='img/" + $scope.book.isbn + "/" + $scope.book.cover + "'>";
												document.getElementById("imagesPreview").innerHTML = "<img class='img-thumbnail yansanImg' src='img/" + $scope.book.isbn + "/" + $scope.book.content1 + "'>" + "<img class='img-thumbnail yansanImg' src='img/" + $scope.book.isbn + "/" + $scope.book.content2 + "'>" + "<img class='img-thumbnail yansanImg' src='img/" + $scope.book.isbn + "/" + $scope.book.content3 + "'>";
												$scope.modal.formSectionShow = true;
											} else {
												$scope.modal.formSectionShow = false;
												document.getElementById("noResult").innerHTML = "<span style='color:red;'>No Result!</span>";
											}
										});
										$event.preventDefault();
									};
									break;
								case "Search":
									// used for search section, 
									//search books that like a isbn 				
									$http.get("book/search.html?isbn=" + $scope.isbn).success(function(resopnse) {
										$scope.books = resopnse;
									});
									break;
							}
						};
						//used to sort the result
						$scope.predicate = null,
							$scope.reverse = false,
							$scope.order = function(predicate) {
								$scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
								$scope.predicate = predicate;
							};
					});

					function isChecked(tagName, tags) {
						for (var i = 0; i < tags.length; i++) {
							if (tagName == tags[i].tagname) {
								return true;
							}
						}
					}

					function doGet(url, handleResult) {
						$http.get(url).success(function(resopnse) {
							handleResult(resopnse);
						});
					}

					function doPost(formId, url, handleResult) {
						var form = jQuery(formId).get(0);
						var fd = new FormData(form);
						jQuery.ajax({
							url: "/Project_Bookstore_XML/" + url,
							type: "POST",
							data: fd,
							processData: false,
							contentType: false,
							success: function(response) {
								handleResult(response);
							}
						});
					}

					function modalInit(title, searchSectionShow, formSectionShow, tableSectionShow, btnText) {
						return {
							title: title,
							searchSectionShow: searchSectionShow,
							formSectionShow: formSectionShow,
							tableSectionShow: tableSectionShow,
							btnText: btnText
						};
					}

					function parseDate(value) {
						var date = new Date(value);
						var year = date.getFullYear();
						var month = (date.getMonth() + 1) % 12;
						var date = date.getDate();
						if (month < 10) {
							month = "0" + month;
						}
						if (date < 10) {
							date = "0" + date;
						}
						return year + "-" + month + "-" + date;
					}

					</script>
				</div>
			</div>
		</nav>
		<div class="container-fluid">
			<video loop="loop" preload="auto" id="pretzel-video" autoplay muted>
				<source src="img/video.mp4" type="video/mp4">
			</video> 
		</div>
		
		<div class = "row welcome">
			<h2> Reading Anytime </h2>
			<p> Find a good book to enlighten the whole day. </p>
		</div>
		
		<div class = "row searchbox col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">

				<div class="input-group">
					<input type="text" class="form-control" id = "search-bar" name = "isbn" aria-label="...">
					<div class="input-group-btn">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id = "search-criteria">Bookname<span class="caret"></span></button>
						<ul class="dropdown-menu dropdown-menu-right">
							<li><a class = "search-candidate">Author</a></li>
							<li><a class = "search-candidate">Category</a></li>
							<li><a class = "search-candidate">ISBN</a></li>
							<li role="separator" class="divider"></li>
							<li><a data-toggle="modal" data-target="#myModal">Advanced Search</a></li>
						</ul>
					</div><!-- /btn-group -->
					<span class="input-group-btn">
						<button class="btn btn-default go" id = "search-button" type="submit">Go!</button>
					</span>
				</div> <!-- /input-group -->
		</div>
	</div>
	
	<div id="carousel-example-generic" class="container-fluid carousel slide col-lg-6 col-lg-offset-1 col-md-7 col-sm-12 col-xs-12" data-ride="carousel">
		
		<div class = "container-fluid slide-title">
			<h2 class = "title"> New Books </h2>
			<button style = "display:none;" type="button" class="btn btn-default more">More</button>
			<hr>
		</div>
		
		

		<!-- Wrapper for slides -->
		<div class="carousel-inner carouselSlide" role="listbox">
			<div class="item active itemSlide0">
				<a class = "guessCarouselCandidate" href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body">
					<img style = "margin: 5px 0px 5px 5px;" class = "slide-img" src="img/img1.jpg" alt="...">
					<p style = "display:none;"></p>
					<p style = "display:none;"></p>
				</a>
				<!-- <a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img2.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img3.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img4.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img5.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img6.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img7.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img8.jpg" alt="..."></a>

				<div class="carousel-caption">
					...
				</div> -->
			</div>
			<!-- <div class="item">
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img9.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img10.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img11.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img12.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img13.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img14.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img15.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img16.jpg" alt="..."></a>
				<div class="carousel-caption">
					...
				</div> 
			</div> -->
			<!-- <div class="item">
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img17.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img18.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img19.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img20.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img21.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img22.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img23.jpg" alt="..."></a>
				<a href="#" data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "slide-img" src="img/img24.jpg" alt="..."></a>
				<div class="carousel-caption">
					...
				</div> 
			</div> -->
		</div>

		<div class = "container-fluid control">
			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
			<!-- Indicators -->
			<ol class="carousel-indicators indicatorsSlide">
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<!--  <li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				<li data-target="#carousel-example-generic" data-slide-to="3"></li> -->
			</ol>
		</div>
	</div>
	
	<div class = "container-fluid col-lg-4 col-md-5 col-sm-12 col-xs-12">
		<div class = "container-fluid slide-title">
			<h2 class = "title"> Hot Tags </h2>
			<button style = "display:none;" type="button" class="btn btn-default more">More</button>
			<hr>
		</div>
		<ul class="hot-tags-col5 s" data-dstat-areaid="54" data-dstat-mode="click,expose">      
			<li>
				<ul class="clearfix">
					<li class="tag_title"> Literature </li>
					<li class="tag"><a class = "searchTag" href="#">Literature</a></li>
					<li class="tag"><a class = "searchTag" href="#">Novel</a></li>
					<li class="tag"><a class = "searchTag" href="#">Essay</a></li>
					<li class="tag"><a class = "searchTag" href="#">Prose</a></li>
					<li class="tag"><a class = "searchTag" href="#">Asian Literature</a></li>
					<li class="tag"><a class = "searchTag" href="#">European Literature</a></li>
					<li class="tag"><a class = "searchTag" href="#">American Literature</a></li>
					<li class="tag"><a class = "searchTag" href="#">Poetry</a></li>
					<li class="tag"><a class = "searchTag" href="#">Masterpiece</a></li>
					<li class="tag"><a class = "searchTag" href="#">Fairy Tale</a></li>
					<!--  <li class="tag"><a href="#">More...</a></li> -->
				</ul>
			</li>
			<li>
				<ul class="clearfix">
					<li class="tag_title"> Popular </li>
					<li class="tag"><a class = "searchTag" href="#">Popular</a></li>
					<li class="tag"><a class = "searchTag" href="#">Cartoon</a></li>
					<li class="tag"><a class = "searchTag" href="#">Reasoning</a></li>
					<li class="tag"><a class = "searchTag" href="#">Youth</a></li>
					<li class="tag"><a class = "searchTag" href="#">Romance</a></li>
					<li class="tag"><a class = "searchTag" href="#">Science Fiction</a></li>
					<li class="tag"><a class = "searchTag" href="#">Fantasy</a></li>
					<li class="tag"><a class = "searchTag" href="#">J.K.Rowling</a></li>
					<li class="tag"><a class = "searchTag" href="#">Baby Anne</a></li>
					<!--  <li class="tag"><a href="#">More...</a></li> -->
				</ul>
			</li>
			<li>
				<ul class="clearfix">
					<li class="tag_title"> Culture </li>
					<li class="tag"><a class = "searchTag" href="#">Culture</a></li>
					<li class="tag"><a class = "searchTag" href="#">History</a></li>
					<li class="tag"><a class = "searchTag" href="#">Psychology</a></li>
					<li class="tag"><a class = "searchTag" href="#">Philosophy</a></li>
					<li class="tag"><a class = "searchTag" href="#">Biography</a></li>
					<li class="tag"><a class = "searchTag" href="#">Sociology</a></li>
					<li class="tag"><a class = "searchTag" href="#">Art</a></li>
					<li class="tag"><a class = "searchTag" href="#">Religion</a></li>
					<li class="tag"><a class = "searchTag" href="#">Drama</a></li>
					<li class="tag"><a class = "searchTag" href="#">Music</a></li>
					<!--  <li class="tag"><a href="#">More...</a></li> -->
				</ul>
				<ul class="clearfix">
					<li class="tag_title"> Life </li>
					<li class="tag"><a class = "searchTag" href="#">Love</a></li>
					<li class="tag"><a class = "searchTag" href="#">Travel</a></li>
					<li class="tag"><a class = "searchTag" href="#">Inspiration</a></li>
					<li class="tag"><a class = "searchTag" href="#">Photography</a></li>
					<li class="tag"><a class = "searchTag" href="#">Work</a></li>
					<li class="tag"><a class = "searchTag" href="#">Food</a></li>
					<li class="tag"><a class = "searchTag" href="#">Education</a></li>
					<li class="tag"><a class = "searchTag" href="#">Health</a></li>
					<li class="tag"><a class = "searchTag" href="#">Home</a></li>
					<!--  <li class="tag"><a href="#">More...</a></li> -->
				</ul>
				<ul class="clearfix">
					<li class="tag_title"> Economics </li>
					<li class="tag"><a class = "searchTag" href="#">Economics</a></li>
					<li class="tag"><a class = "searchTag" href="#">Management</a></li>
					<li class="tag"><a class = "searchTag" href="#">Business</a></li>
					<li class="tag"><a class = "searchTag" href="#">Venture</a></li>
					<li class="tag"><a class = "searchTag" href="#">Advertising</a></li>
					<li class="tag"><a class = "searchTag" href="#">Finance</a></li>
					<li class="tag"><a class = "searchTag" href="#">Stock</a></li>
					<li class="tag"><a class = "searchTag" href="#">Plan</a></li>
					<li class="tag"><a class = "searchTag" href="#">Investment</a></li>
					<!--  <li class="tag"><a href="#">More...</a></li> -->
				</ul>
				<ul class="clearfix">
					<li class="tag_title"> Science </li>
					<li class="tag"><a class = "searchTag" href="#">Science</a></li>
					<li class="tag"><a class = "searchTag" href="#">Web</a></li>
					<li class="tag"><a class = "searchTag" href="#">Programming</a></li>
					<li class="tag"><a class = "searchTag" href="#">Mathematics</a></li>
					<li class="tag"><a class = "searchTag" href="#">Algorithm</a></li>
					<li class="tag"><a class = "searchTag" href="#">Physics</a></li>
					<li class="tag"><a class = "searchTag" href="#">Communication</a></li>
					<li class="tag"><a class = "searchTag" href="#">Architecture</a></li>
					<li class="tag"><a class = "searchTag" href="#">Chemistry</a></li>
					<li class="tag"><a class = "searchTag" href="#">Engineering</a></li>
					<!--  <li class="tag"><a href="#">More...</a></li> -->
				</ul>
			</li>
		</ul>
	</div>
	
	<div id="carousel-example-generic1" class="container-fluid carousel slide col-lg-6 col-lg-offset-1 col-md-7 col-sm-12 col-xs-12" data-ride="carousel">
		
		<div class = "container-fluid slide-title">
			<h2 class = "title"> Guess You Like... </h2>
			<button type="button" class="btn btn-default more" id = "guessYouLikeButton">Guess</button>
			<button style = "display:none;" type="button" class="btn btn-default more">More</button>
			<hr>
		</div>
		
		<div class="carousel-inner carouselGuess" role="listbox">
			<div class="item active itemGuess0">
				<a class = "guessCarouselCandidate" href="#" data-toggle="tooltip1" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body">
					<img style = "margin: 5px 0px 5px 5px;" class = "slide-img" src="img/question.jpg" alt="...">
					<p style = "display:none;"></p>
					<p style = "display:none;"></p>
				</a>
			</div>
		</div>

		<div class = "container-fluid control">
			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic1" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#carousel-example-generic1" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
			<!-- Indicators -->
			<ol class="carousel-indicators indicatorsGuess">
				<li data-target="#carousel-example-generic1" data-slide-to="0" class="active"></li>
			</ol>
		</div>
		
	</div>
	
	<div class = "dashboard container-fluid col-lg-4 col-md-5 col-sm-12 col-xs-12">
		<div class = "container-fluid slide-title">
			<h2 class = "title"> Best Sales Books </h2>
			<button type="button" class="btn btn-default more" data-toggle="modal" data-target="#myModal-dashboardBooks">More</button>
			<hr>
		</div>
			<ol class = "dashboardFilterLi">
				<li class = "container-fluid col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class = "col-lg-3 col-md-3 col-sm-2 col-xs-6">
						<img class = "img-responsive book-picture" src = "img/img-6.jpg" style = "width:160px; top:0;">
					</div>
					<div class = "col-lg-7 col-md-7 col-sm-8 col-xs-12">
						<a href="#" class = "book-title"> Secret Garden </a>
						<p style = "display:none;"></p>
						<p style = "display:none;"></p>
						<p> Author: Johanna Basford </p>
						<p>	Price: 23 </p>
						<p> Transaction Amount: 50 </p>
						<div class="book-rating">
							<span class = "star">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;<span class = "score">0.0</span>&nbsp;<span class = "score-people">(0)</span>							
						</div>
					</div>
					<div class = "col-lg-2 col-md-2 col-sm-2 col-xs-12">
						<button type="button" class="btn btn-default navbar-btn buy-button">Buy</button>
					</div>
				</li>			
			</ol>
	</div>
		
	<div class = "exhibition container-fluid col-lg-10 col-lg-offset-1 col-md-12 col-sm-12 col-xs-12">
		<div class = "container-fluid slide-title">
			<h2 class = "title"> Press Exhibition </h2>
			<button style = "display:none;" type="button" class="btn btn-default more">More</button>
			<hr>
		</div>
		<div class = "container-fluid browseLi">
		
			<div class = "container-fluid col-xs-3 book">
				<div class = "row book-info">
					<div class = "col-xs-6">
						<figure class='Flip_book'>
							<!-- Front -->
							<ul class='Flip_paperback_front'>
								<li>
									<span style = "display:none;" class="Flip_ribbon">Nº1</span>
									<img src="img/img6.jpg" alt="" width="100%" height="100%">
								</li>
								<li></li>
							</ul>
							<!-- Pages -->
							<ul class='Flip_ruled_paper'>
								<li></li>
								<li>
									<a class="Flip_btn" href="#" data-toggle="modal" data-target="#myModal-lookInside" id = "browseAllLookInsideButton">Look Inside</a>
								</li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
							<!-- Back -->
							<ul class='Flip_paperback_back'>
								<li>
									<img src="img/bg.jpg" alt="" width="100%" height="100%">
								</li>
								<li></li>
							</ul>
						</figure>
					</div>
					<div class = "col-xs-6">
						<a href = "#" class = "book-title"> Harry Potter And The Goblet Of Fire </a>
						<p style = "display:none;"></p>
						<p style = "display:none;"></p>
						<div class="book-rating">
							<span class = "star">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;<span class = "score">5.8</span>&nbsp;<span class = "score-people">(4)</span>
						</div>
						<p class="book-author"> Author: J.K.Rowling</p>
						<p class="book-price"> Price: 65</p>
						<p> Quantity: 15</p>													
						<p style = "display: none;"> Issue Date: {{book.released}} </p>
						<p> Press: {{book.press}} </p>
						<p> ISBN: {{book.isbn}} </p>
						<p style = "display: none;"> {{book.isbn}} </p>
						<button type="button" class="btn btn-default navbar-btn buy-buttonBrowseAll">Buy</button>
					</div>
				</div>
				<div class = "row book-tag">
					<ul style = "margin-top:10px;">
						<li class="tag"><a class = "searchTag" href="#"></a></li>
					</ul>
				</div>
				<div style = "display:none;" class = "col-lg-5 col-md-5 col-sm-12 col-xs-12">
					<h3> Comments </h3>
					<hr>
					<div class = "commentsDivBrowseAll">
						<div class = "moreDisplayCommentsBrowseAll">
							<h4> {{comment.username}}:</h4>&nbsp;&nbsp;&nbsp;<span class = "star">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;<span class = "score">{{comment.rate}}</span>&nbsp;&nbsp;&nbsp;<span>{{comment.time}}</span>
							<p>{{comment.context}}</p>
							<p class = "filterDisplayComments">{{comment.isbn}}</p>
						</div>

					</div>
					<button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#myModal-more">More</button>
				</div>
				<div class = "book-intro"> 
					Lorem ipsum dolor sit amet, vestibulum et, eros bibendum est. Vestibulum nunc numquam, odio accumsan malesuada quisque sollicitudin vehicula viverra, duis sit fusce suspendisse eget, nulla sodales at pellentesque. Etiam lorem lorem sed ultricies vel. Mollis faucibus ac iaculis augue non ullamcorper, blandit nullam integer varius, ante id lorem sollicitudin massa pede justo. Quis feugiat odio in odio. Id viverra etiam nec odio nibh arcu, praesent libero rutrum tempor ipsum. Ac turpis, tincidunt phasellus suspendisse non lacus erat integer, condimentum sed id, pharetra sit in aut dictum erat luctus, ut suscipit auctor. Id viverra deserunt proin, fusce nostrud leo habitant sed blandit fringilla, praesent arcu ut, orci felis cursus in, justo leo. Amet amet ut tempus ultricies et ipsum. Sollicitudin volutpat lobortis ex justo magna. Non in dolor duis morbi feugiat lacus, pellentesque rutrum, sed blandit nulla in taciti gravida, urna tincidunt egestas. Orci voluptates quam, dui pede ut et netus.
				</div>
			</div>
			
		
		</div>		
	</div>
	
	<script>
	
		//alert(localStorage["wangshiy" + "~guessBooks"]);
	
		var totalPrice = 0.0;
		
		var monthNames = [
		                  "January", "February", "March",
		                  "April", "May", "June", "July",
		                  "August", "September", "October",
		                  "November", "December"
		              ];
		
		//alert($("#loggedInUser").text() == "");
		

		$(".slide-img").mouseenter(function(){
			$('.carousel').carousel('pause');
		});
			
		$(".slide-img").mouseleave(function(){ 
			$('.carousel').carousel('cycle');
		});
		
		$(".guessCarouselCandidate").on("click", function(event){
			//alert($(this).children().eq(1).text());
			//alert($(this).children().eq(2).text());	
			//localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"] = "";
			localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"] += $(this).children().eq(2).text();
			//alert(localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"]);
			$("#advancedSearchForm").trigger("reset");
			$("#ISBN").val($(this).children().eq(1).text());
			$("#advancedSearchSubmit").trigger("click");
			event.preventDefault();
		});
		
		$(".searchTag").on("click", function(event){
			//alert($(this).text());
			localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"] += $(this).text() + "~";
			//alert(localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"]);
			$("#advancedSearchForm").trigger("reset");
			$("#Category").val($(this).text());
			$("#advancedSearchSubmit").trigger("click");
			event.preventDefault();
		});
		
		$(".book-title").on("click", function(event){
			//alert($(this).text());
			localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"] += $(this).next().next().text();
			//alert(localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"]);
			$("#advancedSearchForm").trigger("reset");
			$("#ISBN").val($(this).next().text());
			$("#advancedSearchSubmit").trigger("click");
			event.preventDefault();
		});
		
		
		$("#guessYouLikeButton").on("click", function(){
			$.post("guessyoulike.html",
		    {
				liketags: localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"]
		    },
		    function(data, status){
		        //alert("Data: " + data + "\nStatus: " + status);
		        // clean up
		        var carouselGuessLi= $(".carouselGuess").children(0).eq(0).detach();
		        $(".carouselGuess").empty();
		        carouselGuessLi.appendTo(".carouselGuess");
		        var itemGuess0Li = $(".itemGuess0").children().eq(0).detach();
		        $(".itemGuess0").empty();
		        itemGuess0Li.appendTo(".itemGuess0");
		        var indicatorsGuessLi = $(".indicatorsGuess").children(0).detach();
		        $(".indicatorsGuess").empty();
		        indicatorsGuessLi.appendTo(".indicatorsGuess");
		        
		        var cloneTimes = data.books.length / 8;
		        //alert(cloneTimes % 1 === 0);
				if(cloneTimes % 1 === 0 ){
					cloneTimes--;
				}else{
					cloneTimes = Math.floor(data.books.length / 8);
				}
				//alert(cloneTimes);
				for (var m = 0; m < cloneTimes; m++){
					$(".indicatorsGuess").children().eq(0).clone(true).appendTo(".indicatorsGuess");
					$(".indicatorsGuess").children().eq(m + 1).removeClass("active")
					$(".indicatorsGuess").children().eq(m + 1).attr("data-slide-to", m + 1);
				}
				var l = 0;
				if(data.message != ""){
					for (var i = 0; i < data.books.length; i++){
							if(l < 1){
								var carouselLi = $(".itemGuess" + i);
								carouselLi.children().eq(l).attr("title", "<h1>" + data.books[i].bookname + "</h1><p>" + data.books[i].description + "</p>");
								carouselLi.children().eq(l).children().eq(0).attr("src", "img/" + data.books[i].isbn + "/" + data.books[i].cover);
								carouselLi.children().eq(l).children().eq(1).text(data.books[i].isbn);
								carouselLi.children().eq(l).children().eq(2).text("");
								for (var n = 0; n < data.books[i].tags.length; n++){
									var tag = carouselLi.children().eq(l).children().eq(2).text();
									carouselLi.children().eq(l).children().eq(2).text(tag + data.books[i].tags[n].tagname + "~");
								}
							}else{
								carouselLi.children().eq(0).clone(true).appendTo(carouselLi);
								carouselLi.children().eq(l).attr("title", "<h1>" + data.books[i].bookname + "</h1><p>" + data.books[i].description + "</p>");
								carouselLi.children().eq(l).children().eq(0).attr("src", "img/" + data.books[i].isbn + "/" + data.books[i].cover);
								carouselLi.children().eq(l).children().eq(1).text(data.books[i].isbn);
								carouselLi.children().eq(l).children().eq(2).text("");
								for (var n = 0; n < data.books[i].tags.length; n++){
									var tag = carouselLi.children().eq(l).children().eq(2).text();
									carouselLi.children().eq(l).children().eq(2).text(tag + data.books[i].tags[n].tagname + "~");
								}
							}
							l++;
							if(l % 8 == 0 && i != (data.books.length - 1)){
								carouselLi.clone(true).appendTo(".carouselGuess");
								var firstCarouselLi = carouselLi.next().children().eq(0).detach();
								carouselLi.next().empty();
								firstCarouselLi.appendTo(carouselLi.next());
								carouselLi.next().removeClass("active").addClass("itemGuess" + (i + 1));
								l = 0;
							}
						
					}
				}else{
					$(".itemGuess").empty();
					$(".indicatorsGuess").empty();
				}
				//$('[data-toggle="tooltip"]').tooltip();
		    });	
		});
		
		// Call get() to query new books here I set the threshold 2015-07-01
		$.get("jsonTest.html?" + "isbn=&bookname=&author=&category=&press=&releasedMin=2015-07-01&releasedMax=&priceMin=&priceMax=", function(data) {
			//alert(data.books.length);
			//alert(Math.floor(data.books.length / 8)); // clone times
			//var k = Math.ceil(data.books.length / 8);
			/*var cloneTimes = Math.floor(data.books.length / 8);
			alert(cloneTimes % 1 === 0);
			if(cloneTimes % 1 === 0 ){
				cloneTimes--;
			}
			alert(cloneTimes);*/
			var cloneTimes = data.books.length / 8;
	        //alert(cloneTimes % 1 === 0);
			if(cloneTimes % 1 === 0 ){
				cloneTimes--;
			}else{
				cloneTimes = Math.floor(data.books.length / 8);
			}
			//alert(cloneTimes);
			for (var m = 0; m < cloneTimes; m++){
				$(".indicatorsSlide").children().eq(0).clone(true).appendTo(".indicatorsSlide");
				$(".indicatorsSlide").children().eq(m + 1).removeClass("active")
				$(".indicatorsSlide").children().eq(m + 1).attr("data-slide-to", m + 1);
			}
			var l = 0;
			if(data.message != ""){
				for (var i = 0; i < data.books.length; i++){
						if(l < 1){
							var carouselLi = $(".itemSlide" + i);
							carouselLi.children().eq(l).attr("title", "<h1>" + data.books[i].bookname + "</h1><p>" + data.books[i].description + "</p>");
							carouselLi.children().eq(l).children().eq(0).attr("src", "img/" + data.books[i].isbn + "/" + data.books[i].cover);
							carouselLi.children().eq(l).children().eq(1).text(data.books[i].isbn);
							carouselLi.children().eq(l).children().eq(2).text("");
							for (var n = 0; n < data.books[i].tags.length; n++){
								var tag = carouselLi.children().eq(l).children().eq(2).text();
								carouselLi.children().eq(l).children().eq(2).text(tag + data.books[i].tags[n].tagname + "~");
							}
						}else{
							carouselLi.children().eq(0).clone(true).appendTo(carouselLi);							
							carouselLi.children().eq(l).attr("title", "<h1>" + data.books[i].bookname + "</h1><p>" + data.books[i].description + "</p>");
							carouselLi.children().eq(l).children().eq(0).attr("src", "img/" + data.books[i].isbn + "/" + data.books[i].cover);
							carouselLi.children().eq(l).children().eq(1).text(data.books[i].isbn);
							carouselLi.children().eq(l).children().eq(2).text("");
							for (var n = 0; n < data.books[i].tags.length; n++){
								var tag = carouselLi.children().eq(l).children().eq(2).text();
								carouselLi.children().eq(l).children().eq(2).text(tag + data.books[i].tags[n].tagname + "~");
							}
						}
						l++;
						if(l % 8 == 0 && i != (data.books.length - 1)){
							carouselLi.clone(true).appendTo(".carouselSlide");
							var firstCarouselLi = carouselLi.next().children().eq(0).detach();
							carouselLi.next().empty();
							firstCarouselLi.appendTo(carouselLi.next());
							carouselLi.next().removeClass("active").addClass("itemSlide" + (i + 1));
							l = 0;
						}
					
				}
			}else{
				$(".itemSlide").empty();
				$(".indicatorsSlide").empty();
			}
			$('[data-toggle="tooltip"]').tooltip();
			
			// Login Session
			if($("#loggedInUser").text() != ""){
				//alert($("#loggedInUser").text());
				//$("#logInWelcomeUsername").text($("#loggedInUser").text());
				//$("#indicator").text(localStorage[$("#logInWelcomeUsername").text() + "~indicatorNumber"]);
				$("#loginUsername").val($("#loggedInUser").text());
		        $("#loginPassword").val($("#loggedInPassword").text());
		        $("#loginSubmit").trigger("click");
		        
			}else{
				$(".buy-button").hide();
				$("#adminBooks").hide();
				$("#adminComments").hide();
				$("#logOutButton").hide();
				$("#checkOutButton").hide();
				$("#mainUserHeadshot").hide();
				//$(".submitISBN-button").hide();
				$("#guessYouLikeButton").hide();
				$(".commentHide").hide();
				$(".buy-buttonBrowseAll").hide();
				//alert(localStorage[$("#logInWelcomeUsername").text() + "~indicatorNumber"]);
				//alert(localStorage[$("#logInWelcomeUsername").text() + "~buyBooks"]);
				localStorage[$("#logInWelcomeUsername").text() + "~indicatorNumber"] = 0;
				localStorage[$("#logInWelcomeUsername").text() + "~buyBooks"] = "";
				localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"] = "";
				$("#indicator").text(localStorage[$("#logInWelcomeUsername").text() + "~indicatorNumber"]);
			}
		});
		
		// Call get() to query books on the dashboard
		$.get("dashboardbooks.html?" + "amount=100", function(data){
			//alert(data);
			if(data.message != "NoBooksFound."){
				for (var i = 0; i < data.books.length; i++){
					var li = $(".dashboardLi").children().eq(0);
					var filterLi = $(".dashboardFilterLi").children().eq(0);
					if (i < 1){		
						// add to more modal
						var img = li.children().eq(0); // img/img-6.jpg
						var bookinfo = img.next();						
						img.children().eq(0).children().eq(0).children().eq(0).children().eq(1).attr("src", "img/" + data.books[i].isbn + "/" + data.books[i].cover);
						bookinfo.children().eq(0).text(data.books[i].bookname);
						bookinfo.children().eq(1).text(data.books[i].isbn);
						bookinfo.children().eq(2).text("");
						for (var n = 0; n < data.books[i].tags.length; n++){
							var tag = bookinfo.children().eq(2).text();
							bookinfo.children().eq(2).text(tag + data.books[i].tags[n].tagname + "~");
						}
						bookinfo.children().eq(3).text("Price: " + data.books[i].price);
						bookinfo.children().eq(4).text("Transaction Amount: " + data.books[i].transactionAmount);
						bookinfo.children().eq(6).text("Author: " + data.books[i].author);
						var bookDate = new Date(data.books[i].released);
						bookinfo.children().eq(7).text("Issue Date: " + monthNames[bookDate.getMonth()] +" / " + bookDate.getDate() + " / " + bookDate.getFullYear());
						bookinfo.children().eq(8).text("Press: " + data.books[i].press);
						bookinfo.children().eq(9).text("ISBN: " + data.books[i].isbn);
						bookinfo.children().eq(10).text(data.books[i].isbn);
						// Update corresponding book tags
						var booktags = bookinfo.children().eq(11).children().eq(0);//.children().eq(0).children().eq(0);
						if (data.books[i].tags.length > 0){
							for (var n = 0; n < data.books[i].tags.length; n++){
								if (n < 1){
									booktags.children().eq(n).children().eq(0).text(data.books[i].tags[n].tagname);
								}else{
									booktags.children().eq(0).clone(true).appendTo(booktags);
									booktags.children().eq(n).children().eq(0).text(data.books[i].tags[n].tagname);
								}
							}
						}else{
							booktags.parent().empty();
						}
						//add to filter dashboard
						var filterImg = filterLi.children().eq(0);
						var filterBookinfo = filterImg.next();
						filterImg.children().eq(0).attr("src", "img/" + data.books[i].isbn + "/" + data.books[i].cover);
						filterBookinfo.children().eq(0).text(data.books[i].bookname);
						filterBookinfo.children().eq(1).text(data.books[i].isbn);
						filterBookinfo.children().eq(2).text("");
						for (var m = 0; m < data.books[i].tags.length; m++){
							var tag = filterBookinfo.children().eq(2).text();
							filterBookinfo.children().eq(2).text(tag + data.books[i].tags[m].tagname + "~");
						}
						filterBookinfo.children().eq(3).text("Author: " + data.books[i].author);
						filterBookinfo.children().eq(4).text("Price: " + data.books[i].price);
						filterBookinfo.children().eq(5).text("Transaction Amount: " + data.books[i].transactionAmount);
					}else{
						// add to more modal
						li.clone(true).appendTo(".dashboardLi");//clone!
						li = $(".dashboardLi").children().eq(i);
						img = li.children().eq(0);
						bookinfo = img.next();
						img.children().eq(0).children().eq(0).children().eq(0).children().eq(1).attr("src", "img/" + data.books[i].isbn + "/" + data.books[i].cover);
						bookinfo.children().eq(0).text(data.books[i].bookname);
						bookinfo.children().eq(1).text(data.books[i].isbn);
						bookinfo.children().eq(2).text("");
						for (var n = 0; n < data.books[i].tags.length; n++){
							var tag = bookinfo.children().eq(2).text();
							bookinfo.children().eq(2).text(tag + data.books[i].tags[n].tagname + "~");
						}
						bookinfo.children().eq(3).text("Price: " + data.books[i].price);
						bookinfo.children().eq(4).text("Transaction Amount: " + data.books[i].transactionAmount);
						bookinfo.children().eq(6).text("Author: " + data.books[i].author);
						bookDate = new Date(data.books[i].released);
						bookinfo.children().eq(7).text("Issue Date: " + monthNames[bookDate.getMonth()] +" / " + bookDate.getDate() + " / " + bookDate.getFullYear());
						bookinfo.children().eq(8).text("Press: " + data.books[i].press);
						bookinfo.children().eq(9).text("ISBN: " + data.books[i].isbn);
						bookinfo.children().eq(10).text(data.books[i].isbn);
						// Update corresponding book tags
						booktags = bookinfo.children().eq(11).children().eq(0);//.children().eq(0).children().eq(0);
						var firstTagLi = booktags.children().eq(0).detach();
						booktags.empty();
						firstTagLi.appendTo(booktags);
						if (data.books[i].tags.length > 0){
							for (var n = 0; n < data.books[i].tags.length; n++){
								if (n < 1){
									booktags.children().eq(n).children().eq(0).text(data.books[i].tags[n].tagname);
								}else{
									booktags.children().eq(0).clone(true).appendTo(booktags);
									booktags.children().eq(n).children().eq(0).text(data.books[i].tags[n].tagname);
								}
							}
						}else{
							booktags.parent().empty();
						}
						//add to filter dashboard
						filterLi.clone(true).appendTo(".dashboardFilterLi");//clone!
						filterLi = $(".dashboardFilterLi").children().eq(i);
						var filterImg = filterLi.children().eq(0);
						var filterBookinfo = filterImg.next();
						filterImg.children().eq(0).attr("src", "img/" + data.books[i].isbn + "/" + data.books[i].cover);
						filterBookinfo.children().eq(0).text(data.books[i].bookname);
						filterBookinfo.children().eq(1).text(data.books[i].isbn);
						filterBookinfo.children().eq(2).text("");
						for (var m = 0; m < data.books[i].tags.length; m++){
							var tag = filterBookinfo.children().eq(2).text();
							filterBookinfo.children().eq(2).text(tag + data.books[i].tags[m].tagname + "~");
						}
						filterBookinfo.children().eq(3).text("Author: " + data.books[i].author);
						filterBookinfo.children().eq(4).text("Price: " + data.books[i].price);
						filterBookinfo.children().eq(5).text("Transaction Amount: " + data.books[i].transactionAmount);
					}				
				}
			}else{
				$(".dashboardLi").empty();
				$(".dashboardFilterLi").empty();
			}
			
			// filter dashboard
			var filterDashboardBooks = $(".dashboardFilterLi").children();
			if(filterDashboardBooks.length > 4){
				filterDashboardBooks.css("display", "none");
				filterDashboardBooks.eq(0).css("display", "");
				filterDashboardBooks.eq(1).css("display", "");
				filterDashboardBooks.eq(2).css("display", "");
				filterDashboardBooks.eq(3).css("display", "");
			}
			
			// Call get() to query comments assciated with the queries books above
			$.get("querycomment.html?queryBookISBN=" + data.message, function(data) {
				//alert(data.comments.length);
				if(data.message != "No comments found."){
					// add comments to comment modal
					for (var i = 0; i < data.comments.length; i++){
						var li = $(".commentsLi").children().eq(0);
						if (i < 1){				
							li.children().eq(0).text(data.comments[i].username + ":   ");
							li.children().eq(2).text(data.comments[i].rate);
							var modalCommentDate = new Date(data.comments[i].time);
							li.children().eq(3).text("( " + monthNames[modalCommentDate.getMonth()] +" / " + modalCommentDate.getDate() + " / " + modalCommentDate.getFullYear() + " )");
							li.children().eq(4).text(data.comments[i].context);
							li.children().eq(5).text("ISBN: " + data.comments[i].isbn);
							li.children().eq(6).text(data.comments[i].isbn);
							li.children().eq(7).text(data.comments[i].c_id);
						}else{
							li.clone(true).appendTo(".commentsLi");//clone!
							li = $(".commentsLi").children().eq(i);
							li.children().eq(0).text(data.comments[i].username + ":   ");
							li.children().eq(2).text(data.comments[i].rate);
							modalCommentDate = new Date(data.comments[i].time);
							li.children().eq(3).text("( " + monthNames[modalCommentDate.getMonth()] +" / " + modalCommentDate.getDate() + " / " + modalCommentDate.getFullYear() + " )");
							li.children().eq(4).text(data.comments[i].context);
							li.children().eq(5).text("ISBN: " + data.comments[i].isbn);
							li.children().eq(6).text(data.comments[i].isbn);
							li.children().eq(7).text(data.comments[i].c_id);
						}							
					}
					// add filtered comments to book comments
					for(var j = 0; j < $(".commentsDiv").length; j++){
						var validCount = 0;
						var div = $(".commentsDiv").eq(j).children().eq(0);
						var bookIsbn = div.parent().parent().prev().children().eq(10).text();
						//alert("isbn: " + bookIsbn);
						for (var k = 0; k < data.comments.length;k++){													
							//alert("isbn: " + bookIsbn);
							if (validCount < 1){	
								//alert(data.comments[k].isbn);
								//alert(bookIsbn == data.comments[k].isbn);
								if (bookIsbn == data.comments[k].isbn){
									div.children().eq(0).text(data.comments[k].username + ":   ");
									div.children().eq(2).text(data.comments[k].rate);
									var bookCommentDate = new Date(data.comments[k].time);
									div.children().eq(3).text("( " + monthNames[bookCommentDate.getMonth()] +" / " + bookCommentDate.getDate() + " / " + bookCommentDate.getFullYear() + " )");
									div.children().eq(4).text(data.comments[k].context);
									div.children().eq(5).text(data.comments[k].isbn);
									validCount++;
								}else{
									
								}								
							}else{
								//alert(data.comments[k].isbn);
								//alert(bookIsbn == data.comments[k].isbn);
								if(bookIsbn == data.comments[k].isbn){
									//div.clone(true).insertBefore($(".filterDisplay").eq(j));//clone!
									div.clone(true).appendTo($(".commentsDiv").eq(j));//clone!
									div = $(".commentsDiv").eq(j).children().eq(validCount);
									div.children().eq(0).text(data.comments[k].username + ":   ");
									div.children().eq(2).text(data.comments[k].rate);
									bookCommentDate = new Date(data.comments[k].time);
									div.children().eq(3).text("( " + monthNames[bookCommentDate.getMonth()] +" / " + bookCommentDate.getDate() + " / " + bookCommentDate.getFullYear() + " )");
									div.children().eq(4).text(data.comments[k].context);
									div.children().eq(5).text(data.comments[k].isbn);
									validCount++;
								}else{
									
								}
							}
						}
						if(validCount == 0){
							$(".commentsDiv").eq(j).empty();
						}
						var filterCommentsDisplay = $(".commentsDiv").eq(j).children(".moreDisplayComments");
						if(filterCommentsDisplay.length > 2){
							filterCommentsDisplay.css("display", "none");
							filterCommentsDisplay.eq(0).css("display", "");
							filterCommentsDisplay.eq(1).css("display", "");
						}
					}
				}else{
					$(".commentsLi").empty();
					$(".commentsDiv").empty();
				}
				
				// Calculate the average score
				var bookEntries = $(".dashboardLi").children();
				var filterBookEntries = $(".dashboardFilterLi").children();
				for(var l = 0; l < bookEntries.length; l++){
					var averageComments = bookEntries.eq(l).children().eq(2).children().eq(2).children(".moreDisplayComments");
					var averageScore = 0;
					for (var m = 0; m < averageComments.length; m++){
						//alert("hui: " + averageComments.eq(m).children().eq(2).text());
						averageScore += parseInt(averageComments.eq(m).children().eq(2).text());
					}
					//alert(averageScore);
					averageScore = averageScore / averageComments.length;
					//alert(averageScore);
					bookEntries.eq(l).children().eq(1).children().eq(5).children().eq(1).text(averageScore);
					bookEntries.eq(l).children().eq(1).children().eq(5).children().eq(2).text("(" + averageComments.length + ")");
					filterBookEntries.eq(l).children().eq(1).children().eq(6).children().eq(1).text(averageScore);
					filterBookEntries.eq(l).children().eq(1).children().eq(6).children().eq(2).text("(" + averageComments.length + ")");
				}
				
				// Update Stars
				var score = $(".star");
				for(var i = 0; i < score.length; i++){
					var result = Math.round(parseInt(score.next()[i].innerHTML) / 2);
					var star = "&#x2605";
					var starResult = "";
					for(var j = 0; j < result; j++){
						starResult += star;
					}
					score[i].innerHTML = starResult;
				}
			});
		});
		
		// filter comments by isbn
		$(".filterCommentsSubmit").on("click", function(){
			$(".moreComments").css("display", "none");
			var filterISBN = $(this).parent().prev().children(":eq(10)").text();
			//alert(filterISBN);
			$(".filterComments:contains(" + filterISBN + ")").parent().css("display", "");
		});
		
		// Call get() to query books on the browse all
		$.get("jsonTest.html?" + "isbn=&bookname=&author=&category=&press=UMICH&releasedMin=&releasedMax=&priceMin=&priceMax=", function(data){
			//alert(data);
			if(data.message != "NoBooksFound."){
				for (var i = 0; i < data.books.length; i++){
					var li = $(".browseLi").children().eq(0);
					if (i < 1){		
						var img = li.children().eq(0).children().eq(0); // img/img-6.jpg
						var bookinfo = img.next();						
						img.children().eq(0).children().eq(0).children().eq(0).children().eq(1).attr("src", "img/" + data.books[i].isbn + "/" + data.books[i].cover);
						bookinfo.children().eq(0).text(data.books[i].bookname);
						bookinfo.children().eq(1).text(data.books[i].isbn);
						bookinfo.children().eq(2).text("");
						for (var n = 0; n < data.books[i].tags.length; n++){
							var tag = bookinfo.children().eq(2).text();
							bookinfo.children().eq(2).text(tag + data.books[i].tags[n].tagname + "~");
						}
						bookinfo.children().eq(4).text("Author: " + data.books[i].author);
						bookinfo.children().eq(5).text("Price: " + data.books[i].price);
						bookinfo.children().eq(6).text("Quantity: " + data.books[i].quantity);
						var bookDate = new Date(data.books[i].released);
						bookinfo.children().eq(7).text("Issue Date: " + monthNames[bookDate.getMonth()] +" / " + bookDate.getDate() + " / " + bookDate.getFullYear());
						bookinfo.children().eq(8).text("Press: " + data.books[i].press);
						bookinfo.children().eq(9).text("ISBN: " + data.books[i].isbn);
						bookinfo.children().eq(10).text(data.books[i].isbn);
						// Update corresponding book tags
						var booktags = li.children().eq(0).next().children().eq(0);//.children().eq(0).children().eq(0);
						if (data.books[i].tags.length > 0){
							for (var n = 0; n < data.books[i].tags.length; n++){
								if (n < 1){
									booktags.children().eq(n).children().eq(0).text(data.books[i].tags[n].tagname);
								}else{
									booktags.children().eq(0).clone(true).appendTo(booktags);
									booktags.children().eq(n).children().eq(0).text(data.books[i].tags[n].tagname);
								}
							}
						}else{
							booktags.parent().empty();
						}
						// Update book description
						li.children().eq(3).text(data.books[i].description);
					}else{
						// add to more modal
						li.clone(true).appendTo(".browseLi");//clone!
						li = $(".browseLi").children().eq(i);
						img = li.children().eq(0).children().eq(0);
						bookinfo = img.next();
						img.children().eq(0).children().eq(0).children().eq(0).children().eq(1).attr("src", "img/" + data.books[i].isbn + "/" + data.books[i].cover);
						bookinfo.children().eq(0).text(data.books[i].bookname);
						bookinfo.children().eq(1).text(data.books[i].isbn);
						bookinfo.children().eq(2).text("");
						for (var n = 0; n < data.books[i].tags.length; n++){
							var tag = bookinfo.children().eq(2).text();
							bookinfo.children().eq(2).text(tag + data.books[i].tags[n].tagname + "~");
						}
						bookinfo.children().eq(4).text("Author: " + data.books[i].author);
						bookinfo.children().eq(5).text("Price: " + data.books[i].price);
						bookinfo.children().eq(6).text("Quantity: " + data.books[i].quantity);
						var bookDate = new Date(data.books[i].released);
						bookinfo.children().eq(7).text("Issue Date: " + monthNames[bookDate.getMonth()] +" / " + bookDate.getDate() + " / " + bookDate.getFullYear());
						bookinfo.children().eq(8).text("Press: " + data.books[i].press);
						bookinfo.children().eq(9).text("ISBN: " + data.books[i].isbn);
						bookinfo.children().eq(10).text(data.books[i].isbn);
						// Update corresponding book tags
						booktags = li.children().eq(0).next().children().eq(0);//.children().eq(0).children().eq(0);
						var firstTagLi = booktags.children().eq(0).detach();
						booktags.empty();
						firstTagLi.appendTo(booktags);
						if (data.books[i].tags.length > 0){
							for (var n = 0; n < data.books[i].tags.length; n++){
								if (n < 1){
									booktags.children().eq(n).children().eq(0).text(data.books[i].tags[n].tagname);
								}else{
									booktags.children().eq(0).clone(true).appendTo(booktags);
									booktags.children().eq(n).children().eq(0).text(data.books[i].tags[n].tagname);
								}
							}
						}else{
							booktags.parent().empty();
						}
					}				
				}
			}else{
				$(".browseLi").empty();
			}
			
			
			// Call get() to query comments assciated with the queries books above
			$.get("querycomment.html?queryBookISBN=" + data.message, function(data) {
				//alert(data.comments.length);
				if(data.message != "No comments found."){
					// add filtered comments to book comments
					for(var j = 0; j < $(".commentsDivBrowseAll").length; j++){
						var validCount = 0;
						var div = $(".commentsDivBrowseAll").eq(j).children().eq(0);
						//var div = $(".browseLi").children().eq(j).children().eq(2).children().eq(2).children().eq(0); //browseLi
						var bookIsbn = div.parent().parent().prev().prev().children().eq(1).children().eq(10).text();
						//alert("isbn: " + bookIsbn);
						for (var k = 0; k < data.comments.length;k++){													
							//alert("isbn: " + bookIsbn);
							if (validCount < 1){	
								//alert(data.comments[k].isbn);
								//alert(bookIsbn == data.comments[k].isbn);
								if (bookIsbn == data.comments[k].isbn){
									div.children().eq(0).text(data.comments[k].username + ":   ");
									div.children().eq(2).text(data.comments[k].rate);
									var bookCommentDate = new Date(data.comments[k].time);
									div.children().eq(3).text("( " + monthNames[bookCommentDate.getMonth()] +" / " + bookCommentDate.getDate() + " / " + bookCommentDate.getFullYear() + " )");
									div.children().eq(4).text(data.comments[k].context);
									div.children().eq(5).text(data.comments[k].isbn);
									validCount++;
								}else{
									
								}								
							}else{
								//alert(data.comments[k].isbn);
								//alert(bookIsbn == data.comments[k].isbn);
								if(bookIsbn == data.comments[k].isbn){
									//div.clone(true).insertBefore($(".filterDisplayBrowseAll").eq(j));//clone!commentsDivBrowseAll
									div.clone(true).appendTo($(".commentsDivBrowseAll").eq(j));
									div = $(".commentsDivBrowseAll").eq(j).children().eq(validCount);
									//div = $(".browseLi").children().eq(j).children().eq(2).children().eq(2).children().eq(validCount);
									div.children().eq(0).text(data.comments[k].username + ":   ");
									div.children().eq(2).text(data.comments[k].rate);
									bookCommentDate = new Date(data.comments[k].time);
									div.children().eq(3).text("( " + monthNames[bookCommentDate.getMonth()] +" / " + bookCommentDate.getDate() + " / " + bookCommentDate.getFullYear() + " )");
									div.children().eq(4).text(data.comments[k].context);
									div.children().eq(5).text(data.comments[k].isbn);
									validCount++;
								}else{
									
								}
							}
						}
						if(validCount == 0){
							$(".commentsDivBrowseAll").eq(j).empty();
						}
					}
				}else{
					$(".commentsDivBrowseAll").empty();
				}
				
				// Calculate the average score
				var bookEntries = $(".browseLi").children();
				for(var l = 0; l < bookEntries.length; l++){
					var averageComments = bookEntries.eq(l).children().eq(2).children().eq(2).children(".moreDisplayCommentsBrowseAll");
					var averageScore = 0;
					for (var m = 0; m < averageComments.length; m++){
						//alert("hui: " + averageComments.eq(m).children().eq(2).text());
						averageScore += parseInt(averageComments.eq(m).children().eq(2).text());
					}
					//alert(averageScore);
					averageScore = averageScore / averageComments.length;
					//alert(averageScore);
					bookEntries.eq(l).children().eq(0).children().eq(1).children().eq(3).children().eq(1).text(averageScore);
					bookEntries.eq(l).children().eq(0).children().eq(1).children().eq(3).children().eq(2).text("(" + averageComments.length + ")");
				}
				
				// Update Stars
				var score = $(".star");
				for(var i = 0; i < score.length; i++){
					var result = Math.round(parseInt(score.next()[i].innerHTML) / 2);
					var star = "&#x2605";
					var starResult = "";
					for(var j = 0; j < result; j++){
						starResult += star;
					}
					score[i].innerHTML = starResult;
				}
			});
		});
		
	
		// Automatically alter the search criteria
		$(".search-candidate").on("click", function() {
			var activeItem = $("#search-criteria").text();
			$("#search-criteria").html($(this).text() + "<span class='caret'></span>");
			$(this).text(activeItem);
		});
	
		$("#search-button").on("click", function(){
			//alert($("#search-criteria").text());
			$("#advancedSearchForm").trigger("reset");
			$("#" + $("#search-criteria").text()).val($("#search-bar").val());
			$("#advancedSearchSubmit").trigger("click");
			$("#" + $("#search-criteria").text()).val("");
		});
		
		$("#signUpButton").click(function(){
			$("#signUpUsernameInfo").children().css("display", "none");
			$("#signUpEmailInfo").children().css("display", "none");
			$("#signupSubmit").removeAttr("disabled");
		});
		
		$("#signupUsername").on("blur", function(){
			//alert("blur");
			if($(this).val().length == 0){
				
			}else{
				$.post("checkusername.html",
				{
					username: $(this).val()
			    },
			    function(data, status){
			    	//alert("data.message: " + data != "EmailExists");
			    	if(data != "UsernameExists"){
			    		$("#signUpUsernameInfo").children().eq(0).css("display","");
					}else{
						$("#signUpUsernameInfo").children().eq(1).css("display","");
						$("#signupSubmit").attr("disabled","");
					}
				});
			}
		});
		
		$("#signupUsername").on("focus", function(){
			//alert("focus");
			$("#signUpUsernameInfo").children().eq(0).css("display","none");
			$("#signUpUsernameInfo").children().eq(1).css("display","none");
			$("#signupSubmit").removeAttr("disabled");
		});
		
		$("#Password").on("blur", function(){
			//alert("blur");
			if($(this).val().length == 0){
				
			}else{
				if($(this).val() == $("#signupPassword").val()){
					$("#signUpPasswordInfo").children().eq(0).css("display","");
				}else{
					$("#signUpPasswordInfo").children().eq(1).css("display","");
					$("#signupSubmit").attr("disabled","");
				}
			}
		});
		
		$("#Password").on("focus", function(){
			//alert("focus");
			$("#signUpPasswordInfo").children().eq(0).css("display","none");
			$("#signUpPasswordInfo").children().eq(1).css("display","none");
			$("#signupSubmit").removeAttr("disabled");
		});
		
		$("#signupEmail").on("blur", function(){
			//alert("blur");
			if($(this).val().length == 0){
				
			}else{
				$.post("checkemail.html",
				{
					email: $(this).val()
			    },
			    function(data, status){
			    	//alert("data.message: " + data != "EmailExists");
			    	if(data != "EmailExists"){
			    		$("#signUpEmailInfo").children().eq(0).css("display","");
					}else{
						$("#signUpEmailInfo").children().eq(1).css("display","");
						$("#signupSubmit").attr("disabled","");
					}
				});
			}
		});
		
		$("#signupEmail").on("focus", function(){
			//alert("focus");
			$("#signUpEmailInfo").children().eq(0).css("display","none");
			$("#signUpEmailInfo").children().eq(1).css("display","none");
			$("#signupSubmit").removeAttr("disabled");
		});
		
		$("#loginSubmit").click(function(){
			$("#logInErrorInfo").children().css("display", "none");
		    $.post("queryuser.html",
		    {
		        username: $("#loginUsername").val(),
		        password: $("#loginPassword").val(),
		    },
		    function(data, status){
		        //alert("Data: " + data + "\nStatus: " + status);	        
		        if(data.message == "userFound"){
		        	//alert(data.users[0].username);
		        	$("#logInWelcomeUsername").text(data.users[0].username);
		        	//$(".transactionEntries").parent().prev().text("Your Balance: " + data.users[0].balance);
		        	//$(".checkOutBookEntryUl").next().next().next().text("Your Balance: " + data.users[0].balance);
		        	$(".balance").text("Your Balance: " + data.users[0].balance);
		        	$("#calBalance").text(data.users[0].balance);
		        	$(".userHeadshot").attr("src", "img/" + data.users[0].username + "/" + data.users[0].image);
		        	if(typeof localStorage[$("#logInWelcomeUsername").text() + "~indicatorNumber"] == "undefined"){	
		        		localStorage[$("#logInWelcomeUsername").text() + "~indicatorNumber"] = 0;
		    		}
		        	if(typeof localStorage[$("#logInWelcomeUsername").text() + "~buyBooks"] == "undefined"){
		        		localStorage[$("#logInWelcomeUsername").text() + "~buyBooks"] = "";
		        	}
		        	if(typeof localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"] == "undefined"){
		        		localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"] = "";
		        	}		    					    			
		    		$("#indicator").text(localStorage[$("#logInWelcomeUsername").text() + "~indicatorNumber"]);
		    		
		        	//alert(localStorage[$("#logInWelcomeUsername").text() + "~indicatorNumber"]);
		    		//alert(localStorage[$("#logInWelcomeUsername").text() + "~buyBooks"]);
		    		$("#signUpButton").hide();
		    		$("#logInButton").hide();
		    		$("#adminBooks").hide();
					$("#adminComments").hide();
					$("#logOutButton").show();
		    		$(".buy-button").show();
		    		$("#checkOutButton").show();
					$("#mainUserHeadshot").show();
					$("#guessYouLikeButton").show();
					$(".commentHide").show();
					$(".buy-buttonBrowseAll").show();
					//$(".submitISBN-button").show();	        	
			        $("#loginClose").trigger("click");
			        //$("#logInWelcomeProfile").trigger("click");
		        }else if (data.message == "accountNotActivated"){
		        	$("#logInErrorInfo").children(":eq(1)").css("display", "");
		        }else if (data.message == "adminFound"){
		        	//alert("Welcome Admin");
		        	$("#signUpButton").hide();
		    		$("#logInButton").hide();
		        	$("#adminBooks").show();
					$("#adminComments").show();
					$("#logOutButton").show();
					$(".buy-button").hide();
					$(".commentHide").hide();
					//$(".submitISBN-button").hide();
					$("#checkOutButton").hide();
					$("#mainUserHeadshot").hide();
					$("#guessYouLikeButton").hide();
					$(".buy-buttonBrowseAll").hide();
					$("#loginClose").trigger("click");
		        }else{
		        	$("#logInErrorInfo").children(":eq(0)").css("display", "");
		        }
		    });			
		});
		
		$("#logOutButton").click(function(){
			$.post("logout.html",
		    {
		        username: $("#logInWelcomeUsername").text()
		    },
		    function(data, status){
		        //alert("Data: " + data + "\nStatus: " + status);	        
		        localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"] = "";
		        location.reload();
		    });
		});
		
		$("#mainUserHeadshot").click(function(event){
			$("#logInWelcomeProfile").trigger("click");
			event.preventDefault();
		});
		
		$("#loginClose").click(function(){
			$("#logInErrorInfo").children().css("display", "none");			
		});
		
		$("#addBalanceSubmit").on("click", function(){
			var added = $(this).prev().val();
			$.post("addbalance.html",
			{
				username: $("#loginUsername").val(),
				amount: added
		    },
		    function(data, status){
		    	if(data.message != "userNotFound"){
		    		$(".balance").text("Your Balance: " + data.users[0].balance);
		    		$("#calBalance").text(data.users[0].balance);
				}else{
					//alert("userNotFound");
				}
		    });
		});
		
		$("#checkTransactionsHistory").on("click", function(){
			// empty the first time result when you check twice
			var firstLi = $(".transactionEntries").children().eq(0).detach();
			$(".transactionEntries").empty();
			firstLi.appendTo(".transactionEntries");
			$.post("querytransaction.html",
			{
				username: $("#loginUsername").val()
		    },
		    function(data, status){
		    	if(data.message != "NoTransactionsFound."){
		    		for (var i = 0; i < data.transactions.length; i++){
						var li = $(".transactionEntries").children().eq(0);
						if (i < 1){										
							li.children().eq(0).text(data.transactions[i].username);
							li.children().eq(1).text(data.transactions[i].isbn);
							li.children().eq(2).text(data.transactions[i].bookname);
							var orderDate = new Date(data.transactions[i].orderDate);
							li.children().eq(3).text(monthNames[orderDate.getMonth()] +" / " + orderDate.getDate() + " / " + orderDate.getFullYear());
							li.children().eq(4).text(data.transactions[i].quantity);
							li.children().eq(5).text(data.transactions[i].price);
						}else{
							li.clone(true).appendTo(".transactionEntries");//clone!
							li = $(".transactionEntries").children().eq(i);
							li.children().eq(0).text(data.transactions[i].username);
							li.children().eq(1).text(data.transactions[i].isbn);
							li.children().eq(2).text(data.transactions[i].bookname);
							orderDate = new Date(data.transactions[i].orderDate);
							li.children().eq(3).text(monthNames[orderDate.getMonth()] +" / " + orderDate.getDate() + " / " + orderDate.getFullYear());
							li.children().eq(4).text(data.transactions[i].quantity);
							li.children().eq(5).text(data.transactions[i].price);
						}
					}
				}else{
					$(".transactionEntries").empty();
				}
		    });
		});
		
		$("#cartSubmit").on("click", function(){
			$("#logInWelcomeClose").trigger("click");
			$("#checkOutButton").trigger("click");
		});
		
		$("#checkOutButton").on("click", function(){
			$(".amountInput").val("0");
			$(".checkOutErrorInfo").css("display", "none");
			$("#priceTooMore").css("display", "none");
			$("#checkOutSubmit").removeAttr("disabled");
			// when check twice we need to empty the first result
			var firstLi = $(".checkOutBookEntryUl").children().eq(0).detach();
			$(".checkOutBookEntryUl").empty();
			firstLi.appendTo(".checkOutBookEntryUl");
			$.post("querylocalstoragebook.html",
			{
				isbn: localStorage[$("#logInWelcomeUsername").text() + "~buyBooks"]
		    },
		    function(data, status){
		    	totalPrice = 0.0;
		    	if(data.message != "NoBooksFound."){
					for (var i = 0; i < data.books.length; i++){
						var li = $(".checkOutBookEntryUl").children().eq(0);
						if (i < 1){				
							var img = li.children().eq(0); // img/img-6.jpg
							var bookinfo = img.next();
							//.children().eq(0).children().eq(0)						
							img.children().eq(0).children().eq(0).children().eq(0).children().eq(1).attr("src", "img/" + data.books[i].isbn + "/" + data.books[i].cover);
							bookinfo.children().eq(0).text(data.books[i].bookname);
							bookinfo.children().eq(1).text("Author: " + data.books[i].author);
							var bookDate = new Date(data.books[i].released);
							bookinfo.children().eq(2).text("Issue Date: " + monthNames[bookDate.getMonth()] +" / " + bookDate.getDate() + " / " + bookDate.getFullYear());
							bookinfo.children().eq(3).text("Press: " + data.books[i].press);
							bookinfo.children().eq(4).text("ISBN: " + data.books[i].isbn);
							bookinfo.children().eq(5).text(data.books[i].isbn);
							bookinfo.children().eq(6).text("Price: " + data.books[i].price);
							bookinfo.children().eq(7).text("Quantity: " + data.books[i].quantity);
							bookinfo.children().eq(8).text(data.books[i].quantity);
							var bookinfo1 = bookinfo.next();					
							bookinfo1.children().eq(3).text("Subtotal: " + data.books[i].price);
							bookinfo1.children().eq(0).text(data.books[i].price);
							bookinfo1.children().eq(4).text(data.books[i].price);
						}else{
							li.clone(true).appendTo(".checkOutBookEntryUl");//clone!
							li = $(".checkOutBookEntryUl").children().eq(i);
							img = li.children().eq(0);
							bookinfo = img.next();
							img.children().eq(0).children().eq(0).children().eq(0).children().eq(1).attr("src", "img/" + data.books[i].isbn + "/" + data.books[i].cover);
							bookinfo.children().eq(0).text(data.books[i].bookname);
							bookinfo.children().eq(1).text("Author: " + data.books[i].author);
							bookDate = new Date(data.books[i].released);
							bookinfo.children().eq(2).text("Issue Date: " + monthNames[bookDate.getMonth()] +" / " + bookDate.getDate() + " / " + bookDate.getFullYear());
							bookinfo.children().eq(3).text("Press: " + data.books[i].press);
							bookinfo.children().eq(4).text("ISBN: " + data.books[i].isbn);
							bookinfo.children().eq(5).text(data.books[i].isbn);
							bookinfo.children().eq(6).text("Price: " + data.books[i].price);
							bookinfo.children().eq(7).text("Quantity: " + data.books[i].quantity);
							bookinfo.children().eq(8).text(data.books[i].quantity);
							var bookinfo1 = bookinfo.next();					
							bookinfo1.children().eq(3).text("Subtotal: " + data.books[i].price);
							bookinfo1.children().eq(0).text(data.books[i].price);
							bookinfo1.children().eq(4).text(data.books[i].price);
						}
					}
				}else{
					$(".checkOutBookEntryUl").empty();
				}
		    	for (var i = 0; i < $(".checkOutBookEntryUl").children().length; i++){
		    		var priceBlock = $(".checkOutBookEntryUl").children().eq(i).children().eq(2).children().eq(0);
		    		//alert(priceBlock.text());
		    		var subTotal = parseFloat(priceBlock.text()) * parseFloat(priceBlock.next().next().children().eq(0).val());
		    		priceBlock.next().next().next().text("Subtotal: " + subTotal);
		    		priceBlock.next().next().next().next().text(subTotal);
		    		totalPrice += subTotal;
		    	}
				$("#totalPrice").text("Total: " + totalPrice);
		    });		
		});
		
		$("#checkOutSubmit").on("click", function(){
			if($(".checkOutBookEntryUl").children().length > 0){
				var checkOutISBN = "";
				var checkOutQuantities = "";
				var checkOutSubtotal = "";
				for (var i = 0; i < $(".checkOutBookEntryUl").children().length; i++){
		    		var checkOutBlock = $(".checkOutBookEntryUl").children().eq(i);
		    		checkOutISBN += checkOutBlock.children().eq(1).children().eq(5).text() + "~";
		    		//alert(checkOutISBN);
		    		checkOutQuantities += checkOutBlock.children().eq(2).children().eq(2).children().eq(0).val() + "~";
		    		//alert(checkOutQuantities);
		    		checkOutSubtotal += checkOutBlock.children().eq(2).children().eq(4).text() + "~";
		    		//alert(checkOutSubtotal);
		    		//totalPrice += parseFloat(priceBlock.children().eq(2).children().eq(1).text());
		    	}
				$.post("savetransaction.html",
				{
					isbn: checkOutISBN,
					username: $("#logInWelcomeUsername").text(),
					quantity: checkOutQuantities,
					price: checkOutSubtotal
			    },
			    function(data, status){
			    	if(data.message != "NoTransactionsFound."){
						$(".balance").text("Your Balance: " + data.message);
						$("#calBalance").text(data.message);
						localStorage[$("#logInWelcomeUsername").text() + "~indicatorNumber"] = 0;
						localStorage[$("#logInWelcomeUsername").text() + "~buyBooks"] = "";
						$("#indicator").text(localStorage[$("#logInWelcomeUsername").text() + "~indicatorNumber"]);
					}else{
						$(".transactionEntries").empty();
					}
				});
			}else{
				//alert("You didn't buy anything!");	
			}
		});
				
		$(".amountInput").on("focus", function(){
			//alert("focus!");
			$(this).parent().next().next().next().css("display", "none");
			$("#priceTooMore").css("display", "none");
			$("#checkOutSubmit").removeAttr("disabled");			
		});
		
		$(".amountInput").on("blur", function(){
			//alert("blur!");
			totalPrice = 0.0;
			if (parseFloat($(this).val()) > parseFloat($(this).parent().parent().prev().children().eq(8).text())){
				//$("#amountTooMore").css("display", "");
				$(this).parent().next().next().next().css("display", "");
				$("#checkOutSubmit").attr("disabled", "");
			}
			var subtotal = $(this).val() * parseFloat($(this).parent().prev().prev().text());
			//alert(subtotal);
			$(this).parent().next().text("Subtotal: " + subtotal);
			$(this).parent().next().next().text(subtotal);
			//alert($(".checkOutBookEntryUl").children().length);
			for (var i = 0; i < $(".checkOutBookEntryUl").children().length; i++){
	    		var priceBlock = $(".checkOutBookEntryUl").children().eq(i).children().eq(2).children().eq(4);
	    		//alert(priceBlock.text());
	    		totalPrice += parseFloat(priceBlock.text());
	    	}
			$("#totalPrice").text("Total: " + totalPrice);
			$("#totalPrice").next().text(totalPrice);
			if(parseFloat($("#totalPrice").next().text()) > parseFloat($("#calBalance").text())){
				$("#priceTooMore").css("display", "");
				$("#checkOutSubmit").attr("disabled", "");
			}
		});
		
		$(".buy-button").on("click", function(){
			//alert($(this).parent().prev().children().eq(1).text());
			//alert($(this).parent().prev().children().eq(2).text());
			localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"] += $(this).parent().prev().children().eq(2).text();
			//alert(localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"]);
			if (localStorage[$("#logInWelcomeUsername").text() + "~buyBooks"].indexOf($(this).parent().prev().children().eq(1).text() + "~") > -1){
				
			}else{
				localStorage[$("#logInWelcomeUsername").text() + "~buyBooks"] += $(this).parent().prev().children().eq(1).text() + "~";
				localStorage[$("#logInWelcomeUsername").text() + "~indicatorNumber"]++;
			}			
			$(this).css({"background-color":"rgba(109,192,102,0.7)"});
			$(this).text("Done!");
			$("#indicator").text(localStorage[$("#logInWelcomeUsername").text() + "~indicatorNumber"]);
		});
		
		$(".buy-buttonBrowseAll").on("click", function(){
			//alert($(this).prev().text());
			localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"] += $(this).parent().children().eq(2).text();
			//alert(localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"]);
			if (localStorage[$("#logInWelcomeUsername").text() + "~buyBooks"].indexOf($(this).prev().text() + "~") > -1){
				
			}else{
				localStorage[$("#logInWelcomeUsername").text() + "~buyBooks"] += $(this).prev().text() + "~";
				localStorage[$("#logInWelcomeUsername").text() + "~indicatorNumber"]++;
			}			
			$(this).css({"background-color":"rgba(109,192,102,0.7)"});
			$(this).text("Done!");
			$("#indicator").text(localStorage[$("#logInWelcomeUsername").text() + "~indicatorNumber"]);
		});
		
		$(".remove-button").on("click", function(){
			//alert($(this).parent().prev().prev().children().eq(8).text());
			totalPrice = 0.0;
			//alert($(this).parent().prev().children().eq(5).text());
			$(this).css({"background-color":"rgba(255,68,68,0.7)"});
			$(this).text("Done!");
			localStorage[$("#logInWelcomeUsername").text() + "~indicatorNumber"]--;
			$("#indicator").text(localStorage[$("#logInWelcomeUsername").text() + "~indicatorNumber"]);	
			//alert(totalPrice);
			//alert($(this).prev().text());
			//alert(parseFloat($(this).prev().text()));
			//totalPrice = totalPrice - parseFloat($(this).prev().text());
			//alert(totalPrice);
			//$("#totalPrice").text("Total: " + totalPrice);
			var str = localStorage[$("#logInWelcomeUsername").text() + "~buyBooks"];
			localStorage[$("#logInWelcomeUsername").text() + "~buyBooks"] = str.replace($(this).parent().prev().children().eq(5).text() + "~", "");
			$(this).parentsUntil("li").parent().remove();
			for (var i = 0; i < $(".checkOutBookEntryUl").children().length; i++){
	    		var priceBlock = $(".checkOutBookEntryUl").children().eq(i).children().eq(2).children().eq(4);
	    		//alert(priceBlock.text());
	    		totalPrice += parseFloat(priceBlock.text());
	    	}
			$("#totalPrice").text("Total: " + totalPrice);
		});
		
		$("#lookInsideButton").click(function(){
			//alert($(this).parent().parent().parent().parent().next().children().eq(8).text());
			localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"] += $(this).parent().parent().parent().parent().next().children().eq(2).text();
			//alert(localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"]);
			$.get("jsonTest.html?" + "isbn=" + $(this).parent().parent().parent().parent().next().children().eq(10).text() + "&bookname=&author=&category=&press=&releasedMin=&releasedMax=&priceMin=&priceMax=", function(data) {
				//alert(data.books.length);
				$(".lookInsideLi").prev().text(data.books[0].description);
				$(".lookInsideLi").prev().prev().text(data.books[0].bookname);
				if(data.books[0].content1 != null || data.books[0].content2 != null || data.books[0].content3 != null){
					if(data.books[0].content1 != null){
						$(".lookInsideLi").children().eq(0).children().eq(0).attr("src", "img/" + data.books[0].isbn + "/" + data.books[0].content1);
					}else{
						$(".lookInsideLi").children().eq(0).children().eq(0).attr("src", "");
					}
					if(data.books[0].content2 != null){
						$(".lookInsideLi").children().eq(1).children().eq(0).attr("src", "img/" + data.books[0].isbn + "/" + data.books[0].content2);
					}else{
						$(".lookInsideLi").children().eq(1).children().eq(0).attr("src", "");
					}
					if(data.books[0].content1 != null){
						$(".lookInsideLi").children().eq(2).children().eq(0).attr("src", "img/" + data.books[0].isbn + "/" + data.books[0].content3);
					}else{
						$(".lookInsideLi").children().eq(2).children().eq(0).attr("src", "");
					}
				}else{
					$(".lookInsideLi").children().eq(0).children().eq(0).attr("src", "");
					$(".lookInsideLi").children().eq(1).children().eq(0).attr("src", "");
					$(".lookInsideLi").children().eq(2).children().eq(0).attr("src", "");
				} 
			});
		});
		
		$("#checkOutLookInsideButton").click(function(){
			$.get("jsonTest.html?" + "isbn=" + $(this).parent().parent().parent().parent().next().children().eq(5).text() + "&bookname=&author=&category=&press=&releasedMin=&releasedMax=&priceMin=&priceMax=", function(data) {
				//alert(data.books.length);
				$(".lookInsideLi").prev().text(data.books[0].description);
				$(".lookInsideLi").prev().prev().text(data.books[0].bookname);
				if(data.books[0].content1 != null || data.books[0].content2 != null || data.books[0].content3 != null){
					if(data.books[0].content1 != null){
						$(".lookInsideLi").children().eq(0).children().eq(0).attr("src", "img/" + data.books[0].isbn + "/" + data.books[0].content1);
					}else{
						$(".lookInsideLi").children().eq(0).children().eq(0).attr("src", "");
					}
					if(data.books[0].content2 != null){
						$(".lookInsideLi").children().eq(1).children().eq(0).attr("src", "img/" + data.books[0].isbn + "/" + data.books[0].content2);
					}else{
						$(".lookInsideLi").children().eq(1).children().eq(0).attr("src", "");
					}
					if(data.books[0].content1 != null){
						$(".lookInsideLi").children().eq(2).children().eq(0).attr("src", "img/" + data.books[0].isbn + "/" + data.books[0].content3);
					}else{
						$(".lookInsideLi").children().eq(2).children().eq(0).attr("src", "");
					}
				}else{
					$(".lookInsideLi").children().eq(0).children().eq(0).attr("src", "");
					$(".lookInsideLi").children().eq(1).children().eq(0).attr("src", "");
					$(".lookInsideLi").children().eq(2).children().eq(0).attr("src", "");
				} 
			});
		});
		
		$("#browseAllLookInsideButton").click(function(){
			localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"] += $(this).parent().parent().parent().parent().next().children().eq(2).text();
			//alert(localStorage[$("#logInWelcomeUsername").text() + "~guessBooks"]);
			$.get("jsonTest.html?" + "isbn=" + $(this).parent().parent().parent().parent().next().children().eq(1).text() + "&bookname=&author=&category=&press=&releasedMin=&releasedMax=&priceMin=&priceMax=", function(data) {
				//alert(data.books.length);
				$(".lookInsideLi").prev().text(data.books[0].description);
				$(".lookInsideLi").prev().prev().text(data.books[0].bookname);
				if(data.books[0].content1 != null || data.books[0].content2 != null || data.books[0].content3 != null){
					if(data.books[0].content1 != null){
						$(".lookInsideLi").children().eq(0).children().eq(0).attr("src", "img/" + data.books[0].isbn + "/" + data.books[0].content1);
					}else{
						$(".lookInsideLi").children().eq(0).children().eq(0).attr("src", "");
					}
					if(data.books[0].content2 != null){
						$(".lookInsideLi").children().eq(1).children().eq(0).attr("src", "img/" + data.books[0].isbn + "/" + data.books[0].content2);
					}else{
						$(".lookInsideLi").children().eq(1).children().eq(0).attr("src", "");
					}
					if(data.books[0].content1 != null){
						$(".lookInsideLi").children().eq(2).children().eq(0).attr("src", "img/" + data.books[0].isbn + "/" + data.books[0].content3);
					}else{
						$(".lookInsideLi").children().eq(2).children().eq(0).attr("src", "");
					}
				}else{
					$(".lookInsideLi").children().eq(0).children().eq(0).attr("src", "");
					$(".lookInsideLi").children().eq(1).children().eq(0).attr("src", "");
					$(".lookInsideLi").children().eq(2).children().eq(0).attr("src", "");
				} 
			});
		});
		
	
	
	</script>

</body>
</html>