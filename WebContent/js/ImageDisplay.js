var Image=function(imageInputId,imageDivId){	
	var imageType = /^image\//;
	var imagesInput=$(imageInputId).get(0);
	var imagesPreview=$(imageDivId).get(0);
	return {
		test: function(){
			alert("Test: from ImageDisplay");
		},
		displayImage:function (){
			imagesInput.addEventListener("change", function(e){	
				var files=imagesInput.files;
				$(imageDivId).empty();
				for (var i = 0; i < files.length; i++) {
					var file = files[i];
					if (!imageType.test(file.type)) {
						continue;
					}
					
					var img = document.createElement("img");
					img.classList.add("img-thumbnail");
					img.style.height = "200px";
					img.style.width = "175px";
					img.style.marginTop = "10px";
					img.style.marginRight = "10px";
					img.file = file;
					imagesPreview.appendChild(img);
					var reader = new FileReader();
					reader.onload = (function(aImg) { return function(e) { aImg.src = e.target.result; }; })(img);
					reader.readAsDataURL(file);
				}
				imagesInput.style.display = "none";
				e.preventDefault();
			});
		},
		replace: function(){
			
		},
		removeAll:function(){
			//remove all images in image Div 
			var nodes=imagesPreview.childNodes;
			for(var i=nodes.length-1;i>=0;i--){
				imagesPreview.removeChild(nodes[i]);
			}
		},
		removeImage:function(index){
			//remove the image with index
			imagesPreview.removeChild(imagesPreview.childNodes[index]);
		}
	};
}