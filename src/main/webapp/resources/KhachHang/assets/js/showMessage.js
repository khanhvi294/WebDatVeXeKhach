if ($(".alert-flag").attr("aType")) {
	alertify.notify($(".alert-flag").attr("aMessage"), $(".alert-flag").attr("aType"), 5, function() { console.log('dismissed'); });
	alertify.set('notifier', 'position', 'bot-right');
	$(".alert-flag").attr("aType","");
	$(".alert-flag").attr("aMessage", "");
}