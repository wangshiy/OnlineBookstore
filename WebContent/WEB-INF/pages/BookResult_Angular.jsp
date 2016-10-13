<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title> Result </title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type = "text/css">
	<link href="${pageContext.request.contextPath}/css/detail.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
	<script src="${pageContext.request.contextPath}/js/angular.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

	
</head>
<body ng-app = "bookApp">

	<p id = "queryBook">${bookInfo}<p>

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
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label class="control-label col-sm-2" for="ISBN">ISBN:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control modal-form" id="ISBN" placeholder="Enter ISBN...">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Bookname">Bookname:</label>
							<div class="col-sm-10"> 
								<input type="text" class="form-control modal-form" id="Bookname" placeholder="Enter Bookname...">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Author">Author:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control modal-form" id="Author" placeholder="Enter Author...">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Press">Press:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control modal-form" id="Press" placeholder="Enter Press...">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Issue Date">Issue Date:</label>
							<div class="col-sm-10">
								<input type="date" class="form-control modal-form" id="Issue Date" placeholder="Enter Issue Date (MM/DD/YYYY)...">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Price">Price:</label>
							<div class="col-sm-5">
								<input type="number" min="0" max="500" class="form-control modal-form" id="minPrice" placeholder="Enter Min Price(0~500)...">
							</div>
							<div class="col-sm-5">
								<input type="number" min="0" max="500" class="form-control modal-form" id="maxPrice" placeholder="Enter Max Price(0~500)...">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Rating">Rating:</label>
							<div class="col-sm-5">
								<input type="number" min="0" max="10" class="form-control modal-form" id="minRating" placeholder="Enter Min Rating(0~10)...">
							</div>
							<div class="col-sm-5">
								<input type="number" min="0" max="10" class="form-control modal-form" id="maxRating" placeholder="Enter Max Rating(0~10)...">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default go">Submit</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	
	<!-- Modal Sign Up -->
	<div id="myModal-signUp" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Sign Up</h4>
				</div>
				<div class="modal-body">
					<form id = "signUpForm" class="form-horizontal" role="form" enctype = "multipart/form-data">
						<div class="form-group">
							<label class="control-label col-sm-2" for="Username">Username:</label>
							<div class="col-sm-10">
								<input name = "username" type="text" class="form-control modal-form" id="signupUsername" placeholder="Enter Username...">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Password">Password:</label>
							<div class="col-sm-10"> 
								<input name = "password" type="password" class="form-control modal-form" id="signupPassword" placeholder="Enter Password...">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Password">Re-enter Password:</label>
							<div class="col-sm-10"> 
								<input type="password" class="form-control modal-form" id="Password" placeholder="Enter Password...">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Email">Email:</label>
							<div class="col-sm-10">
								<input name = "email" type="email" class="form-control modal-form" id="signupEmail" placeholder="Enter Email...">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Headshot">Headshot:</label>
							<div class="col-sm-10">
								<input type="file" class="form-control modal-form" id="signupHeadshot" data-show-preview="true" data-show-upload="true" data-show-caption="true" placeholder="Upload Headshot...">
							</div>
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
	
	<!-- Modal Log In Welcome -->
	<div id="myModal-logInWelcome" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Welcome Back!</h4>
					<h4 class="modal-title" id = "logInWelcomeUsername">wangshiy</h4>
				</div>
				<div class="modal-body">
					<img src = "img/img-6.jpg" style = "width: 150px; height:200px; margin:0 auto; display:block; border-radius:15%;"/>
					<div style = "display:block; text-align:center; margin-top: 20px;">
						<button type="button" class="btn btn-default">Look Around</button>
						<button type="button" class="btn btn-default">Add More Balance</button>
						<button type="button" class="btn btn-default">Check Out</button>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#myModal-logInWelcome" id = "logInWelcomeProfile" >Profile</button>
	
	
	<!-- Modal Comment -->
	<div id="myModal-comment" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Comment</h4>
				</div>
				<div class="modal-body">
					<form action="savecomment.html" method="post" class="form-horizontal" role="form">
						<div class="form-group">
							<label class="control-label col-sm-2" for="Username">Username:</label>
							<div class="col-sm-10">
								<input name = "username" type="text" class="form-control modal-form" id="commentUsername" placeholder="Enter Username..." value = "wangshiy" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Username">ISBN:</label>
							<div class="col-sm-10">
								<input name = "isbn" type="text" class="form-control modal-form" id="commentISBN" placeholder="Enter ISBN..." readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2" for="Rating">Rating:</label>
							<div class="col-sm-10">
								<input name = "rating" type="number" min="0" max="10" class="form-control modal-form" id="commentRating" placeholder="Enter Rating(0~10)...">
							</div>
						</div>
						<div class="form-group">
            				<label class="control-label col-sm-2" for="message-text">Comment:</label>
            				<textarea name = "content" maxlength = "100" class="form-control" id="commentContent" placeholder="Enter Your Comment..."></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-default go" id = "commentSubmit" ng-controller = "commentListCtrl" ng-click = "saveComment()">Submit</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<div class = "header container-fluid col-lg-12 col-md-12 col-sm-12 col-xs-12" style = "background-color: rgba(51,51,51,0.98);">
	
    <nav class="navbar navbar-default container-fluid">

				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="container-fluid navbar-header col-lg-2 col-md-2 col-sm-2 col-xs-0">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="container-fluid navbar-brand" href="#"><img id = "logo" src = "img/logo.png"/></a>
				</div>
				
			<div class = "container-fluid navbar-header col-lg-7 col-md-6 ol-sm-6 col-xs-6">	
				<div class = "searchbox">
					<div class="input-group">
						<input type="text" class="form-control" id = "search-bar" aria-label="...">
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
								<button class="btn btn-default go" id = "search-button" type="button">Go!</button>
							</span>
						</input>
					</div><!-- /input-group -->
				</div>
			</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="container-fluid collapse navbar-collapse col-lg-3 col-md-4 ol-sm-4 col-xs-6" id="bs-example-navbar-collapse-1">    
					<ul class="nav navbar-nav navbar-right">
						<li><button type="button" class="btn btn-default navbar-btn nav-button" data-toggle="modal" data-target="#myModal-signUp">Sign up</button></li>
						<li><button type="button" class="btn btn-default navbar-btn nav-button" data-toggle="modal" data-target="#myModal-logIn">Log in</button></li>
						<li><button type="button" class="btn btn-default navbar-btn nav-button"><span class = "glyphicon glyphicon-shopping-cart"></span>&nbsp;(<span id = "indicator">0</span>)</button></li>						
					</ul>
				</div><!-- /.navbar-collapse -->

		</nav>
	
	</div>
	
	<div class = "dashboard container-fluid col-lg-12 col-md-12 col-sm-12 col-xs-12" ng-controller = "bookListCtrl">
		
		<!-- Modal More -->
		<div id="myModal-more" class="modal fade" role="dialog">
			<div class="modal-dialog">
	
				<!-- Modal content-->
				<div class="modal-content">
					
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Comments</h4>
					</div>
					<div class="modal-body" >
						<input id = "searchText" ng-model="searchText"/>
						<li style = "list-style-type: none;" class = "moreComments" ng-repeat = "comment in comments | filter: searchText">
							<h4> {{comment.username}}:</h4>&nbsp;<span class = "star">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;<span class = "score">{{comment.rate}}</span>
							<p>{{comment.context}}</p>
							<p>ISBN: {{comment.isbn}}<p>
							<p class = "filterComments">{{comment.isbn}}<p>
						</li>
						<h4> wangshiy:</h4>&nbsp;<span class = "star">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;<span class = "score">9.8</span>
						<p>Lorem ipsum dolor sit amet, vestibulum et, eros bibendum est. Vestibulum nunc numquam, odio accumsan malesuada quisque sollicitudin vehicula viverra, duis sit fusce suspendisse eget.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class = "container-fluid slide-title">
			<h2 class = "title"> Best Sales Books </h2>
			<hr>
		</div>
			<div class = "container">
				<ul style = "list-style-type: none;">
					<li class = "container-fluid col-lg-12 col-md-12 col-sm-12 col-xs-12 book-entry" ng-repeat = "book in books">
						<div class = "col-lg-2 col-md-2 col-sm-12 col-xs-12">
							<a data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body"><img class = "img-responsive book-picture" src = "img/img-6.jpg" style = "top:0;"></a>
						</div>
						<div class = "col-lg-3 col-md-3 col-sm-12 col-xs-12">
							<h3> {{book.bookname}} </h3>
							<p>	Price: {{book.price}} </p>
							<p> Quantity: {{book.quantity}} </p>
							<div class="book-rating">
								<span class = "star">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;<span class = "score">6.8</span>&nbsp;<span class = "score-people">(4)</span>							
							</div>
							<p> Author: {{book.author}} </p>													
							<p> Issue Date: {{book.released}} </p>
							<p> Press: {{book.press}} </p>
							<p> ISBN: {{book.isbn}} </p>
							<p>{{book.isbn}}</p>
							<div class = "book-tag">
								<ul>
								<li class="tag"><a href="http://www.douban.com/tag/小说/?focus=book">Novel</a></li>
								<li class="tag"><a href="http://www.douban.com/tag/随笔/?focus=book">Popular</a></li>
								<li class="tag"><a href="http://www.douban.com/tag/散文/?focus=book">Science Fiction</a></li>
								<ul>
							</div>
						</div>
						<div class = "col-lg-5 col-md-5 col-sm-12 col-xs-12">
							<h3> Comments </h3>
							<hr>
							<div>
								<div class = "moreDisplayComments" ng-repeat = "comment in comments">
									<h4> {{comment.username}}:</h4>&nbsp;<span class = "star">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;<span class = "score">{{comment.rate}}</span>
									<p>{{comment.context}}</p>
									<p class = "filterDisplayComments">{{comment.isbn}}</p>
								</div>
								<button type="button" class="btn btn-default navbar-btn filterDisplay" ng-click = "filterDisplayComments($event)">Filter Display</button>
							</div>
							<button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#myModal-more" ng-click = "filterComments($event)">More</button>
						</div>
						<div class = "col-lg-1 col-md-1 col-sm-12 col-xs-12">
							<br>
							<br>
							<button type="button" class="btn btn-default navbar-btn buy-button" ng-click = "bookBuy($event)">Buy</button>
							<button type="button" class="btn btn-default navbar-btn remove-button" ng-click = "bookRemove($event)">Remove</button>
							<button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#myModal-comment" ng-click = "submitISBN($event)" >Comment</button>							
						</div>
					</li>				
				</ul>
			</div>
		</div>
	
	
	
	<div class = "footer container-fluid col-lg-12 col-md-12 col-sm-12 col-xs-12" style = "background-color: rgba(51,51,51,0.98);">
	
	    <h2 style = "text-align:center;color:red;">Join Us On</h2>
	    <ul class="list-layout list-inline" style = "text-align:center;">
				<li><a href="https://www.facebook.com/airbnb">Facebook</a></li>
	      <li><a href="https://plus.google.com/+airbnb">Google+</a></li>
	      <li><a href="https://twitter.com/airbnb">Twitter</a> </li>
				<li><a href="https://www.linkedin.com/company/airbnb">LinkedIn</a></li>
	      <li><a href="https://www.pinterest.com/airbnb/">Pinterest</a></li>
	      <li><a href="http://www.youtube.com/airbnb">YouTube</a></li>
	      <li><a href="https://www.instagram.com/airbnb">Instagram</a></li>
	    </ul>
	    <div class="space-top-2 text-muted" style = "text-align:center;">
	      &copy; Mercury Systems Inc.
	    </div>
	
	</div>
	
	<script>
	

		var queryBook = $("#queryBook").text();
		alert(queryBook);
		var bookApp = angular.module('bookApp', []);
		bookApp.controller('bookListCtrl', function($scope, $http){
			$http.post("savecomment.html", {
		        "isbn": "1",
		        "username": "wangshiy",
		        "rating": "5",
		        "content": "haha"
		    }).success(function(data){$scope.comments = data.comments; console.log(data.comments);});
			$http.get("jsonTest.html?" + queryBook,{headers: {'Accept': 'application/json;odata=verbose'}})
			.success(function(data){
				$scope.books = data.books;
				$http.get("querycomment.html?queryBookISBN=" + data.message)
				.success(function(data){$scope.comments = data.comments;});
				//$(".filterDisplay").trigger("click");
			});
			$scope.submitISBN = function(event){
				alert($(event.target).parent().prev().prev().children(":eq(8)").text());
				$("#commentISBN").attr("value",$(event.target).parent().prev().prev().children(":eq(8)").text());		
			};
			$scope.filterDisplayComments = function(event){
				alert($(event.target).siblings().length);
				$(event.target).prevAll().css("display", "none");
				var filterDisplayISBN = $(event.target).parent().parent().prev().children(":eq(8)").text();
				alert(filterDisplayISBN);
				var count = 2;
				for (var i = 0; count > 0 && i < $(event.target).siblings().length; i++){
					var target = $(event.target).parent().children().eq(i).children().eq(4);
					if (target.text() == filterDisplayISBN){
						count--;
						target.parent().css("display", "");
					}
					//$(event.target).parent().children()[2]":eq(2):contains(" + filterDisplayISBN + ")").parent().css("display", "");
				}
				//alert($(event.target).parent().children().eq(0).children().eq(4).text() == filterDisplayISBN); //.children().eq(0).children(":eq(4)").text());
				//$(event.target).prev().children(":eq(2):contains(" + filterDisplayISBN + ")").parent().css("display", "");
				//$(".filterDisplayComments:contains(" + filterDisplayISBN + ")").parent().css("display", "");
			};
			$scope.filterComments = function(event){
				$(".moreComments").css("display", "none");
				var filterISBN = $(event.target).parent().prev().children(":eq(8)").text();
				alert(filterISBN);
				$("#searchText").val(filterISBN);
				$(".filterComments:contains(" + filterISBN + ")").parent().css("display", "");
			};
			$scope.bookBuy = function(event){
				$(event.target).css({"background-color":"rgba(109,192,102,0.7)"});
				$(event.target).text("Done!");
			};
			$scope.bookRemove = function(event){
				$(event.target).css({"background-color":"rgba(109,192,102,0.7)"});
				$(event.target).text("Done!");
				$(event.target).parentsUntil("li").parent().remove();
			};
			//$(".filterDisplay").trigger("click");
			/*$(".remove-button").on("click", function(){
				$(this).css({"background-color":"rgba(255,68,68,0.7)"});
				$(this).text("Done!");
				//localStorage.indicatorNumber--;
				//$("#indicator").text(localStorage.indicatorNumber);
				//$(this).parentsUntil("li").parent().remove();
			});*/
		}); 
		bookApp.controller('commentListCtrl', function($scope, $http){
			$scope.saveComment = function(){
			$http.post("savecomment.html", {
			        "isbn": $("#commentISBN").val(),
			        "username": $("#commentUsername").val(),
			        "rating": $("#commentRating").val(),
			        "content": $("#commentContent").val()
			    }).then(function(data){$scope.comments = data.comments; console.log(data.comments);});
				location.reload();
			};
		});
		
		$(window).bind("load", function() {
			$(".filterDisplay").trigger("click");
		});
		//alert("hi");
		//$(".filterDisplay").trigger("click");
		
		$(".search-candidate").on("click", function() {
			var activeItem = $("#search-criteria").text();
			$("#search-criteria").html($(this).text() + "<span class='caret'></span>");
			$(this).text(activeItem);
		});
		
		var score = $(".star");
		for(var i = 0; i < score.length; i++){
			var result = Math.round(score.next()[i].innerHTML / 2);
			var star = "&#x2605";
			var starResult = "";
			for(var j = 0; j < result; j++){
				starResult += star;
			}
			score[i].innerHTML = starResult;
		}
		
		$("#signupSubmit").click(function(){
			alert($('input[type=file]').val());
			//alert($("#signupHeadshot").val());
		    $.post("saveuser.html",
		    {
		        username: $("#signupUsername").val(),
		        password: $("#signupPassword").val(),
		        email: $("#signupEmail").val(),
		        image: $("#signupHeadshot").val()
		    },
		    function(data, status){
		        alert("Data: " + data + "\nStatus: " + status);
		    });			
		});
		
		$("#loginSubmit").click(function(){
			$("#logInErrorInfo").children().css("display", "none");
		    $.post("queryuser.html",
		    {
		        username: $("#loginUsername").val(),
		        password: $("#loginPassword").val(),
		    },
		    function(data, status){
		        alert("Data: " + data + "\nStatus: " + status);	        
		        if(data.message == "userFound"){
		        	alert(data.users[0].username);
		        	$("#logInWelcomeUsername").text(data.users[0].username);
			        $("#loginClose").trigger("click");
			        $("#logInWelcomeProfile").trigger("click");
		        }else{
		        	$("#logInErrorInfo").children(":eq(0)").css("display", "");
		        }
		    });			
		});
		
		$("#loginClose").click(function(){
			$("#logInErrorInfo").children().css("display", "none");			
		});
		
		/*$("#commentSubmit").click(function(){
		    $.post("savecomment.html",
		    {
		        isbn: $("#commentISBN").val(),
		        username: $("#commentUsername").val(),
		        rating: $("#commentRating").val(),
		        content: $("#commentContent").val()
		    },
		    function(data, status){
		        alert("Data: " + data + "\nStatus: " + status);
		    });
		});*/
		
			
	</script>
	
	

</body>
</html>