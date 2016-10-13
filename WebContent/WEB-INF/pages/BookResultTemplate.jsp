<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BookResultTemplate</title>
</head>
<body>
	<li class = "container-fluid col-lg-12 col-md-12 col-sm-12 col-xs-12 book-entry">
		<div class = "col-lg-2 col-md-2 col-sm-12 col-xs-12">
			<a data-toggle="tooltip" title="<h1>Good!</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris malesuada turpis metus, vitae fermentum mauris imperdiet ut. Suspendisse aliquam</p>" data-placement="right" data-html = "true" data-container = "body">
				<img class = "img-responsive book-picture" src = "img/img-6.jpg" style = "top:0;">
			</a>
		</div>
		<div class = "col-lg-3 col-md-3 col-sm-12 col-xs-12">
			<h3> {{customer.name}} </h3>
			<p>	Price: 23 </p>
			<p> Quantity: 34 </p>
			<div class="book-rating">
				<span class = "star">&#x2605;&#x2605;&#x2605;&#x2605;&#x2605;</span>&nbsp;&nbsp;&nbsp;<span class = "score">9.8</span>&nbsp;<span class = "score-people">(4)</span>							
			</div>
			<p> Author: Johanna Basford </p>													
			<p> Issue Date: 2014-10 </p>
			<p> Press: Princeton University Press </p>
			<p> ISBN: 017645326413 </p>
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
			<h4> wangshiy:</h4>&nbsp;<span class = "star">☆☆☆☆☆</span>&nbsp;&nbsp;&nbsp;<span class = "score">9.8</span>
			<p>Lorem ipsum dolor sit amet, vestibulum et, eros bibendum est. Vestibulum nunc numquam, odio accumsan malesuada.</p>
			<h4> wangshiy:</h4>&nbsp;<span class = "star">☆☆☆☆☆</span>&nbsp;&nbsp;&nbsp;<span class = "score">9.8</span>
			<p>Lorem ipsum dolor sit amet, vestibulum et, eros bibendum est. Vestibulum nunc numquam, odio accumsan malesuada.</p>
			<button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#myModal-more">More</button>
		</div>
		<div class = "col-lg-1 col-md-1 col-sm-12 col-xs-12">
			<br>
			<br>
			<button type="button" class="btn btn-default navbar-btn buy-button">Buy</button>
			<button type="button" class="btn btn-default navbar-btn remove-button">Remove</button>
			<button type="button" class="btn btn-default navbar-btn" data-toggle="modal" data-target="#myModal-comment">Comment</button>
		</div>
	</li>
</body>
</html>