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
	window.getNextPage = function () {	
		$.get('photos/page/' + nextMaxId)
			.done(function(data) { 
				console.log(data);
				nextMaxId = data.next_max_id

				// append new images
				var $feedCon = $("#userFeedCon");
				data.photos.forEach(function (photo) {
					console.log(photo);
					var $username = $("<div class='username'>" + photo.user.username + "</div>");
					var $likes = $("<div class='feed-likes'>" + "Likes " + photo.likes.count + "</div>");
					var $img = $("<div class='feed-img'><img src=\"" +
												photo.images.standard_resolution.url + "\" ></div>");
					
					
					$img.append($likes).append($username);
					$feedCon.append($img);
				});
			});
	}
	$(window).on("scroll", function () {
		console.log($(document).height() / $(window).scrollTop());
		if (  $(window).scrollTop() /$(document).height()  < 0.8 ) {
			getNextPage();
		}
	});
	getNextPage();
});
