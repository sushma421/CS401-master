function minmax(i) {

		var week1 = document.getElementsByClassName("week1");

		if ((week1[i].value > 8) || (week1[i].value < 0)) {
			week1[i].style.borderColor = "red";
			document.getElementById("validate").disabled = true;

			//alert("Work hours should not exceed 8 hrs/day")
			return false;
		}

		else {

			week1[i].style.borderColor = "skyblue";
			document.getElementById("validate").disabled = false;

			return true;
		}

	}
	function minmax2(i) {

		var week2 = document.getElementsByClassName("week2");
		if ((week2[i].value > 8) || (week2[i].value < 0)) {
			week2[i].style.borderColor = "red";
			document.getElementById("validate").disabled = true;

			return false;
		}

		else {
			week2[i].style.borderColor = "skyblue";
			document.getElementById("validate").disabled = false;

			return true;

		}
	}

	function calculateTotal() {

		var week1 = document.getElementsByClassName("week1");
		var week2 = document.getElementsByClassName("week2");

		var num1 = week1.length;
		var total1 = 0;
		for ( var i = 0; i < num1; i++) {
			if ((week1[i].value) == '') {
				week1[i].value = 0;
				total1 += parseInt(week1[i].value);
			} else {
				total1 += parseInt(week1[i].value);

			}
		}
		document.getElementById("totweek1").value = total1;

		var num2 = week2.length;
		var total2 = 0;
		for ( var i = 0; i < num2; i++) {
			if ((week2[i].value) == '') {
				week2[i].value = 0;
				total2 += parseInt(week2[i].value);
			} else {
				total2 += parseInt(week2[i].value);

			}
		}
		document.getElementById("totweek2").value = total2;

		document.getElementById("totweek").value = total1 + total2;

		document.getElementById("submit").disabled = false;
	}