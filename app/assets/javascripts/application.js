// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function () {
	var nextMaxId = 0;
	var count = 0;

	var renderPhotos = function (data){
		var $feedCon = $("#userFeedCon").addClass("row");
		data.photos.reduce(function ($group, photo, index) {
			console.log(photo);
			var $row = $("<div>").addClass("row")
			var $col = $("<div>").addClass("col-md-4")
		  var $img = $row.clone().append($("<div class='feed-img col-md-12'><img src=\""  + photo.images.standard_resolution.url + "\" ></div>"));
			var $username = $row.clone().append($("<div class='col-md-12 username'>" + photo.user.username + "</div>"));
			var $likes = $row.clone().append($("<div class='col-md-12 feed-likes'>" + "Likes " + photo.likes.count + "</div>"));
			var caption = photo.caption ? photo.caption.text : "";
			var $comments = $("<div class='comments row'><div class='col-md-12'>" + caption+ "</div></div>");
		

			$photoGroup = $col.append($img.append($username).append($likes).append($comments));
			$photoGroup.addClass("photoGroup");
			if (index < 2 || (index) % 3) {
				return $group.append($photoGroup)
			} else {
				$feedCon.append($group);
				return $row.clone().append($photoGroup);
			}
		}, $("<div>").addClass("row"));
	}

	window.getNextPage = function () {

		$.get('photos/page/' + nextMaxId)
			.done(function(data) { 
				console.log(data);
				nextMaxId = data.next_max_id

				// append new images
				renderPhotos(data)
			});
	}
	$(window).on("scroll", function () {
		console.log($(document).height() / $(window).scrollTop());
		if (  $(window).scrollTop() /$(document).height()  > 0.8 ) {
			getNextPage();
		}
	});
	getNextPage();
});
