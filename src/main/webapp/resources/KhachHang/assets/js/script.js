const containers = document.querySelector(".containers");
const seats = document.querySelectorAll(".rows .seat:not(.sold)");
const count = document.getElementById("count");
const total = document.getElementById("total");
const carSelect = document.getElementById("car");

populateUI();

let ticketPrice = +carSelect.value;



// Save selected car index and price
function setcarData(carIndex, carPrice) {
  localStorage.setItem("selectedcarIndex", carIndex);
  localStorage.setItem("selectedcarPrice", carPrice);
}

// Update total and count
function updateSelectedCount() {
  const selectedSeats = document.querySelectorAll(".rows .seat.selected");

  const seatsIndex = [...selectedSeats].map((seat) => [...seats].indexOf(seat));

  localStorage.setItem("selectedSeats", JSON.stringify(seatsIndex));

  const selectedSeatsCount = selectedSeats.length;

  count.innerText = selectedSeatsCount;
  total.innerText = selectedSeatsCount * ticketPrice;

  setcarData(carSelect.selectedIndex, carSelect.value);
}




// Get data from localstorage and populate UI
function populateUI() {
  const selectedSeats = JSON.parse(localStorage.getItem("selectedSeats"));

  if (selectedSeats !== null && selectedSeats.length > 0) {
    seats.forEach((seat, index) => {
      if (selectedSeats.indexOf(index) > -1) {
        console.log(seat.classList.add("selected"));
      }
    });
  }

  const selectedcarIndex = localStorage.getItem("selectedcarIndex");

  if (selectedcarIndex !== null) {
    carSelect.selectedIndex = selectedcarIndex;
    console.log(selectedcarIndex)
  }
}
console.log(populateUI())
// car select event
carSelect.addEventListener("change", (e) => {
  ticketPrice = +e.target.value;
  setcarData(e.target.selectedIndex, e.target.value);
  updateSelectedCount();
});

// Seat click event
containers.addEventListener("click", (e) => {
  if (
    e.target.classList.contains("seat") &&
    !e.target.classList.contains("sold")
  ) {
    e.target.classList.toggle("selected");

    updateSelectedCount();
  }
});

// Initial count and total set
updateSelectedCount();


$(document).ready(function() {
	var formheight = $("#form-wrapper").height();
	var formleftheight = $("#form-left-wrapper").height();
	var currentformpage = "shipping";
	var paymentbody = $("#payment-body");
	var confirmationbody = $("#confirmation-body");
	var shippingbody = $("#shipping-body");
	var currentformpagediv;
	
	// Variable decleration to check whether information has been submitted on each page. //
	var shippingstatus = false;
	var paymentstatus = false;
	var confirmationstatus = false;

	function shippingPageInit() {
		paymentbody.hide();
		confirmationbody.hide();
		shippingbody.fadeIn(700);
	}
	function paymentPageInit() {
		confirmationbody.hide();
		shippingbody.hide();
		paymentbody.fadeIn(700);
	}
	function confirmationPageInit() {
		shippingbody.hide();
		paymentbody.hide();
		confirmationbody.fadeIn(700);
	}
	// Getting the prices and adding them together to get the total //
	var cartprice = $(".cart-price");
	var cartitemcount = cartprice.length - 1;
	var cartitempricelist = [];
	function getSum(total, num) {
		return total + num;
	}
	cartprice.each(function() {
		cartitempricelist.push($(this).html());
	});
	var converttofloat = cartitempricelist.join(" ").split(" ").map(Number);
	$(".cart-price-total").html(converttofloat.reduce(getSum));
	// Changing form screen when user clicks on the form tabs //
	$(".tab-menu-item").click(function() {
		$("#form-left-wrapper").css({ "min-height": "278px" });
		$(".tab-menu-item").removeClass("current");
		if ($(this).hasClass("current")) {
			return false;
		} else {
			$(this).toggleClass("current");
			var currenttab = $(this).html();
			if (currenttab == "Shipping") {
				currentformpage = "shipping";
				shippingPageInit();
				currentformpagediv = "#" + currentformpage + "-body";
			} else if (currenttab == "Payment") {
				currentformpage = "payment";
				paymentPageInit();
				currentformpagediv = "#" + currentformpage + "-body";
			} else if (currenttab == "Confirmation") {
				currentformpage = "confirmation";
				confirmationPageInit();
				currentformpagediv = "#" + currentformpage + "-body";
			}
		}
	});
	$(".form-input-checkbox, #shipping-checkbox").click(function() {
		var checkbox = document.getElementById("shipping-checkbox");
		if (checkbox.checked == true) {
			checkbox.checked = false;
		} else {
			checkbox.checked = true;
		}
	});
	function nextPageForm() {
		$(".tab-menu-item").removeClass("current");
		if (currentformpage == "shipping") {
			$(".payment-tab").addClass("current");
			$("#shipping-body").hide();
			$("#confirmation-body").hide();
			$("#payment-body").fadeIn(700);
			currentformpage = "payment";
		} else if (currentformpage == "payment") {
			$(".confirmation-tab").addClass("current");
			$("#shipping-body").hide();
			$("#payment-body").hide();
			$("#confirmation-body").fadeIn(700);
			currentformpage = "confirmation";
		} else {
			$(".confirmation-tab").addClass("current");
		}
	}

	function checkValidation(i) {
		nextPageForm();
	}

	$("#form-wrapper").submit(function(event) {
		event.preventDefault();
		checkValidation(currentformpage);
	});
});

