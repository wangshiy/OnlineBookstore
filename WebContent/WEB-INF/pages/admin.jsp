 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.js"></script>
<script src="${pageContext.request.contextPath}/js/angular.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/ImageDisplay.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
	<style>
		.yansanImg{
			width:175px;
			height:200px;
			margin-top:10px;
			margin-right:10px;
		}
	</style>
</head>
<body ng-app="ysApp" ng-controller="ysBookForm">
	<!-- Button trigger modal -->
	<ul class="list-inline">
		<li>
			<div class="dropdown">
				<p id="dLabel" class="btn btn-default dropdown-toggle" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Books <span class="caret"></span>
				</p>
				<ul class="dropdown-menu" aria-labelledby="dLabel">
					<li><a role="button" data-toggle="modal" data-target="#ysBookModal"
						ng-click="setModalType('add')">Add</a></li>
					<li><a role="button" data-toggle="modal" data-target="#ysBookModal"
						ng-click="setModalType('edit')">Edit</a></li>
					<li><a role="button" data-toggle="modal" data-target="#ysBookModal"
						ng-click="setModalType('delete')">Delete</a></li>
					<li role="separator" class="divider"></li>
					<li><a role="button" data-toggle="modal" data-target="#ysBookModal"
						ng-click="setModalType('all')">All</a></li>
				</ul>
			</div>
		</li>
		<li>
			<div class="dropdown">
				<p id="dLabel" class="btn btn-default dropdown-toggle" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Comments <span class="caret"></span>
				</p>
				<ul class="dropdown-menu" aria-labelledby="dLabel">
					<li><a role="button" data-toggle="modal" data-target="#ysCommentModal"
						ng-click="commentDropdown.reportedComments.getAllReportedComments()">Reported Comments <span class="badge">{{commentDropdown.reportedComments.reportedNumber}}</span></a></li>
				</ul>
			</div>
		</li>
	</ul>
	
	<!--Book Modal -->
	<div class="modal fade" id="ysBookModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">{{modal.title}}</h4>
				</div>
				<div class="modal-body">
					<section ng-show="modal.searchSectionShow">
						<form class="form-inline" action="book/get.html" method="get"
							enctype="multipart/form-data">
							<div class="form-group">
								<input type="text" class="form-control"
									ng-change="process('Search')" ng-model="isbn" ng-autoFocus="modal.searchSectionShow" name="isbn"
									id="inputISBN" list="isbn" placeholder="ISBN">
								<datalist id="isbn">
									<option ng-repeat="book in books" value="{{book.isbn}}">
								</datalist>
							</div>
							<input type="submit" class="btn btn-default"
								ng-click="process('Get')($event)" id="inputSubmit"
								value="Search">
						</form>
						<hr ng-show="modal.formSectionShow">
						<p id="noResult"></p>
					</section>
					<section ng-show="modal.formSectionShow">
						<form id="ysForm" enctype="multipart/form-data">
							<div class="form-group">
								<label>ISBN</label> <input type="text" class="form-control"
									name="isbn" value="{{book.isbn}}" id="isbnIput" autofocus>
							</div>
							<div class="form-group">
								<label>Name</label> <input type="text" class="form-control"
									name="bookname" value="{{book.bookname}}">
							</div>
							<div class="form-group">
								<label>Series</label> <input type="text" class="form-control"
									name="series" value="{{book.series}}">
							</div>
							<div class="form-group">
								<label>Tags</label> <input type="checkbox" name="tagNames[]"
									value="tag1" ng-checked="tagInputChecked('tag1')">tag1
								<input type="checkbox" name="tagNames[]" value="tag2"
									ng-checked="tagInputChecked('tag2')">tag2 <input
									type="checkbox" name="tagNames[]" value="tag3"
									ng-checked="tagInputChecked('tag3')">tag3
							</div>
							<div class="form-group">
								<label>Author</label> <input type="text" class="form-control"
									name="author" value="{{book.author}}">
							</div>
							<div class="form-group">
								<label>Press</label> <input type="text" class="form-control"
									name="press" value="{{book.press}}">
							</div>
							<div class="form-group">
								<label>Released</label> <input type="date" class="form-control"
									name="releasedSql" value="{{book.released}}">
							</div>
							<div class="form-group">
								<label>Price</label> <input type="number" class="form-control"
									name="price" value="{{book.price}}">
							</div>
							<div class="form-group">
								<label>Quantity</label> <input type="number"
									class="form-control" name="quantity" value="{{book.quantity}}">
							</div>
							<div class="form-group">
								<label>Cover</label> <input type="file" name="coverImage"
									ng-show="book.cover==null" id="imageInput">
								<div id="imagePreview"></div>
							</div>
							<div class="form-group">
								<label>Content</label> <input type="file" name="contentImages[]"
									multiple ng-show="book.content1==null" id="imagesInput">
								<div id="imagesPreview"></div>
							</div>
							<div class="form-group">
								<label>Description</label>
								<textarea class="form-control" name="description" rows="3">{{book.description}}</textarea>
							</div>
						</form>
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
								<th>
									<a role="button" ng-click="order('isbn')">ISBN</a>
									<span class="glyphicon glyphicon-triangle-bottom" ng-show="predicate==='isbn' && reverse===false"></span>
									<span class="glyphicon glyphicon-triangle-top" ng-show="predicate==='isbn' && reverse===true"></span>
								</th>
								<th>
									<a role="button" ng-click="order('bookname')">Name</a>
									<span class="glyphicon glyphicon-triangle-bottom" ng-show="predicate==='bookname' && reverse===false"></span>
									<span class="glyphicon glyphicon-triangle-top" ng-show="predicate==='bookname' && reverse===true"></span>
								</th>
								<th>
									<a role="button" ng-click="order('author')">Author</a>
									<span class="glyphicon glyphicon-triangle-bottom" ng-show="predicate==='author' && reverse===false"></span>
									<span class="glyphicon glyphicon-triangle-top" ng-show="predicate==='author' && reverse===true"></span>
								</th>
								<th>
									<a role="button" ng-click="order('price')">Price</a>
									<span class="glyphicon glyphicon-triangle-bottom" ng-show="predicate==='price' && reverse===false"></span>
									<span class="glyphicon glyphicon-triangle-top" ng-show="predicate==='price' && reverse===true"></span>
								</th>
								<th></th>
							</tr>
   							<tr ng-mouseover="showglyphicon=true"  ng-mouseleave="showglyphicon=false" ng-repeat="book in books  | filter: query | orderBy: predicate:reverse" class="alert" role="alert">
     							<td>{{book.isbn}}</td>
								<td>{{book.bookname}}</td>
								<td>{{book.author}}</td>								
								<td>{{book.price}}</td>
								<td style="text-align:center;">
									<button ng-show="showglyphicon" ng-click="process('DeleteOneOfBooks')(book.isbn)" type="button" class="close" data-dismiss="alert" aria-label="Close">
     									<span style="color:red;"  aria-hidden="true">&times;</span>
     								</button>
   								</td>
							</tr>
						</table>
					</section>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						ng-show="modal.formSectionShow"
						ng-click="process(modal.btnText)('#ysForm')" data-dismiss="modal">{{modal.btnText}}</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Comment Modal -->
	<div class="modal fade" id="ysCommentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">Reported Comments</h4>
	      </div>
	      <div class="modal-body">
	      	<table class="table table-striped">
							<tr>
								<th>
									<a role="button"></a>
								</th>
								<th>
									<a role="button">Comment</a>
								</th>
								<th></th>
								<th></th>
							</tr>
   							<tr ng-mouseover="showglyphicon=true"  ng-mouseleave="showglyphicon=false" ng-repeat="comment in commentModal.content |orderBy: 'isbn'" class="alert" role="alert">
     							<td>{{$index+1}}</td>
								<td>{{comment.context}}</td>
								<td style="text-align:center;">
									<button ng-show="showglyphicon" ng-click="commentModal.process('SHOW')(comment.c_id)" type="button" class="close" data-dismiss="alert" aria-label="Close">
     									<span style="color:red;" class="glyphicon glyphicon-ok" title="Hide"  aria-hidden="true"></span>
     								</button>
   								</td>
   								<td style="text-align:center;">
									<button ng-show="showglyphicon" ng-click="commentModal.process('HIDE')(comment.c_id)" type="button" class="close" data-dismiss="alert" aria-label="Close">
     									<span class=" glyphicon glyphicon-remove" title="Show" aria-hidden="true"></span>
     								</button>
   								</td>
							</tr>
						</table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	
	<script type="text/javascript">
		//display images
		var image=Image("#imageInput","#imagePreview");
		image.displayImage();
		$("#imagePreview").delegate( "img", "click", function() {
	 		$("#imageInput")[0].click();
		});
		var images=Image("#imagesInput","#imagesPreview");
		images.displayImage();
		$("#imagesPreview").delegate( "img", "click", function() {
			//$("#imagesPreview").empty();
	 		$("#imagesInput")[0].click();
		});
	</script>
	<script>
		var ysModule = angular.module("ysApp", []);
		ysModule.controller("ysBookForm",function($scope, $http) {
			$scope.commentModal={
					title:null,
					content:null,
					process:function(type){
						return function(commentId){
							switch(type){
								case "HIDE":
									$http.post("comment/hide.html",commentId).success(function(response){
										var temple=$scope.commentDropdown.reportedComments.reportedNumber;
										if(temple>0){
											temple--;
										}else{
											temple=0;
										}
										$scope.commentDropdown.reportedComments.reportedNumber=temple;
									});
									break;
								case "SHOW":
									$http.post("comment/show.html",commentId).success(function(response){
										var temple=$scope.commentDropdown.reportedComments.reportedNumber;
										if(temple>0){
											temple--;
										}else{
											temple=0;
										}
										$scope.commentDropdown.reportedComments.reportedNumber=temple;
									});
									break;
								case "REPORT":
									$http.post("comment/report.html",commentId);
									break;
							}
						};
					}
			};
			$scope.commentDropdown={
					init:(function(){
						$http.get("comment/numberOfReportedComments.html").success(function(response){
							$scope.commentDropdown.reportedComments.reportedNumber=response;
						});
					})(),
					reportedComments:{
						reportedNumber:0,
						getAllReportedComments:function(){
							$http.get("comment/getAllReportedComments.html").success(function(response){
								$scope.commentModal.content=response;
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
				$scope.book = null;
				$scope.books = null;
				$scope.tagInputChecked = false;
				document.getElementById("noResult").innerHTML = "";
				document.getElementById("ysForm").reset();
				//end
				$scope.modal = (function(type) {
					switch (type) {
					case "add":
						//modal add page
						return modalInit("Add a Book", false,
								true, false,"Add");
						break;
					case "edit":
						//modal edit page
						return modalInit("Edit a Book", true,
								false, false,"Update");
						break;
					case "delete":
						//modal delete page
						return modalInit("Delete a Book", true,
								false, false,"Delete");
						break;
					case "all":
						//all the books info
						$http.get("book/all.html")
							.success(function(resopnse) {
									$scope.books = resopnse;
								});
						//modal tabel page
						return modalInit("All Books", false,
								false,true, "");
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
						doPost(formId, "book/add.html",
								function(response) {
									alert(response+" has been saved!");
								});
					};
					break;
				case "Update":
					//used for form section
					//click the Update btn, update the book
					return function(formId) {
						doPost(formId, "book/update.html",
								function(response) {
									alert(response);
								});
					};
					break;
				case "Delete":
					//used for form seciton
					//click the delete btn, delete a book
					return function() {
						$http.get(
							"book/delete.html?isbn="
									+ $scope.isbn).success(
							function(resopnse) {
								$scope.book=null;
							});
					};
					break;
				case "DeleteOneOfBooks":
					//used for form seciton
					//click the delete btn, delete a book
					return function(isbn) {
						$http.get("book/delete.html?isbn="+ isbn)
						.success(function(resopnse) {
							for(var i=0;i<$scope.books.length;i++){
								if($scope.books[i].isbn===isbn){
									$scope.books.splice(i,1);
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
						$http.get("book/get.html?isbn="+ $scope.isbn)
								.success(function(resopnse) {
									if (resopnse) {
										$scope.book = resopnse;
										//here has a bug for the date
										
										$scope.book.released= parseDate($scope.book.released);
										//$scope.date="2014-05-06";
										$scope.tagInputChecked = function(value) {
											return isChecked(value,$scope.book.tags);
										};
										document.getElementById("imagePreview").innerHTML = "<img class='img-thumbnail yansanImg' src='img/"+$scope.book.isbn+"/"+$scope.book.cover+"'>";

										document.getElementById("imagesPreview").innerHTML = "<img class='img-thumbnail yansanImg' src='img/"+$scope.book.isbn+"/"+$scope.book.content1+"'>"+
										"<img class='img-thumbnail yansanImg' src='img/"+$scope.book.isbn+"/"+$scope.book.content2+"'>"+
										"<img class='img-thumbnail yansanImg' src='img/"+$scope.book.isbn+"/"+$scope.book.content3+"'>";
										$scope.modal.formSectionShow = true;
									} else {
										$scope.modal.formSectionShow = false;
										document
												.getElementById("noResult").innerHTML = "<span style='color:red;'>No Result!</span>";
									}
								});
						$event.preventDefault();
					};
					break;
				case "Search":
					// used for search section, 
					//search books that like a isbn 				
					$http.get(
							"book/search.html?isbn="
									+ $scope.isbn).success(
							function(resopnse) {
								$scope.books = resopnse;
							});
					break;
				}
			};
			//used to sort the result
			$scope.predicate=null,
			$scope.reverse=false,
			$scope.order=function(predicate){
				$scope.reverse = ($scope.predicate === predicate) ? !$scope.reverse : false;
				$scope.predicate = predicate;
			};
		});
		function isChecked(tagName, tags) {
			for ( var i = 0; i < tags.length; i++) {
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
				url : "/Project_Bookstore_XML/" + url,
				type : "POST",
				data : fd,
				processData : false,
				contentType : false,
				success : function(response) {
					handleResult(response);
				}
			});
		}
		function modalInit(title, searchSectionShow, formSectionShow,tableSectionShow,btnText) {
			return {
				title : title,
				searchSectionShow : searchSectionShow,
				formSectionShow : formSectionShow,
				tableSectionShow:tableSectionShow,
				btnText : btnText
			};
		}
		function parseDate(value){
			var date=new Date(value);
			var year=date.getFullYear();
			var month=(date.getMonth()+1)%12;
			var date=date.getDate();
			if(month<10){
				month="0"+month;
			}
			if(date<10){
				date="0"+date;
			}
			return year+"-"+month+"-"+date;
		}
	</script>
</body>
</html>